import 'package:bad_zanko_pp/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:bad_zanko_pp/Components/custom_appbar.dart';

class WeightSelector extends StatefulWidget {
  const WeightSelector({super.key, this.isFemale = true});

  final bool isFemale;

  @override
  State<WeightSelector> createState() => _WeightSelectorState();
}

class _WeightSelectorState extends State<WeightSelector> {
  late bool isFemale;

  @override
  void initState() {
    super.initState();
    isFemale = widget.isFemale;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Select Your Weight", HelperClass.getColor(isFemale)),
      body: const Column(),
    );
  }
}
