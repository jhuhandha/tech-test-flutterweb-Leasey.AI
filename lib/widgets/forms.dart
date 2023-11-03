import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:webtest/providers/property.dart';
import 'package:webtest/widgets/row_reponsive.dart';
import 'package:webtest/widgets/sized_box_responsive.dart';

class FormProperty extends StatefulWidget {
  const FormProperty({super.key});

  @override
  State<FormProperty> createState() => _FormPropertyState();
}

class _FormPropertyState extends State<FormProperty> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController type = TextEditingController();
  String? imageBase64;

  void uploadFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
      );

      if (result != null && result.files.isNotEmpty) {
        imageBase64 = base64Encode(result.files.first.bytes!);
        setState(() {});
      }
    } catch (ex) {
      Future(
        () => {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Problems with the image upload'),
            ),
          )
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Image.asset("assets/micasa.jpg"),
          TextFormField(
            controller: name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name property',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: address,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Address',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: type,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Type property',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          RowResponsive(
            width: 900,
            children: [
              SizedBoxResponsive(
                width: 900,
                percentage: 0.15,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[100],
                    minimumSize: const Size.fromHeight(
                      60,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: uploadFile,
                  child: const Row(
                    children: [
                      Icon(Icons.file_upload_outlined),
                      Text('Image property')
                    ],
                  ),
                ),
              ),
              SizedBoxResponsive(
                width: 900,
                percentage: 0.15,
                child: imageBase64 != null
                    ? Image.memory(
                        base64Decode(imageBase64!),
                        fit: BoxFit.contain,
                        width: 200,
                        height: 200,
                      )
                    : const Icon(Icons.image),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              if (imageBase64 == null) {
                showDialog<AlertDialog>(
                  context: context,
                  builder: (BuildContext context) => const AlertDialog(
                    content: Text("Please select an image"),
                  ),
                );
              }
              if (_formKey.currentState!.validate()) {
                Provider.of<PropertyModel>(context, listen: false).add(
                  Property(
                    name: name.text,
                    address: address.text,
                    type: type.text,
                    image: imageBase64!,
                  ),
                );
                _formKey.currentState!.reset();
                imageBase64 = null;
                name.text = "";
                type.text = "";
                address.text = "";
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Property saved')),
                );
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
