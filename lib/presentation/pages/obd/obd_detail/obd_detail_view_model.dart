import 'package:baseproject/presentation/domain/use_case/get_walking_direction_object_use_case.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../../data/services/network_service/api_constant.dart';
import '../../../domain/use_case/get_driving_direction_object_use_case.dart';

class ObdDetailViewModel extends StateNotifier<ObdDetailState> {
  ObdDetailViewModel({required this.getDrivingDirectionObjectUseCase})
      : super(ObdDetailState());

  GetDrivingDirectionObjectUseCase getDrivingDirectionObjectUseCase;

  void updateSpeed(double speed) {
    if (speed >= 35) {
      state = state.copyWith(speed: speed, isSafety: false);
    } else {
      state = state.copyWith(speed: speed, isSafety: true);
    }
  }

  void updateMsgInfor(String address) {
    state = state.copyWith(
      telephone: address,
    );
  }

  void updateRmp(double rmp) {
    state = state.copyWith(rpm: rmp);
  }

  void updateNhietdodongco(double nhietdodongco) {
    state = state.copyWith(nhietdodongco: nhietdodongco);
  }

  void updatemucnhienlieu(double mucnhienlieu) {
    state = state.copyWith(mucnhienlieu: mucnhienlieu);
  }

  void updateCurrentLocation(LatLng latLng) {
    state =
        state.copyWith(latitude: latLng.latitude, longitude: latLng.longitude);
  }

  Future<bool> getRoutes(LatLng destination) async {
    try {
      final result = await getDrivingDirectionObjectUseCase.run(
        DirectionObjectInput(
          '${state.longitude},${state.latitude};${destination.longitude},${destination.latitude}',
          ApiConstant.accessToken,
          'maxspeed',
          'geojson',
          'full',
        ),
      );
      state = state.copyWith(
        distance: result.routes?[0].distance ?? state.distance,
          time: result.routes?[0].duration ?? state.time,
          listForPolyLine: result.routes?[0].geometry?.coordinates!
                  .map((e) => LatLng(e[1], e[0]))
                  .toList() ??
              []);
      return true;
    } catch (e) {
      return false;
    }
  }
}
