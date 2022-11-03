import 'package:baseproject/presentation/pages/home/home_state.dart';
import 'package:baseproject/presentation/pages/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

final provider = StateNotifierProvider.autoDispose<HomeViewModel,HomeState>((ref) => HomeViewModel());

class HomePage extends ConsumerStatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  MapController mapController=MapController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
          _buildMap(),
        ]),
      ),
    );
  }

  Widget _buildMap() {
    return FlutterMap(
          mapController: mapController,
          options: MapOptions(
            onTap: (tapPosition, point) {
              mapController.move(point, 10);
            },
            onMapReady: (){
              mapController.move(LatLng(81.5, -10.09), 8);
            },
            center: LatLng(51.5, -0.09),
            zoom: 5,
          ),
          children: [
            TileLayer(

              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.baseproject',

            ),
          ],
        );
  }
}
