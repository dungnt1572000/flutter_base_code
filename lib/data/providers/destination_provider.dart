import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

final destinationProvider = StateProvider<LatLng?>(
  (ref) => null,
);
