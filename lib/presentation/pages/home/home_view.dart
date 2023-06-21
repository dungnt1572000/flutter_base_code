import 'dart:async';

import 'package:baseproject/data/providers/destination_provider.dart';
import 'package:baseproject/presentation/domain/use_case/get_driving_direction_object_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/get_searching_object_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/get_walking_direction_object_use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';
import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/pages/home/home_state.dart';
import 'package:baseproject/presentation/pages/home/home_view_model.dart';
import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:baseproject/presentation/resources/app_text_styles.dart';
import 'package:baseproject/presentation/widget/app_dialog.dart';
import 'package:baseproject/presentation/widget/app_indicator/app_loading_overlayed.dart';
import 'package:baseproject/presentation/widget/icon_button.dart';
import 'package:baseproject/presentation/widget/snack_bar/error_snack_bar.dart';
import 'package:baseproject/ultilities/app_constant.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:baseproject/ultilities/route_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

final provider = StateNotifierProvider.autoDispose<HomeViewModel, HomeState>(
  (ref) => HomeViewModel(
    injector.get<GetSearchingObjectUseCase>(),
    injector.get<GetDrivingDirectionObjectUseCase>(),
    injector.get<GetWalkingDirectionObjectUseCase>(),
  ),
);

Location? location;

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  MapController mapController = MapController();

  HomeViewModel get _viewModel => ref.read(provider.notifier);

  HomeState get state => ref.watch(provider);
  final TextEditingController _startLocation = TextEditingController();
  final TextEditingController _lastLocation = TextEditingController();

  final _startNode = FocusNode();
  final _lastNode = FocusNode();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    setUpLocation();
  }

  void setUpLocation() {
    location = Location();
    Future.delayed(Duration.zero, () async {
      _serviceEnabled = await location!.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location!.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }
      _permissionGranted = await location!.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location!.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
      if (_permissionGranted == PermissionStatus.granted) {
        _locationData = await location!.getLocation();
        _viewModel.upDateCurrentLocation(
          _locationData.latitude ?? AppConstant.latitude,
          _locationData.longitude ?? AppConstant.longitude,
        );
        mapController.move(LatLng(state.latLng, state.longLng), 15);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<HomeState>(provider, ((previous, next) {
      if (previous?.status != next.status &&
          next.status == LoadingStatus.error) {
        showErrorSnackBar(
          context: context,
          errorMessage: state.errorMsg,
        );
      }
    }));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.colors.backdropSecondary,
        onPressed: () async {
          location = Location();
          _locationData = await location!.getLocation();
          _viewModel.upDateCurrentLocation(
            _locationData.latitude ?? AppConstant.latitude,
            _locationData.longitude ?? AppConstant.longitude,
          );
          mapController.move(LatLng(state.latLng, state.longLng), 15);
        },
        child: Icon(Icons.location_searching,color: context.colors.primaryMain,),
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.loose,
          children: [
            _buildMap(),
            Positioned(
              right: 15,
              child: AnimatedCrossFade(
                firstChild: AppIconButton(
                  icon: Icons.more_horiz,
                  onTap: () => _viewModel.displayUtilities(true),
                ),
                secondChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFindButton(context),
                    _buildSaveDriving(context),
                    _buildOBDScreen(context),
                    _buildInstruction(context),
                    AppIconButton(
                        icon: Icons.close,
                        onTap: () => _viewModel.displayUtilities(false)),
                  ],
                ),
                crossFadeState: state.displayUtilities
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ),
            AnimatedCrossFade(
              firstChild: _buildFindWay(context),
              secondChild: AppIconButton(
                icon: Icons.keyboard_arrow_down,
                onTap: () => _viewModel.isDisplaySearchingBar(true),
              ),
              crossFadeState: state.isDisplaySearchingBar
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
            state.listForPolyLine.isNotEmpty &&
                    !state.isDisplaySearchingBar &&
                    state.isDisplayDetailIntroduction
                ? _builtDetailTrip(context)
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildInstruction(BuildContext context){
    return ElevatedButton(
      onPressed: () async {
        showInstructionDialog(context, AppConstant.homeInstruction);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colors.surface,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: context.colors.primaryMain),
        ),
      ),
      child: Text(
        'Instruction',
        style: AppTextStyles.labelMedium
            .copyWith(color: context.colors.primaryText),
      ),
    );
  }
  Widget _buildMap() {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        onTap: (tapPosition, point) {
          if (state.markers.length > 1) {
            _viewModel.clearMarker();
          } else {
            mapController.move(point, 18);
            _viewModel.addMarker(point);
            ref.read(destinationProvider.notifier).update((state) => point);
          }
        },
        onMapReady: () {
          mapController.move(LatLng(state.latLng, state.longLng), 18);
        },
        center: LatLng(AppConstant.latitude, AppConstant.longitude),
        zoom: 5,
      ),
      children: [
        TileLayer(
          urlTemplate: AppConstant.mapUrlTheme,
          userAgentPackageName: 'com.example.baseproject',
        ),
        MarkerLayer(markers: [
          Marker(
              point: LatLng(state.latLng, state.longLng),
              builder: (context) => const Icon(
                    Icons.location_searching,
                    size: 32,
                  )),
          ...state.markers
              .map(
                (e) => Marker(
                  height: 50,
                  point: LatLng(e.latitude, e.longitude),
                  builder: (context) => const Icon(
                    Icons.location_on_rounded,
                    size: 32,
                  ),
                ),
              )
              .toList(),
        ]),
        PolylineLayer(
          polylines: [
            Polyline(
                points: state.listForPolyLine,
                color: Colors.red,
                borderStrokeWidth: 2.5),
          ],
        )
      ],
    );
  }

  Widget _buildFindWay(BuildContext context) {
    return Form(
        child: Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _startLocation,
              focusNode: _startNode,
              decoration: InputDecoration(
                labelText: 'Start Location',
                hintText: 'Enter start location',
                labelStyle: AppTextStyles.labelLarge.copyWith(color: context.colors.primaryMain),
                prefixIcon: Icon(Icons.location_on,color: context.colors.primaryMain,),
                suffixIcon: IconButton(
                  onPressed: () async {
                    await _viewModel
                        .getSearchingList(_startLocation.text.trim());
                  },
                  icon: Icon(
                    Icons.search,
                    color: context.colors.primaryMain,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: context.colors.primaryMain),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _lastLocation,
              focusNode: _lastNode,
              maxLines: 1,
              decoration: InputDecoration(
                labelText: 'Last Location',
                hintText: 'Enter last location',
                labelStyle: AppTextStyles.labelLarge.copyWith(color: context.colors.primaryMain),
                prefixIcon: Icon(Icons.location_on,color: context.colors.primaryMain,),
                suffixIcon: IconButton(
                  onPressed: () async {
                    await _viewModel
                        .getSearchingList(_lastLocation.text.trim());
                  },
                  icon: Icon(
                    Icons.search,
                    color: context.colors.primaryMain,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: context.colors.primaryMain),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _viewModel.isDisplaySearchingBar(false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colors.surface,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: context.colors.primaryMain),
                ),
              ),
              child: Text(
                'Close',
                style: AppTextStyles.labelMedium
                    .copyWith(color: context.colors.primaryText),
              ),
            ),
            AppLoadingOverlay(
              status: state.status,
              child: state.listSearchingPlace.isEmpty
                  ? const SizedBox()
                  : Container(
                height: 250,
                    child: ListView.builder(
                        itemCount: state.listSearchingPlace.length,
                        itemBuilder: (context, index) {
                          final searchPbj = state.listSearchingPlace[index];
                          return ListTile(
                            onTap: () {
                              _viewModel.isDisplaySearchingBar(false);
                              mapController.move(
                                  LatLng(searchPbj.center![1],
                                      searchPbj.center![0]),
                                  18);
                              _viewModel.addMarker(
                                LatLng(
                                    searchPbj.center![1], searchPbj.center![0]),
                              );
                              ref.read(destinationProvider.notifier).update(
                                    (state) => LatLng(searchPbj.center![1],
                                        searchPbj.center![0]),
                                  );
                            },
                            title:
                                Text('${state.listSearchingPlace[index].text}',style: AppTextStyles.labelSmall.copyWith(color: context.colors.textPrimary),),
                          );
                        },
                      ),
                  ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildFindButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await _viewModel.getRouteByMethod(state.routeMethod);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colors.surface,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: context.colors.primaryMain),
        ),
      ),
      child: Text(
        'Find Way',
        style: AppTextStyles.labelMedium
            .copyWith(color: context.colors.primaryText),
      ),
    );
  }

  Widget _builtDetailTrip(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: 0,
      initialChildSize: 0.35,
      expand: true,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildRouteMethod(context),
              AppLoadingOverlay(
                status: state.status,
                child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    width: double.infinity,
                    padding:  const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: context.colors.primaryMain,
                        width: 1
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Duration: ${state.duration.ceil()} s',
                          style: AppTextStyles.textLarge
                              .copyWith(color: context.colors.primaryText),
                        ),
                        Text(
                          'Distance: ${state.distance.toStringAsFixed(2)} m',
                          style: AppTextStyles.textLarge
                              .copyWith(color: context.colors.primaryText),
                        ),
                      ],
                    )),
              ),
              AppIconButton(
                  icon: Icons.close,
                  onTap: () => _viewModel.isDisplayDetailIntroduction(false)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRouteMethod(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () async {
            _viewModel.changeMethod(RouteMethod.driving);
            final result =
                await _viewModel.getRouteByMethod(RouteMethod.driving);
            if (!result) {
              if (!mounted) return;
              showErrorSnackBar(
                  context: context,
                  errorMessage: 'Cant found route to this case');
            }
          },
          child: Container(
            width: 120,
            height: 50,
            decoration: BoxDecoration(
              color: state.routeMethod == RouteMethod.driving
                  ? context.colors.primaryMain.withOpacity(0.6)
                  : Colors.white,
              border: Border.all(color: context.colors.primaryMain,width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.drive_eta,
              color: state.routeMethod == RouteMethod.driving? Colors.white:Colors.orange,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            _viewModel.changeMethod(RouteMethod.walking);
            final result =
                await _viewModel.getRouteByMethod(RouteMethod.walking);
            if (!result) {
              if (!mounted) return;
              showErrorSnackBar(
                  context: context,
                  errorMessage: 'Cant found route to this case');
            }
          },
          child: Container(
            width: 120,
            height: 50,
            decoration: BoxDecoration(
              color: state.routeMethod == RouteMethod.walking
                  ? context.colors.primaryMain.withOpacity(0.6)
                  : Colors.white,
              border: Border.all(color: context.colors.border),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.nordic_walking,
              color: state.routeMethod == RouteMethod.walking? Colors.white:Colors.orange,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveDriving(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        bool result = await ref
            .read(appNavigatorProvider)
            .navigateTo(AppRoutes.saveDriving);
        if (result) {
          location = Location();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colors.surface,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: context.colors.primaryMain),
        ),
      ),
      child: Text(
        'Save Driving',
        style: AppTextStyles.labelMedium
            .copyWith(color: context.colors.primaryText),
      ),
    );
  }

  Widget _buildOBDScreen(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        ref.read(appNavigatorProvider).navigateTo(AppRoutes.bluetoothScreen);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colors.surface,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: context.colors.primaryMain),
        ),
      ),
      child: Text(
        'OBD',
        style: AppTextStyles.labelMedium
            .copyWith(color: context.colors.primaryText),
      ),
    );
  }
}
