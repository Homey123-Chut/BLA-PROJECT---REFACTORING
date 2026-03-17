import 'package:flutter/material.dart';

import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../repositories/location/location_repository.dart';
import '../../../../repositories/ride/ride_repository.dart';
import '../../../../utils/animations_util.dart';
import '../../../states/ride_preferences_state.dart';
import '../widgets/ride_preference_modal.dart';

class RideSelectionViewModel extends ChangeNotifier {
  final RidePreferencesState _rideState;
  final RideRepository _rideRepository;
  final LocationRepository locationRepository;

  RideSelectionViewModel({
    required RidePreferencesState rideState,
    required RideRepository rideRepository,
    required this.locationRepository,
  }) : _rideState = rideState,
       _rideRepository = rideRepository {
    _rideState.addListener(_onRideStateChanged);
  }

  RidePreference get selectedRidePreference => _rideState.selectedPreference!;

  List<RidePreference> get preferenceHistory =>
      _rideState.preferenceHistory.reversed.toList();

  int get maxAllowedSeats => _rideState.maxAllowedSeats;

  List<Ride> get matchingRides =>
      _rideRepository.getRidesFor(selectedRidePreference);

  void onBackTap(BuildContext context) {
    Navigator.pop(context);
  }

  void onFilterPressed() {
    // TODO: Add filter state and filtering logic later.
  }

  void onRideSelected(Ride ride) {
    // TODO: Navigate to ride details later.
  }

  Future<void> onPreferencePressed(BuildContext context) async {
    final RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
          AnimationUtils.createRightToLeftRoute(
            RidePreferenceModal(
              initialPreference: selectedRidePreference,
              locationRepository: locationRepository,
              maxAllowedSeats: maxAllowedSeats,
            ),
          ),
        );

    if (newPreference != null) {
      _rideState.selectPreference(newPreference);
    }
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
