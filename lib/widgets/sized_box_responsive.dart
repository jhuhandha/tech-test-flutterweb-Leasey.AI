import 'package:flutter/material.dart';

class SizedBoxResponsive extends StatelessWidget {
  const SizedBoxResponsive({
    super.key,
    required this.child,
    required this.width,
    required this.percentage,
  });

  final Widget child;
  final int width;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    bool isScreenPhone = MediaQuery.of(context).size.width < width;
    return SizedBox(
      width: isScreenPhone
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width * percentage,
      child: child,
    );
  }
}
