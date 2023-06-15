import 'package:baseproject/ultilities/app_constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

final destinationProvider = StateProvider<LatLng>(
  (ref) => LatLng(AppConstant.latitude, AppConstant.longitude),
);
