import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../view_model/ride_selection_model.dart';
import 'rides_selection_header.dart';
import 'rides_selection_tile.dart';

class RideSelectionContent extends StatelessWidget {
  final RideSelectionViewModel viewModel;

  const RideSelectionContent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: viewModel.selectedRidePreference,
              onBackPressed: () => viewModel.onBackTap(context),
              onFilterPressed: viewModel.onFilterPressed,
              onPreferencePressed: () => viewModel.onPreferencePressed(context),
            ),
            const SizedBox(height: 100),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.matchingRides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: viewModel.matchingRides[index],
                  onPressed: () =>
                      viewModel.onRideSelected(viewModel.matchingRides[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
