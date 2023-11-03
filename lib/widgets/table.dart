import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:webtest/providers/property.dart';

class TableProperty extends StatelessWidget {
  const TableProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Consumer<PropertyModel>(builder: (context, property, _) {
        return DataTable(
          columns: const [
            DataColumn(
              label: Text(
                'Name property',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Address',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Type property',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Image property',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Actions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: [
            ...property.items.asMap().entries.map((element) {
              return DataRow(
                cells: [
                  DataCell(Text(element.value.name)),
                  DataCell(Text(element.value.address)),
                  DataCell(Text(element.value.type)),
                  DataCell(Image.memory(
                    base64Decode(element.value.image),
                    width: 100,
                    height: 100,
                  )),
                  DataCell(
                    ElevatedButton(
                      onPressed: () =>
                          Provider.of<PropertyModel>(context, listen: false)
                              .remove(element.key),
                      child: const Icon(Icons.remove),
                    ),
                  ),
                ],
              );
            }),
          ],
        );
      }),
    );
  }
}
