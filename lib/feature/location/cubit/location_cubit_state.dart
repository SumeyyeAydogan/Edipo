import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

class LocationState extends Equatable {
  final bool locationServiceEnabled;
  final LocationPermission locationPermission;
  final Position? position;
  const LocationState(
      {this.locationServiceEnabled = false,
      this.locationPermission = LocationPermission.denied,this.position});

  @override
  List<Object?> get props => [locationPermission, locationServiceEnabled,position];
}
