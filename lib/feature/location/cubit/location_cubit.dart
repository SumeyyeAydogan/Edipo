import 'package:bloc/bloc.dart';
import 'package:edipo/feature/location/cubit/location_cubit_state.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState());

  Future<bool> serviceEnableCheck() async {
    final bool response = await Geolocator.isLocationServiceEnabled();
    return response;
    //emit(LocationState(locationServiceEnabled: response));
  }

  Future<bool> permissionCheck() async {
    var response = await Geolocator.checkPermission();
    if (response == LocationPermission.denied ||
        response == LocationPermission.deniedForever) {
      response = await Geolocator.requestPermission();
      if (response == LocationPermission.denied ||
          response == LocationPermission.deniedForever) {
        return false;
      }
    }
    //emit(LocationState(locationPermission: response));
    return true;
  }

  Future<void> getCurrentPos() async {
    if (await permissionCheck()) {
      if (await serviceEnableCheck()) {
        await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.high)
            .then((Position position) async {
          emit(LocationState(
              locationPermission: LocationPermission.whileInUse,
              locationServiceEnabled: true,
              position: position));
        }).catchError((e) {
          debugPrint(e);
        });
      }
    }
  }
}
