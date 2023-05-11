import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObdDetailViewModel extends StateNotifier<ObdDetailState>{
  ObdDetailViewModel(): super(ObdDetailState());
  void updateSpeed(double speed){
    state = state.copyWith(
      speed: speed
    );
  }
  void updateRmp(double rmp){
state = state.copyWith(
  rpm: rmp
);
  }
  void updateNhietdodongco(double nhietdodongco){

  }
  void updatemucnhienlieu(double mucnhienlieu){
    state = state.copyWith(mucnhienlieu: mucnhienlieu);
  }
}