import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart' as web;
import 'package:kumoh_school_bus/util/google_map_init_info.dart';

class VanillaGoogleMap extends StatefulWidget {
  final Set<Marker> setOfMarkers;

  const VanillaGoogleMap({Key? key, required this.setOfMarkers})
      : super(key: key);

  @override
  State<VanillaGoogleMap> createState() => _VanillaGoogleMapState();
}

class _VanillaGoogleMapState extends State<VanillaGoogleMap> {
  final CameraPosition _initialPosition =
      CameraPosition(target: LatLng(initLat, initLng), zoom: initZoom);
  late GoogleMapController _controller;
  GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance = web.GoogleMapsPlugin();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _initialPosition,
      mapType: MapType.normal,
      onMapCreated: (controller) => {_controller = controller},
      markers: widget.setOfMarkers,
      zoomControlsEnabled: false,
      mapToolbarEnabled: false,
      // 클릭한 위치가 중앙에 표시
      onTap: (coordinate) {
        FocusScope.of(context).unfocus();
        _controller.animateCamera(CameraUpdate.newLatLng(coordinate));
      },
      cameraTargetBounds: CameraTargetBounds(
        LatLngBounds(
          southwest: LatLng(boundSWLat, boundSWLng),
          northeast: LatLng(boundNELat, boundNELng),
        ),
      ),
      minMaxZoomPreference: MinMaxZoomPreference(minZoom, maxZoom),
    );
  }
}
