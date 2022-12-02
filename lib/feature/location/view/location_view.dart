import 'package:edipo/feature/location/cubit/location_cubit_state.dart';
import 'package:edipo/feature/questions/view/questions_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_maps_webservice/src/core.dart';
import '../../../product/widgets/bottom_sheet.dart';
import '../cubit/location_cubit.dart';

class LocationPage extends StatefulWidget {
  LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  void initState() {
    super.initState();

    _getCurrentPosition();
  }

  bool isLoading = true;
  Position? _currentPosition;
  List<PlacesSearchResult>? _placesSearchList;

  Future<void> findPlaces(double lat, double lng) async {
    final places =
        GoogleMapsPlaces(apiKey: "AIzaSyAoe9ibF4hxRs5aac8vr54X1zN1uQjINlY");

    PlacesSearchResponse response = await places.searchNearbyWithRadius(
        type: "cafe", Location(lat: lat, lng: lng), 500);

    _placesSearchList = response.results;
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      _currentPosition = position;
      await findPlaces(_currentPosition!.latitude, _currentPosition!.longitude);
      setState(() {
        if (_placesSearchList != null) {
          isLoading = false;
        }
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      customBottomSheet(context, QuestionsPage());
                    },
                    title: Text(_placesSearchList![index].name,
                        style: Theme.of(context).textTheme.headline2),
                    leading: Image.network(_placesSearchList![index].icon ?? "",
                        height: 35),
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                      size: 35,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    subtitle: Text(_placesSearchList![index].types[0]),
                  ),
                  const Divider(),
                ],
              );
            },
            itemCount: _placesSearchList?.length,
          );
  }
}
