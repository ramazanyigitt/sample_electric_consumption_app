import 'package:flutter/material.dart';
import 'package:sample_fluttercase/data/models/household_model.dart';

class HouseholdCard extends StatelessWidget {
  final HouseholdModel householdModel;
  final EdgeInsets padding;
  final Function(HouseholdModel)? onClick;
  const HouseholdCard({
    Key? key,
    required this.householdModel,
    this.padding: EdgeInsets.zero,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
