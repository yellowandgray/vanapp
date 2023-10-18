// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class AddDriver extends StatefulWidget {
  const AddDriver({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddDriverState createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Define variables to hold form data
  // ignore: unused_field
  String _name = '';
  // ignore: unused_field
  String _email = '';
  final List<File?> _images =
      List.generate(3, (_) => null); // List to store the uploaded images

  void _pickImage(int index) async {
    final pickedImage =
        // ignore: deprecated_member_use
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final localPath = '${appDir.path}/$fileName.jpg';

      await File(pickedImage.path).copy(localPath);

      setState(() {
        _images[index] = File(localPath);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text('Add Driver Details'),
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
                      top: 15), // Set the desired padding here
                  child: ClipOval(
                    child: Image.asset(
                      'img/driver.png', // Replace with the path to your image asset
                      width: 60, // Set the width of the image
                      height: 60, // Set the height of the image
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
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _name = value!;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Age',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Age';
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
                          labelText: 'D.O.B',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Data of Birth';
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
                          labelText: 'D.O.J',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Data of Joining';
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
                          labelText: 'Address',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Address';
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
                          labelText: 'Town/Village',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Town/Village';
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
                          labelText: 'Pincode',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Pincode';
                          }
                          // You can add more email validation logic here if needed
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      const SizedBox(height: 20.0),
                      Column(
                        children: [
                          const Text(
                            'Attachments:',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),

                          // Add a button to pick an image
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0), // Adjust the padding as needed
                                child: Column(
                                  children: [
                                    _images[0] != null
                                        ? Image.file(
                                            _images[0]!,
                                            height: 100,
                                          )
                                        : Image.asset(
                                            'img/imageplaceholder.png',
                                            height: 100,
                                          ),
                                    ElevatedButton(
                                      onPressed: () => _pickImage(
                                          0), // Call _pickImage with index 0
                                      // ignore: sort_child_properties_last
                                      child: const Text(
                                        'Photo',
                                        style: TextStyle(
                                            // You can set other text styles here
                                            ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40,
                                            vertical: 10), // Set padding
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 5.3,
                                    left: 25), // Adjust the padding as needed
                                child: Column(
                                  children: [
                                    _images[1] != null
                                        ? Image.file(
                                            _images[1]!,
                                            height: 100,
                                          )
                                        : Image.asset(
                                            'img/imageplaceholder.png',
                                            height: 100,
                                          ),
                                    ElevatedButton(
                                      onPressed: () => _pickImage(
                                          1), // Call _pickImage with index 1
                                      child: const Text(
                                        'Aadhar Card',
                                        style: TextStyle(
                                            // You can set other text styles here
                                            ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 35,
                                            vertical: 10), // Set padding
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0), // Adjust the padding as needed
                                child: Column(
                                  children: [
                                    _images[1] != null
                                        ? Image.file(
                                            _images[1]!,
                                            height: 100,
                                          )
                                        : Image.asset(
                                            'img/imageplaceholder.png',
                                            height: 100,
                                          ),
                                    ElevatedButton(
                                      onPressed: () => _pickImage(
                                          1), // Call _pickImage with index 1
                                      child: const Text(
                                        'License',
                                        style: TextStyle(
                                            // You can set other text styles here
                                            ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40,
                                            vertical: 10), // Set padding
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 5.3,
                                    left: 25), // Adjust the padding as needed
                                child: Column(
                                  children: [
                                    _images[2] != null
                                        ? Image.file(
                                            _images[2]!,
                                            height: 100,
                                          )
                                        : Image.asset(
                                            'img/imageplaceholder.png',
                                            height: 100,
                                          ),
                                    ElevatedButton(
                                      onPressed: () => _pickImage(
                                          2), // Call _pickImage with index 2
                                      child: const Text(
                                        'Pan Card',
                                        style: TextStyle(
                                            // You can set other text styles here
                                            ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40,
                                            vertical: 10), // Set padding
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom:
                                    18.0), // Set the padding for the SizedBox
                            child: SizedBox(
                              width: 150, // Set the desired width here
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
                                  padding: const EdgeInsets.all(
                                      16), // Button padding
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
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
