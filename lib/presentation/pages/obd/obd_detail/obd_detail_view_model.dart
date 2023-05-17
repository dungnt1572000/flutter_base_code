import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObdDetailViewModel extends StateNotifier<ObdDetailState> {
  ObdDetailViewModel() : super(ObdDetailState());

  void updateSpeed(double speed) {
    if(speed>=35){
      state = state.copyWith(speed: speed,isSafety: false);
    }else{
      state = state.copyWith(speed: speed,isSafety:true);
    }

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
}
