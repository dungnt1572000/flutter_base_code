import 'package:baseproject/data/repositories/entities/searching_object.dart';
import 'package:baseproject/data/services/network_service/api_constant.dart';
import 'package:baseproject/presentation/domain/use_case/get_searching_object_use_case.dart';
import 'package:baseproject/presentation/pages/home/home_state.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(this.getSearchingObjectUseCase) : super(HomeState());

  GetSearchingObjectUseCase getSearchingObjectUseCase;
  void upDateCurrentSpeed(double currentSpeed) {
    state = state.copyWith(currentSpeed: currentSpeed);
  }

  void upDateCurrentLocation(double latitude, double longtitude) {
    state = state.copyWith(latLng: latitude, longLng: longtitude);
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
    state = state.copyWith(markers: [...state.markers, latLng]);
  }
}
