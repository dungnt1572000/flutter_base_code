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
import 'package:baseproject/presentation/widget/app_indicator/app_loading_overlayed.dart';
import 'package:baseproject/presentation/widget/snack_bar/error_snack_bar.dart';
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

  @override
  void initState() {
    super.initState();
    setUpLocation();
  }

  void setUpLocation(){
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

        location!.onLocationChanged.listen((LocationData currentLocation) {
          _viewModel.upDateCurrentSpeed(
            currentLocation.speedAccuracy ?? 0.0,
          );
        });
        _viewModel.upDateCurrentLocation(
          _locationData.latitude ?? 51.5,
          _locationData.longitude ?? -0.09,
        );
        mapController.move(LatLng(state.latLng, state.longLng), 10);
      }
    });
  }
  @override
  void dispose() {
      super.dispose();
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
        onPressed: () async {
          _locationData = await location!.getLocation();
          _viewModel.upDateCurrentLocation(
            _locationData.latitude ?? 51.5,
            _locationData.longitude ?? -0.09,
          );
          mapController.move(LatLng(state.latLng, state.longLng), 10);
        },
        child: const Icon(Icons.location_searching),
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.loose,
          children: [
            _buildMap(),
            Positioned(
              right: 15,
              child: Column(
                children: [
                  _buildFindButton(context),
                  _buildSaveDriving(context),
                ],
              ),
            ),
            AnimatedCrossFade(
              firstChild: _buildFindWay(context),
              secondChild: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.action,
                  shape: CircleBorder(
                    side: BorderSide(color: context.colors.primaryBackground),
                  ),
                ),
                onPressed: () {
                  _viewModel.isDisplaySearchingBar(true);
                },
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: context.colors.iconPrimary,
                ),
              ),
              crossFadeState: state.isDisplaySearchingBar
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
            state.listForPolyLine.isNotEmpty && !state.isDisplaySearchingBar
                ? _builtDetailTrip(context)
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildMap() {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        onTap: (tapPosition, point) {
          mapController.move(point, 15.5);
          _viewModel.addMarker(point);
        },
        onMapReady: () {
          mapController.move(LatLng(state.latLng, state.longLng), 10);
        },
        center: LatLng(51.5, -0.09),
        zoom: 5,
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://tile.openstreetmap.org/{z}/{x}/{y}.png?layers=H',
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Start Place',
              style: AppTextStyles.labelMedium
                  .copyWith(color: context.colors.primaryText),
            ),
            TextFormField(
              controller: _startLocation,
              focusNode: _startNode,
              maxLines: 1,
              decoration: InputDecoration(
                suffix: IconButton(
                  onPressed: () async {
                    await _viewModel
                        .getSearchingList(_startLocation.text.trim());
                  },
                  icon: Icon(
                    Icons.search,
                    color: context.colors.iconPrimary,
                  ),
                ),
              ),
            ),
            Text(
              'Choose Last Place',
              style: AppTextStyles.labelMedium
                  .copyWith(color: context.colors.primaryText),
            ),
            TextFormField(
              controller: _lastLocation,
              focusNode: _lastNode,
              maxLines: 1,
              decoration: InputDecoration(
                suffix: IconButton(
                  onPressed: () async {
                    await _viewModel
                        .getSearchingList(_lastLocation.text.trim());
                  },
                  icon: Icon(
                    Icons.search,
                    color: context.colors.iconPrimary,
                  ),
                ),
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
              child: SizedBox(
                height: 350,
                child: state.listSearchingPlace.isEmpty
                    ? Center(
                        child: Text(
                          'Search Anywhere',
                          style: AppTextStyles.labelMedium
                              .copyWith(color: context.colors.primaryText),
                        ),
                      )
                    : ListView.builder(
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
                              _viewModel.addMarker(LatLng(
                                  searchPbj.center![1], searchPbj.center![0]));
                            },
                            title:
                                Text('${state.listSearchingPlace[index].text}'),
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
        'Find',
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
            children: [
              _buildRouteMethod(context),
              AppLoadingOverlay(
                status: state.status,
                child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Speed: ${state.currentSpeed}',
                          style: AppTextStyles.textLarge
                              .copyWith(color: context.colors.primaryText),
                        ),
                        Text(
                          'Time: ${state.duration}',
                          style: AppTextStyles.textLarge
                              .copyWith(color: context.colors.primaryText),
                        ),
                        Text(
                          'Distance: ${state.distance}',
                          style: AppTextStyles.textLarge
                              .copyWith(color: context.colors.primaryText),
                        ),
                      ],
                    )),
              )
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
                  ? Colors.blue
                  : Colors.white,
              border: Border.all(color: context.colors.border),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.drive_eta,
              color: context.colors.iconPrimary,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            _viewModel.changeMethod(RouteMethod.walking);
            final result =
                await _viewModel.getRouteByMethod(RouteMethod.walking);
            if (!result) {
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
                  ? Colors.blue
                  : Colors.white,
              border: Border.all(color: context.colors.border),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.nordic_walking,
              color: context.colors.iconPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveDriving(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        bool result = await ref.read(appNavigatorProvider).navigateTo(Approutes.saveDriving);
        if(result){
          print('result ne'+result.toString());
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
}
