import 'package:baseproject/presentation/domain/use_case/get_show_distance_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/get_show_duration_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/get_show_fuel_consumption_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/get_show_rpm_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/get_show_speed_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/get_walking_direction_object_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/save_show_duration_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/save_show_fuel_consumption_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/save_show_rpm_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/save_show_speed_use_case.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../../data/services/network_service/api_constant.dart';
import '../../../domain/use_case/get_driving_direction_object_use_case.dart';
import '../../../domain/use_case/save_show_distance_use_case.dart';

class ObdDetailViewModel extends StateNotifier<ObdDetailState> {
  ObdDetailViewModel({
    required this.getDrivingDirectionObjectUseCase,
    required this.getShowSpeedUseCase,
    required this.saveShowSpeedUseCase,
    required this.saveShowDurationUseCase,
    required this.saveShowDistanceUseCase,
    required this.getShowDurationUseCase,
    required this.getShowDistanceUseCase,
    required this.saveShowRpmUseCase,
    required this.getShowRpmUseCase,
    required this.getShowFuelConsumptionUseCase,
    required this.saveShowFuelConsumptionUseCase,
  }) : super(ObdDetailState()) {
    initOption();
  }

  GetDrivingDirectionObjectUseCase getDrivingDirectionObjectUseCase;
  GetShowSpeedUseCase getShowSpeedUseCase;
  SaveShowSpeedUseCase saveShowSpeedUseCase;
  GetShowDistanceUseCase getShowDistanceUseCase;
  GetShowDurationUseCase getShowDurationUseCase;
  SaveShowDistanceUseCase saveShowDistanceUseCase;
  SaveShowDurationUseCase saveShowDurationUseCase;
  GetShowRpmUseCase getShowRpmUseCase;
  SaveShowRpmUseCase saveShowRpmUseCase;
  GetShowFuelConsumptionUseCase getShowFuelConsumptionUseCase;
  SaveShowFuelConsumptionUseCase saveShowFuelConsumptionUseCase;

  void updateSpeed(double speed) {
    if (speed >= 3500000000) {
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

  void updateFuelConsumption(double consumption) {
    state = state.copyWith(fuelConsumption: consumption);
  }

  void updateCurrentLocation(LatLng latLng) {
    state = state.copyWith(
        currentLatitude: latLng.latitude, currentLongitude: latLng.longitude);
  }

  Future<bool> getRoutes(LatLng destination, [LatLng? startDestination]) async {
    try {
      if (startDestination == null) {
        final result = await getDrivingDirectionObjectUseCase.run(
          DirectionObjectInput(
            '${state.currentLongitude},${state.currentLatitude};${destination.longitude},${destination.latitude}',
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
      } else {
        final result = await getDrivingDirectionObjectUseCase.run(
          DirectionObjectInput(
            '${startDestination.longitude},${startDestination.latitude};${destination.longitude},${destination.latitude}',
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
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  void initOption() {
    final showSpeedUseCase = getShowSpeedUseCase.run();
    final showDurationUseCase = getShowDurationUseCase.run();
    final showDistanceUseCase = getShowDistanceUseCase.run();
    final showRpmUseCase = getShowRpmUseCase.run();
    final showFuelConsumption = getShowFuelConsumptionUseCase.run();
    state = state.copyWith(
      showSpeed: showSpeedUseCase,
      showDistance: showDistanceUseCase,
      showTime: showDurationUseCase,
      showRpm: showRpmUseCase,
      showFuelConsumption: showFuelConsumption,
    );
  }

  Future updateOption({
    bool? showSpeed,
    bool? showDistance,
    bool? showTime,
    bool? showRpm,
    bool? showFuelConsumption,
  }) async {
    state = state.copyWith(
      showDistance: showDistance ?? state.showDistance,
      showSpeed: showSpeed ?? state.showSpeed,
      showTime: showTime ?? state.showTime,
      showRpm: showRpm ?? state.showRpm,
      showFuelConsumption: showFuelConsumption ?? state.showFuelConsumption,
    );
    if (showSpeed != null) {
      await saveShowSpeedUseCase.run(showSpeed);
    }
    if (showDistance != null) {
      await saveShowDistanceUseCase.run(showDistance);
    }
    if (showTime != null) {
      await saveShowDurationUseCase.run(showTime);
    }
    if (showRpm != null) {
      await saveShowRpmUseCase.run(showRpm);
    }
    if (showFuelConsumption != null) {
      await saveShowFuelConsumptionUseCase.run(showFuelConsumption);
    }
  }

  void updateShowOption(bool showOptions) {
    state = state.copyWith(showOptions: showOptions);
  }

  void updateFollowing(bool following) {
    state = state.copyWith(following: following);
  }
}
