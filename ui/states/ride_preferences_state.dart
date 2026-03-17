import 'package:flutter/foundation.dart';

import '../../model/ride_pref/ride_pref.dart';
import '../../repositories/ride_preference/ride_preference_repository.dart';

class RidePreferencesState extends ChangeNotifier {
  RidePreference? selectedPreference;
  List<RidePreference> preferenceHistory = [];
  int maxAllowedSeats = 8;

  final RidePreferenceRepository repo;

  RidePreferencesState(this.repo) {
    preferenceHistory = repo.getRidePref();
  }

  void selectPreference(RidePreference pref) {
    if (pref != selectedPreference) {
      selectedPreference = pref;
      preferenceHistory.add(pref);
      repo.addRidePref(pref);
      notifyListeners();
    }
  }
}