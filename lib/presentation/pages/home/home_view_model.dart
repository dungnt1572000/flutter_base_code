import 'package:baseproject/data/services/network_service/api_constant.dart';
import 'package:baseproject/presentation/domain/use_case/get_driving_direction_object_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/get_searching_object_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/get_walking_direction_object_use_case.dart';
import 'package:baseproject/presentation/pages/home/home_state.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:baseproject/ultilities/route_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(
    this.getSearchingObjectUseCase,
    this.getDrivingDirectionObjectUseCase,
    this.getWalkingDirectionObjectUseCase,
  ) : super(HomeState());

  GetSearchingObjectUseCase getSearchingObjectUseCase;
  GetWalkingDirectionObjectUseCase getWalkingDirectionObjectUseCase;
  GetDrivingDirectionObjectUseCase getDrivingDirectionObjectUseCase;
  void upDateCurrentSpeed(double currentSpeed) {
    state = state.copyWith(currentSpeed: currentSpeed);
  }

  void upDateCurrentLocationAndSpeed(double latitude, double longtitude,double speed) {
    state = state.copyWith(latLng: latitude, longLng: longtitude,currentSpeed: speed);
  }

  void isDisplaySearchingBar(bool isDisplay) {
    state = state.copyWith(isDisplaySearchingBar: isDisplay);
  }

  Future getSearchingList(String searchPlace) async {
    state = state.copyWith(status: LoadingStatus.inProgress);
    try {
      final searchOb = await getSearchingObjectUseCase
          .run(SeachingObjectInput(ApiConstant.accessToken, searchPlace));
      state = state.copyWith(
        status: LoadingStatus.success,
        listSearchingPlace: searchOb.features,
      );
    } on Exception catch (error) {
      state = state.copyWith(
        listSearchingPlace: [],
        errorMsg: error.toString(),
        status: LoadingStatus.error,
      );
    }
  }

  void addMarker(LatLng latLng) {
    if (state.markers.length > 1) {
      state = state.copyWith(markers: [], listForPolyLine: []);
    } else {
      state = state.copyWith(markers: [...state.markers, latLng]);
    }
  }
  void changeMethod(RouteMethod routeMethod){
    state= state.copyWith(routeMethod: routeMethod);
  }
  Future<bool> getRouteByMethod(RouteMethod method) async {
    state = state.copyWith(status: LoadingStatus.inProgress);
    var distance = '';
    if (state.markers.isNotEmpty) {
      if (state.markers.length == 2) {
        distance =
            '${state.markers[0].longitude},${state.markers[0].latitude};${state.markers[1].longitude},${state.markers[1].latitude}';
      }
      if (state.markers.length == 1) {
        distance =
            '${state.longLng},${state.latLng};${state.markers[0].longitude},${state.markers[0].latitude}';
      }
      try {
        debugPrint('Day la distance: $distance');
        if (method == RouteMethod.walking) {
          final directionObj = await getWalkingDirectionObjectUseCase.run(
            DirectionObjectInput(distance, ApiConstant.accessToken, 'maxspeed',
                'geojson', 'full'),
          );
          state = state.copyWith(
            status: LoadingStatus.success,
            distance: directionObj.routes[0].distance,
            duration: directionObj.routes[0].duration,
            listForPolyLine: directionObj.routes[0].geometry.coordinates
                .map((e) => LatLng(e[1], e[0]))
                .toList(),
          );
        }
        if (method == RouteMethod.driving) {
          final directionObj = await getDrivingDirectionObjectUseCase.run(
            DirectionObjectInput(
              distance,
              ApiConstant.accessToken,
              'maxspeed',
              'geojson',
              'full',
            ),
          );
          final listLatLng = directionObj.routes[0].geometry.coordinates
              .map((e) => LatLng(e[1], e[0]))
              .toList();
          state = state.copyWith(
            status: LoadingStatus.success,
            distance: directionObj.routes[0].distance,
            duration: directionObj.routes[0].duration,
            listForPolyLine: listLatLng,
          );
        }
        return true;
      } on Exception catch (error) {
        state = state.copyWith(
            errorMsg: error.toString(), status: LoadingStatus.error);
      }
    }
    return false;
  }
}
