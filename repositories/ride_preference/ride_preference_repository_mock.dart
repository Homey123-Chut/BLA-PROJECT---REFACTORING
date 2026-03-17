import '../../model/location/locations.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../ride_preference/ride_preference_repository.dart';
import '../location/location_repository_mock.dart';

final List<Location> _locations = LocationRepositoryMock().getLocations();

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  final List<RidePreference> ridesPref = [
      RidePreference(
        departure: _locations[0], // London
        departureDate: DateTime.now().add(Duration(days: 1)), // Tomorrow
        arrival: _locations[3], // Paris
        requestedSeats: 2,
      ),
      RidePreference(
        departure: _locations[1], // Manchester
        departureDate: DateTime.now().add(Duration(days: 7)), // Next week
        arrival: _locations[4], // Lyon
        requestedSeats: 3,
      ),
      RidePreference(
        departure: _locations[2], // Birmingham
        departureDate: DateTime.now(), // Today
        arrival: _locations[5], // Marseille
        requestedSeats: 1,
      ),
      RidePreference(
        departure: _locations[0], // London
        departureDate: DateTime.now().add(Duration(days: 1)), // Tomorrow
        arrival: _locations[3], // Paris
        requestedSeats: 2,
      ),
      RidePreference(
        departure: _locations[4], // Manchester
        departureDate: DateTime.now().add(Duration(days: 7)), // Next week
        arrival: _locations[0], // Lyon
        requestedSeats: 3,
      ),
      RidePreference(
        departure: _locations[5], // Birmingham
        departureDate: DateTime.now(), // Today
        arrival: _locations[1], // Marseille
        requestedSeats: 1,
      ),

  ];

  @override
  List<RidePreference> getRidePref() {
    return ridesPref;

  }

  @override
  void addRidePref(RidePreference pref) {
    return ridesPref.add(pref);
  }
}