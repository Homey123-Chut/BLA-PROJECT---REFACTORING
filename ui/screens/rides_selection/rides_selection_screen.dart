import 'package:flutter/material.dart';
import '../../../repositories/location/location_repository.dart';
import '../../../repositories/ride/ride_repository.dart';
import '../../states/ride_preferences_state.dart';
import 'view_model/ride_selection_model.dart';
import 'widgets/ride_selection_content.dart';

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionScreen extends StatefulWidget {
  final RidePreferencesState rideState;
  final RideRepository rideRepository;
  final LocationRepository locationRepository;

  const RidesSelectionScreen({
    super.key,
    required this.rideState,
    required this.rideRepository,
    required this.locationRepository,
  });

  @override
  State<RidesSelectionScreen> createState() => _RidesSelectionScreenState();
}

class _RidesSelectionScreenState extends State<RidesSelectionScreen> {
  late final RideSelectionViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = RideSelectionViewModel(
      rideState: widget.rideState,
      rideRepository: widget.rideRepository,
      locationRepository: widget.locationRepository,
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, _) => RideSelectionContent(viewModel: _viewModel),
    );
  }
}
