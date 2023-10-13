// ignore_for_file: unused_field

// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Addvan extends StatefulWidget {
  const Addvan({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdddriverState createState() => _AdddriverState();
}

class _AdddriverState extends State<Addvan> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? _image; // Variable to store the selected image

  // Define variables to hold form data
  final String _name = '';
  String _email = '';
  String? _selectedRouteNo;
  String? selectedOption;
  List<String> dropdownOptions = ['1', '2', '3', '4', '5'];
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
        title: const Text('Add Van Details'),
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                      'img/van-02.png', // Replace with the path to your image asset
                      width: 40, // Set the width of the image
                      height: 40, // Set the height of the image
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
                                const RelativeRect.fromLTRB(10, 230, 10, 0),
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
                          labelText: 'Make Year',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Make Year';
                          }
                          // You can add more email validation logic here if needed
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Total No.of Seat',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Total No.of Seat';
                          }
                          // You can add more email validation logic here if needed
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Disel Capacity Ltrs',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Disel Capacity Ltrs';
                          }
                          // You can add more email validation logic here if needed
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Engine No',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Engine No';
                          }
                          // You can add more email validation logic here if needed
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Chassis Number',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Chassis Number';
                          }
                          // You can add more email validation logic here if needed
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                      ElevatedButton(
                        onPressed: _getImage, // Open image picker dialog
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero, // Remove default padding
                          backgroundColor: Colors
                              .white, // Set the background color to transparent
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height:
                                  5, // Adjust the spacing between text and image
                            ),
                            Image.asset(
                              'img/imageplaceholder.png', // Replace with your placeholder image asset path
                              width:
                                  100, // Adjust the width of the placeholder image
                              height:
                                  100, // Adjust the height of the placeholder image
                              fit: BoxFit
                                  .cover, // Choose an appropriate BoxFit option
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  bottom: 8.0), // Set the desired padding
                              child: Text(
                                'Select Van Image',
                                style: TextStyle(
                                  color: Colors
                                      .black, // Change text color as needed
                                ),
                              ),
                            ),
                          ],
                        ),
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
