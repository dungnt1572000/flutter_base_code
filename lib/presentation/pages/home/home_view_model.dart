import 'package:baseproject/data/services/network_service/api_constant.dart';
import 'package:baseproject/presentation/pages/home/home_state.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:baseproject/ultilities/route_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../data/domain/use_case/get_driving_direction_object_use_case.dart';
import '../../../data/domain/use_case/get_searching_object_use_case.dart';
import '../../../data/domain/use_case/get_walking_direction_object_use_case.dart';

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

  void upDateCurrentLocation(double latitude, double longtitude) {
    state = state.copyWith(
      latLng: latitude,
      longLng: longtitude,
    );
  }

  void upDateSpeed(double speed) {
    state = state.copyWith(currentSpeed: speed);
  }

  void isDisplaySearchingBar(bool isDisplay) {
    state = state.copyWith(isDisplaySearchingBar: isDisplay);
  }

  void isDisplayDetailIntroduction(bool isDisplay) {
    state = state.copyWith(isDisplayDetailIntroduction: isDisplay);
  }

  void displayUtilities(bool display) {
    state = state.copyWith(displayUtilities: display);
  }

  Future getSearchingList(String searchPlace) async {
    state = state.copyWith(status: LoadingStatus.inProgress);
    try {
      final searchOb = await getSearchingObjectUseCase
          .run(SearchingObjectInput(ApiConstant.accessToken, searchPlace));
      state = state.copyWith(
        status: LoadingStatus.success,
        listSearchingPlace: searchOb.features ?? [],
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
    state = state.copyWith(markers: [...state.markers, latLng]);
  }

  void clearMarker() {
    state = state.copyWith(markers: [], listForPolyLine: []);
  }

  void changeMethod(RouteMethod routeMethod) {
    state = state.copyWith(routeMethod: routeMethod);
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
              distance: directionObj.routes?[0].distance ?? 0.0,
              duration: directionObj.routes?[0].duration ?? 0.0,
              listForPolyLine: directionObj.routes?[0].geometry?.coordinates!
                      .map((e) => LatLng(e[1], e[0]))
                      .toList() ??
                  [],
              isDisplayDetailIntroduction: true);
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
          final listLatLng = directionObj.routes![0].geometry?.coordinates!
              .map((e) => LatLng(e[1], e[0]))
              .toList();
          state = state.copyWith(
            status: LoadingStatus.success,
            distance: directionObj.routes?[0].distance ?? 0.0,
            duration: directionObj.routes?[0].duration ?? 0.0,
            listForPolyLine: listLatLng ?? [],
            isDisplayDetailIntroduction: true,
          );
        }
        return true;
      } on Exception {
        state = state.copyWith(
            errorMsg: "Can not find a way you want",
            status: LoadingStatus.error);
      }
    } else {
      state = state.copyWith(
          errorMsg: 'Please choose at least 1 location',
          status: LoadingStatus.error);
    }
    return false;
  }
}
