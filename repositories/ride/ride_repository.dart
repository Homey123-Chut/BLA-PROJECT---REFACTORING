import 'package:blabla/model/ride_pref.dart';

import '../../model/ride/ride.dart';

abstract class RideRepository {
  List<Ride> getRides();
  List<Ride> getRidesFor(RidePreference preference);

}