import 'package:flutter/material.dart';
import 'ui/screens/home/home_screen.dart';
import 'ui/theme/theme.dart';
import 'repositories/location/location_repository.dart';
import 'repositories/ride/ride_repository.dart';
import 'ui/states/ride_preferences_state.dart';

class BlaBlaApp extends StatelessWidget {
  final LocationRepository locationRepository;
  final RideRepository rideRepository;
  final RidePreferencesState rideState;

  const BlaBlaApp({
    super.key,
    required this.locationRepository,
    required this.rideRepository,
    required this.rideState,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: blaTheme,
      home: const HomeScreen(),
    );
  }
}