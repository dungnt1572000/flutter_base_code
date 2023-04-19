import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObdDetailViewModel extends StateNotifier<ObdDetailState>{
  ObdDetailViewModel(): super(ObdDetailState());

  void updateValue(double value){
    state= state.copyWith(value: value);
  }
}