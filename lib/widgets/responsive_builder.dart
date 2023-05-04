import 'package:flutter/material.dart';
import 'package:meditation/utils/themes.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder(
      {super.key, required this.potrait, required this.landscape});

  final Widget potrait;
  final Widget landscape;

  @override
  Widget build(BuildContext context) {
    return context.orientation == Orientation.portrait ? potrait : landscape;
  }
}
