import 'package:flutter/material.dart';
import 'main_common.dart';
import 'repositories/location/location_repository_mock.dart';
import 'repositories/ride/ride_repository_mock.dart';
import 'repositories/ride_preference/ride_preference_repository_mock.dart';
import 'ui/states/ride_preferences_state.dart';

void main() {
  final locationRepo = LocationRepositoryMock();
  final rideRepo = RideRepositoryMock();
  final ridePrefRepo = RidePreferenceRepositoryMock();

  final rideState = RidePreferencesState(ridePrefRepo);

  runApp(BlaBlaApp(
    locationRepository: locationRepo,
    rideRepository: rideRepo,
    rideState: rideState,
  ));
}