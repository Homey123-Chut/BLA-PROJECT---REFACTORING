import '../../model/location/locations.dart';

abstract class LocationRepository {
   List<Location> getLocations();
}