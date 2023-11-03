import 'package:flutter/material.dart';

class RowResponsive extends StatelessWidget {
  const RowResponsive({super.key, required this.children, required this.width});

  final List<Widget> children;
  final int width;

  @override
  Widget build(BuildContext context) {
    bool isScreenPhone = MediaQuery.of(context).size.width < width;
    return isScreenPhone
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          );
  }
}
