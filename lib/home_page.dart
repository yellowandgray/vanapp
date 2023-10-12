// ignore_for_file: sort_child_properties_last, duplicate_ignore

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vanapp/addDriver.dart';
import 'package:vanapp/addroute.dart';
import 'package:vanapp/addvan.dart';
// ignore: unused_import
import 'package:vanapp/map.dart';
import 'package:vanapp/arrivalentry.dart';
import 'package:vanapp/routesheet.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedStatus = 'All';
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          toolbarHeight: 80.0,
          backgroundColor: Colors.purple,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 16.0), // Set your desired right padding value
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () {
                  _scaffoldKey.currentState!
                      .openEndDrawer(); // Open the end drawer
                },
              ),
            ),
          ],
          flexibleSpace: Padding(
            padding:
                const EdgeInsets.all(16.0), // Set your desired padding values
            child: Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Image.asset(
                    'img/logo2.gif', // Replace with the path to your image asset
                    width: 90, // Set the desired width of the image
                    height: 90, // Set the desired height of the image
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 0.0,
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        endDrawer: Padding(
          padding: const EdgeInsets.only(
              bottom: 150.0, right: 10), // Set the desired padding here
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
                16.0), // Set the desired border radius here
            child: SizedBox(
              width: 220,
              height: 600,
              child: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      color: Colors
                          .purple, // Set the desired background color here
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                'img/logo3.webp'), // Set your image here
                            radius: 50.0,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Van App',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons
                          .add_box_sharp), // Replace Icons.directions_car with the desired icon
                      title: const Text('Add Route'),
                      titleTextStyle:
                          const TextStyle(fontSize: 16, color: Colors.black),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddRoute(),
                          ),
                        );
                        // Close the drawer after navigating
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons
                          .directions_bus_filled_sharp), // Replace Icons.person with the desired icon
                      title: const Text('Add Van'),
                      titleTextStyle:
                          const TextStyle(fontSize: 16, color: Colors.black),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Addvan(),
                          ),
                        );
                        // Add the functionality you want when this end drawer item is tapped.
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                          Icons.person_add), // Replace with the desired icon
                      title: const Text('Add Driver'),
                      titleTextStyle:
                          const TextStyle(fontSize: 16, color: Colors.black),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddDriver(),
                          ),
                        );
                        // Add the functionality you want when this ListTile is tapped.
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                          Icons.map), // Replace with the desired icon
                      title: const Text('Map driver'),
                      titleTextStyle:
                          const TextStyle(fontSize: 16, color: Colors.black),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapPage(),
                          ),
                        );
                        // Add the functionality you want when this ListTile is tapped.
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                          Icons.settings), // Replace with the desired icon
                      title: const Text('Maintenance'),
                      titleTextStyle:
                          const TextStyle(fontSize: 16, color: Colors.black),
                      onTap: () {
                        Navigator.pop(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const MapPage(),
                        //   ),
                        // );
                        // Add the functionality you want when this ListTile is tapped.
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons
                          .local_gas_station), // Replace with the desired icon
                      title: const Text('Fuel'),
                      titleTextStyle:
                          const TextStyle(fontSize: 16, color: Colors.black),
                      onTap: () {
                        Navigator.pop(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const MapPage(),
                        //   ),
                        // );
                        // Add the functionality you want when this ListTile is tapped.
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons
                          .currency_rupee_sharp), // Replace with the desired icon
                      title: const Text('Fees'),
                      titleTextStyle:
                          const TextStyle(fontSize: 16, color: Colors.black),
                      onTap: () {
                        Navigator.pop(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const MapPage(),
                        //   ),
                        // );
                        // Add the functionality you want when this ListTile is tapped.
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                          Icons.exit_to_app), // Replace with the desired icon
                      title: const Text('Exit'),
                      titleTextStyle:
                          const TextStyle(fontSize: 16, color: Colors.black),
                      onTap: () {
                        Navigator.pop(context);
                        exit(0);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First row: Date and input box
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center the content vertically
                      children: [
                        // Text widget for Date
                        const Expanded(
                          flex: 1,
                          child: Text(
                            'Date: ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        // Input box (TextFormField) for Date
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () => _selectDate(context),
                            child: InputDecorator(
                              decoration: const InputDecoration(
                                labelText: 'Select Date',
                                border: OutlineInputBorder(),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8.0),
                              ),
                              child: Text(
                                "${selectedDate.toLocal()}".split(' ')[0],
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 1.0), // Add vertical spacing between rows
                    // Second row: Status and dropdown box
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            'Status: ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: DropdownButton<String>(
                            value: selectedStatus, // Set the selected value
                            items: <String>['All', 'Delay', 'On time']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                  color: value !=
                                          'All' // Only set background color for non-'All' items
                                      ? value == 'Delay'
                                          ? Colors.red
                                          : Colors.green
                                      : null, // Use null to remove background color for 'All'
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5.0,
                                    horizontal: 16.0,
                                  ),
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: value != 'All'
                                          ? Colors.white
                                          : Colors.black, // Text color
                                      fontSize: 16.0, // Text size
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              // Update the selected value when the user makes a selection
                              setState(() {
                                selectedStatus = newValue;
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20,
                    bottom: 20), // Add padding to the Table
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(
                        1), // Adjust the width of the first column
                    1: FlexColumnWidth(
                        2), // Adjust the width of the second column
                    2: FlexColumnWidth(
                        3), // Adjust the width of the third column
                  },
                  border: TableBorder.all(),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                      children: const [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'R.No',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign
                                  .center, // Center the text horizontally
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Arrived',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign
                                  .center, // Center the text horizontally
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Remarks',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign
                                  .center, // Center the text horizontally
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              '1',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            // Set your desired background color
                            padding: const EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: const Text(
                              '9:45 AM',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                // backgroundColor: Colors
                                // Set the background color of the text
                                color: Colors.red, // Set the text color
                              ),
                            ),
                          ),
                        ),
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                5.0), // Adjust the padding as needed
                            child: Text(
                              'Because of repair',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              '2',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            // Set your desired background color
                            padding: const EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: const Text(
                              '9:10 AM',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                // backgroundColor: Colors
                                // Set the background color of the text
                                color: Colors.green, // Set the text color
                              ),
                            ),
                          ),
                        ),
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              '-',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              '3',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            // Set your desired background color
                            padding: const EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: const Text(
                              '9:12 AM',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                // backgroundColor: Colors
                                // Set the background color of the text
                                color: Colors.green, // Set the text color
                              ),
                            ),
                          ),
                        ),
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              '-',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              '4',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            // Set your desired background color
                            padding: const EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: const Text(
                              '9:30 AM',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                // backgroundColor: Colors
                                // Set the background color of the text
                                color: Colors.red, // Set the text color
                              ),
                            ),
                          ),
                        ),
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              'Some reason',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              '5',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            // Set your desired background color
                            padding: const EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: const Text(
                              '9:00 AM',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                // backgroundColor: Colors
                                // Set the background color of the text
                                color: Colors.green, // Set the text color
                              ),
                            ),
                          ),
                        ),
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              'Some reason',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              '6',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            // Set your desired background color
                            padding: const EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: const Text(
                              '9:45 AM',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                // backgroundColor: Colors
                                // Set the background color of the text
                                color: Colors.red, // Set the text color
                              ),
                            ),
                          ),
                        ),
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              'Some reason',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              '7',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            // Set your desired background color
                            padding: const EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: const Text(
                              '9:50 AM',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                // backgroundColor: Colors
                                // Set the background color of the text
                                color: Colors.red, // Set the text color
                              ),
                            ),
                          ),
                        ),
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              'Some reason',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              '8',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            // Set your desired background color
                            padding: const EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: const Text(
                              '9:28 AM',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                // backgroundColor: Colors
                                // Set the background color of the text
                                color: Colors.red, // Set the text color
                              ),
                            ),
                          ),
                        ),
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              'Some reason',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              '9',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            // Set your desired background color
                            padding: const EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: const Text(
                              '9:45 AM',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                // backgroundColor: Colors
                                // Set the background color of the text
                                color: Colors.red, // Set the text color
                              ),
                            ),
                          ),
                        ),
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              'Some reason',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              '10',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            // Set your desired background color
                            padding: const EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: const Text(
                              '9:45 AM',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                // backgroundColor: Colors
                                // Set the background color of the text
                                color: Colors.green, // Set the text color
                              ),
                            ),
                          ),
                        ),
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(
                                10.0), // Adjust the padding as needed
                            child: Text(
                              'Some reason',
                              style: TextStyle(fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                        height: 0), // Add some spacing between the rows
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0,
                          left: 40.0,
                          right: 40,
                          bottom: 10), // Adjust the padding as needed
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ArrivalPage(),
                            ),
                          );
                          // Add your code for the button here
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor: const Color(0xFFff6b89),
                          minimumSize: const Size(170, 70), // Fixed square size
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                50.0), // Adjust the radius as needed
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Image.asset(
                                'img/logo2.gif', // Replace with the path to your image asset
                                width: 60, // Set the width of the image
                                height: 60, // Set the height of the image
                              ),
                            ),
                            const SizedBox(
                              width:
                                  0, // Add some spacing between the image and text
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                right: 0,
                                left: 30,
                              ), // Adjust the padding as needed
                              child: Text(
                                "Arrival Entry",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,

                                  // Set text alignment to center
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10,
                          left: 40.0,
                          right: 40,
                          bottom: 40), // Adjust the padding as needed
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RouteSheets(),
                              ),
                            );
                            // Add your code for the button here
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor: const Color(0xFFffb732),
                            minimumSize:
                                const Size(170, 70), // Fixed square size
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  50.0), // Adjust the radius as needed
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15), // Adjust the padding as needed
                                child: Image.asset(
                                  'img/road.png', // Replace with the path to your image asset
                                  width: 40, // Set the width of the image
                                  height: 40, // Set the height of the image
                                  alignment: Alignment
                                      .topLeft, // Align the image to the top-left
                                ),
                              ),
                              const SizedBox(
                                width:
                                    0, // Add some spacing between the image and text
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 50,
                                    right: 0.0), // Adjust the padding as needed
                                child: Align(
                                  alignment: Alignment
                                      .centerLeft, // Align the text to the inside left-center
                                  child: Text(
                                    "Route Sheet",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
