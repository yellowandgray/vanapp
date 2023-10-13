import 'package:flutter/material.dart';
import 'package:vanapp/vandetails.dart';

class Reportpage extends StatefulWidget {
  const Reportpage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Reportpage> {
  String? selectedStatus = 'All';
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text('Route No.1 Details'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.all(
                  20.0), // Set padding before the Container
              child: GestureDetector(
                onTap: () {
                  // Navigate to the van details page when the container is tapped
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const Vandetails(), // Replace with the actual page you want to navigate to
                  ));
                },
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFF0),
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 20,
                        child: Image.asset(
                          'img/van-01 copy.png',
                          width: 100,
                          height: 60,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Positioned(
                        top: 0,
                        left: 150,
                        child: Text(
                          'Reg. No: TN 20 AQ 7909',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                      const Positioned(
                        top: 22,
                        left: 150,
                        child: Text(
                          'Driver: Mani',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                      const Positioned(
                        top: 45,
                        left: 150,
                        child: Text(
                          'Total Seats: 32+1',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 1,
                  child: Text(
                    'Status: ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: DropdownButton<String>(
                    value: selectedStatus,
                    items:
                        <String>['All', 'Delay', 'On time'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          color: value != 'All'
                              ? value == 'Delay'
                                  ? Colors.red
                                  : Colors.green
                              : null,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 16.0,
                          ),
                          child: Text(
                            value,
                            style: TextStyle(
                              color:
                                  value != 'All' ? Colors.white : Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedStatus = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Table(border: TableBorder.all(), children: [
              // Add border to the Table

              TableRow(
                decoration: BoxDecoration(
                  color: Colors
                      .grey[300], // Add a background color to the TableRow
                ),
                children: const [
                  TableCell(
                    child: Padding(
                      padding:
                          EdgeInsets.all(10.0), // Adjust the padding as needed
                      child: Text(
                        'Date',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding:
                          EdgeInsets.all(10.0), // Adjust the padding as needed
                      child: Text(
                        'Arrived',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding:
                          EdgeInsets.all(10.0), // Adjust the padding as needed
                      child: Text(
                        'Remarks',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const TableCell(
                    child: Padding(
                      padding:
                          EdgeInsets.all(10.0), // Adjust the padding as needed
                      child: Text(
                        '11/10/23',
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
                      padding:
                          EdgeInsets.all(5.0), // Adjust the padding as needed
                      child: Text(
                        'Because of repair',
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
                      padding:
                          EdgeInsets.all(10.0), // Adjust the padding as needed
                      child: Text(
                        '10/10/23',
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
                      padding:
                          EdgeInsets.all(5.0), // Adjust the padding as needed
                      child: Text(
                        '-',
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
                      padding:
                          EdgeInsets.all(10.0), // Adjust the padding as needed
                      child: Text(
                        '9/10/23',
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
                      padding:
                          EdgeInsets.all(5.0), // Adjust the padding as needed
                      child: Text(
                        '-',
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
                      padding:
                          EdgeInsets.all(10.0), // Adjust the padding as needed
                      child: Text(
                        '8/10/23',
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
                      padding:
                          EdgeInsets.all(5.0), // Adjust the padding as needed
                      child: Text(
                        'Because of repair',
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
                      padding:
                          EdgeInsets.all(10.0), // Adjust the padding as needed
                      child: Text(
                        '7/10/23',
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
                      padding:
                          EdgeInsets.all(5.0), // Adjust the padding as needed
                      child: Text(
                        'Because of repair',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
