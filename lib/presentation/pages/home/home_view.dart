import 'package:baseproject/presentation/pages/home/home_state.dart';
import 'package:baseproject/presentation/pages/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';


final provider = StateNotifierProvider.autoDispose<HomeViewModel,HomeState>((ref) => HomeViewModel());
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {

  HomeViewModel get _viewModel => ref.read(provider.notifier);
  HomeState get state => ref.watch(provider);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:FlutterMap(options: MapOptions(
        zoom: 8,
        center: LatLng(10.762622, 106.660172),
      ),)
    );
  }
}
