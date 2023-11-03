import 'package:flutter/material.dart';

import 'package:webtest/widgets/row_reponsive.dart';
import 'package:webtest/widgets/sized_box_responsive.dart';
import 'package:webtest/widgets/forms.dart';
import 'package:webtest/widgets/table.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Administración de propiedades",
        ),
        backgroundColor: Colors.blue[100],
      ),
      body: const Padding(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: RowResponsive(
            width: 700,
            children: [
              SizedBoxResponsive(
                width: 700,
                percentage: 0.3,
                child: FormProperty(),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBoxResponsive(
                width: 700,
                percentage: 0.65,
                child: TableProperty(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
