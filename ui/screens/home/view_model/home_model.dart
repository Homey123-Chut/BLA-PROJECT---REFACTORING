import 'package:flutter/material.dart';

import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../repositories/location/location_repository.dart';
import '../../../../repositories/ride/ride_repository.dart';
import '../../../../utils/animations_util.dart';
import '../../../states/ride_preferences_state.dart';
import '../../rides_selection/rides_selection_screen.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferencesState _rideState;
  final LocationRepository locationRepository;
  final RideRepository rideRepository;

  HomeViewModel({
    required RidePreferencesState rideState,
    required this.locationRepository,
    required this.rideRepository,
  }) : _rideState = rideState {
    _rideState.addListener(_onRideStateChanged);
  }

  RidePreference? get selectedPreference => _rideState.selectedPreference;

  List<RidePreference> get preferenceHistory =>
      _rideState.preferenceHistory.reversed.toList();

  int get maxAllowedSeats => _rideState.maxAllowedSeats;

  Future<void> onRidePrefSelected(
    BuildContext context,
    RidePreference selectedPreference,
  ) async {
    _rideState.selectPreference(selectedPreference);

    await Navigator.of(context).push(
      AnimationUtils.createBottomToTopRoute(
        RidesSelectionScreen(
          rideState: _rideState,
          rideRepository: rideRepository,
          locationRepository: locationRepository,
        ),
      ),
    );
  }

  void _onRideStateChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    _rideState.removeListener(_onRideStateChanged);
    super.dispose();
  }
}
