// ignore_for_file: unused_field

// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'home_page.dart';

class AddRoute extends StatefulWidget {
  const AddRoute({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdddriverState createState() => _AdddriverState();
}

class _AdddriverState extends State<AddRoute> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? _image; // Variable to store the selected image

  // Define variables to hold form data
  String _name = '';
  String _email = '';
  String? _selectedRouteNo;
  String? selectedOption;
  List<String> dropdownOptions = ['1', '2', '3', '4', '5'];
  String? selectedOption1;
  List<String> dropdownOptions1 = [
    'Pickup from school',
    'Pickup from driver area',

    // Add or remove options as needed
  ];

  String? _selectedMakeYear;
  // List to store the uploaded images
  Future<void> _getImage() async {
    final pickedFile =
        // ignore: deprecated_member_use
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // ignore: unused_element
  Widget _buildImageWidget() {
    return _image != null
        ? Image.file(
            _image!,
            height: 150.0,
            width: 150.0,
            fit: BoxFit.cover,
          )
        : const Placeholder(
            fallbackHeight: 150.0,
            fallbackWidth: 150.0,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text('Add Route'),
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back arrow icon
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 100.0,
                      right: 100,
                      top: 20), // Set the desired padding here
                  child: ClipOval(
                    child: Image.asset(
                      'img/road.png', // Replace with the path to your image asset
                      width: 80, // Set the width of the image
                      height: 80, // Set the height of the image
                    ),
                  ),
                ),
                const SizedBox(height: 0.0),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Reg. No',
                          border:
                              OutlineInputBorder(), // Add a border around the input field
                        ),
                        controller: TextEditingController(
                          text: selectedOption ?? '',
                        ),
                        readOnly: true,
                        onTap: () {
                          showMenu(
                            context: context,
                            position:
                                const RelativeRect.fromLTRB(10, 270, 10, 0),
                            items: dropdownOptions.map((String option) {
                              return PopupMenuItem<String>(
                                value: option,
                                child: Text(option),
                              );
                            }).toList(),
                          ).then((value) {
                            if (value != null) {
                              setState(() {
                                selectedOption = value;
                              });
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Pickup Status',
                          border: OutlineInputBorder(),
                        ),
                        controller: TextEditingController(
                          text: selectedOption1 ?? '',
                        ),
                        readOnly: true,
                        onTap: () {
                          showMenu(
                            context: context,
                            position:
                                const RelativeRect.fromLTRB(10, 350, 10, 0),
                            items: dropdownOptions1.map((String option) {
                              return PopupMenuItem<String>(
                                value: option,
                                child: Text(option),
                              );
                            }).toList(),
                          ).then((value) {
                            if (value != null) {
                              setState(() {
                                selectedOption1 = value;
                              });
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Route Details',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Total Route Details';
                          }
                          // You can add more email validation logic here if needed
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 0.0,
                          maxWidth: 0.0, // Set the maximum width here
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 110.0,
                              right: 110,
                              bottom: 20), // Set the margin here
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                // Now you can use the _name and _email variables
                                // for further processing, like submitting the data.
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: const Color(
                                  0xFFffd800), // Button background color
                              elevation: 8, // Button elevation
                              padding:
                                  const EdgeInsets.all(16), // Button padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Button border radius
                              ),
                            ),
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.black, // Text color
                                fontSize: 18, // Text size
                                fontWeight: FontWeight.bold, // Text weight
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
