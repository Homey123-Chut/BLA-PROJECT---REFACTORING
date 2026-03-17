import 'package:flutter/material.dart';
import '../../../repositories/location/location_repository.dart';
import '../../../repositories/ride/ride_repository.dart';
import '../../states/ride_preferences_state.dart';
import 'view_model/home_model.dart';
import 'widgets/home_content.dart';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class HomeScreen extends StatefulWidget {
  final LocationRepository locationRepository;
  final RideRepository rideRepository;
  final RidePreferencesState rideState;

  const HomeScreen({
    super.key,
    required this.locationRepository,
    required this.rideRepository,
    required this.rideState,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel(
      rideState: widget.rideState,
      locationRepository: widget.locationRepository,
      rideRepository: widget.rideRepository,
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, _) {
        return HomeContent(viewModel: _viewModel);
      },
    );
  }
}
