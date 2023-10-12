import 'package:flutter/material.dart';

import 'home_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String? selectedOption;
  String? driverOption;

  // List of options for the dropdown
  List<String> dropdownOptions = ['1', '2', '3', '4', '5'];
  List<String> driverOptions = ['Ram', 'Vetri', 'Moorthi', 'John', 'Raja'];

  // Data to display based on selected option
  Map<String, Map<String, dynamic>> optionData = {
    '1': {
      'imagePath': 'img/van1.webp',
      'text1': 'TN 20 AP 5486',
      'text2': 'Vetri',
      'text3': '32+1',
      'text4': 'SLT3GA154599',
    },
    '2': {
      'imagePath': 'img/van2.jpg',
      'text1': 'TN 20 AQ 7909',
      'text2': 'Moorthi',
      'text3': '30+1',
      'text4': 'SLTEP112312',
    },
    '3': {
      'imagePath': 'img/van3.JPG',
      'text1': 'TN 20 AK 3124',
      'text2': 'Raja',
      'text3': '32+1',
      'text4': 'SLTER110161',
    },
    '4': {
      'imagePath': 'img/van4.jpg',
      'text1': 'TN 20 AE 7170',
      'text2': 'Ram',
      'text3': '30+1',
      'text4': 'SLTFM103111',
    },
    // Add data for other options here
  };
  Map<String, Map<String, dynamic>> optionData2 = {
    'Ram': {
      'imagePath': 'img/dri1.jpg',
      'text1': '10/2/90',
      'text2': '15/9/20',
      'text3': '1',
      'text4': 'Koyambedu',
    },
    'Vetri': {
      'imagePath': 'img/dri2.jpg',
      'text1': '30/5/88',
      'text2': '9/2/22',
      'text3': '10',
      'text4': 'Thambaram',
    },
    'Moorthi': {
      'imagePath': 'img/dri3.jpg',
      'text1': '18/12/93',
      'text2': '6/8/19',
      'text3': '6',
      'text4': 'Velachery',
    },
    'John': {
      'imagePath': 'img/dri4.jpg',
      'text1': '1/5/85',
      'text2': '25/10/23',
      'text3': '15',
      'text4': 'Navalur',
    },
    // Add data for other options here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text('Map Van & Driver'),
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // First input box
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'R. No',
                      ),
                      controller: TextEditingController(
                          text:
                              selectedOption ?? ''), // Set the selected option
                      readOnly: true, // Make the text field read-only
                      onTap: () {
                        // Show the dropdown menu
                        showMenu(
                          context: context,
                          position:
                              const RelativeRect.fromLTRB(20, 170, 100, 0),
                          items: dropdownOptions.map((String option) {
                            return PopupMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                        ).then((value) {
                          // Handle the selected option
                          if (value != null) {
                            setState(() {
                              selectedOption = value;
                            });
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
                height: 0), // Add some spacing between the input boxes

            // Display content based on selected option
            if (selectedOption != null &&
                optionData.containsKey(selectedOption))
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipOval(
                      child: Image.asset(
                        optionData[selectedOption]!['imagePath'],
                        width: 120, // Adjust the width as needed
                        height: 120,
                        fit: BoxFit.fill,
                        // Adjust the height as needed
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Table(
                      border: TableBorder.all(), // Add borders to the table
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, bottom: 12, left: 8, right: 8),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Reg. No: ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      WidgetSpan(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            optionData[selectedOption]![
                                                'text1'],
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, bottom: 12, left: 8, right: 8),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Driver: ',
                                        style: TextStyle(
                                          fontSize: 15, color: Colors.black,
                                          fontWeight: FontWeight
                                              .bold, // Set the default text to bold
                                        ),
                                      ),
                                      TextSpan(
                                        text: optionData[selectedOption]![
                                            'text2'],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, bottom: 12, left: 8, right: 8),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Total Seats: ',
                                        style: TextStyle(
                                          fontSize: 15, color: Colors.black,
                                          fontWeight: FontWeight
                                              .bold, // Set the default text to bold
                                        ),
                                      ),
                                      TextSpan(
                                        text: optionData[selectedOption]![
                                            'text3'],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, bottom: 12, left: 8, right: 8),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Eng. No: ',
                                        style: TextStyle(
                                          fontSize: 15, color: Colors.black,
                                          fontWeight: FontWeight
                                              .bold, // Set the default text to bold
                                        ),
                                      ),
                                      WidgetSpan(
                                          child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          optionData[selectedOption]!['text4'],
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),

            // Second input box
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Driver Name',
                      ),
                      controller: TextEditingController(
                          text: driverOption ?? ''), // Set the selected option
                      readOnly: true, // Make the text field read-only
                      onTap: () {
                        // Show the dropdown menu
                        showMenu(
                          context: context,
                          position:
                              const RelativeRect.fromLTRB(20, 260, 100, 0),
                          items: driverOptions.map((String option) {
                            return PopupMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                        ).then((value) {
                          // Handle the selected option
                          if (value != null) {
                            setState(() {
                              driverOption = value;
                            });
                          }
                        });
                      },
                    ),
                  ),

                  //const Icon(Icons.arrow_drop_down), // Dropdown indicator icon
                ],
              ),
            ),
            const SizedBox(
                height: 20), // Add some spacing between the input boxes

            // Display content based on selected option
            if (driverOption != null && optionData2.containsKey(driverOption))
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipOval(
                      child: Image.asset(
                        optionData2[driverOption]!['imagePath'],
                        width: 100, // Adjust the width as needed
                        height: 100,
                        fit: BoxFit.fill, // Adjust the height as needed
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Table(
                      border: TableBorder.all(), // Add borders to the table
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'D.O.B: ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            optionData2[driverOption]!['text1'],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'D.O.J: ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            optionData2[driverOption]!['text2'],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Current Route: ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            optionData2[driverOption]!['text3'],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Area: ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            optionData2[driverOption]!['text4'],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            Container(
              margin: const EdgeInsets.only(left: 0.0, right: 0, bottom: 20),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the HomePage when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor:
                        const Color(0xFFffd800), // Button background color
                    elevation: 8, // Button elevation
                    padding: const EdgeInsets.only(
                        left: 55,
                        right: 55,
                        top: 15,
                        bottom: 15), // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Button border radius
                    ),
                  ),
                  child: const Text(
                    'Map',
                    style: TextStyle(
                      color: Colors.black, // Text color
                      fontSize: 18, // Text size
                      fontWeight: FontWeight.bold, // Text weight
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MapPage(),
  ));
}
