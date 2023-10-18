// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:vanapp/report.dart';
import 'package:vanapp/vandetails.dart';

class RouteSheets extends StatelessWidget {
  const RouteSheets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text('Route Sheets'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Table(
            border: TableBorder.all(
              color: Colors.black, // Border color
              width: 1.0, // Border width
              style: BorderStyle.solid, // Border style
            ),
            columnWidths: const {
              0: FractionColumnWidth(0.2), // 20% of available width
              1: FractionColumnWidth(0.40), // 30% of available width
              2: FractionColumnWidth(0.25), // 25% of available width
              3: FractionColumnWidth(0.15), // 15% of available width
            },
            children: <TableRow>[
              TableRow(
                decoration: const BoxDecoration(
                    // color: Colors.grey, // Optional: Add a background color to the header row
                    ),
                children: [
                  TableCell(
                    child: Container(
                      color: Colors.grey[300], // Set the background color here
                      child: const Center(
                        child: SizedBox(
                          height: 40.0,
                          child: Center(
                            child: Text(
                              'R.No',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      color: Colors.grey[300], // Set the background color here
                      child: const Center(
                        child: SizedBox(
                          height: 40.0, // Set the column height here
                          child: Center(
                            child: Text(
                              'Van Reg. No.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      color: Colors.grey[300], // Set the background color here
                      child: const Center(
                        child: SizedBox(
                          height: 40.0, // Set the column height here
                          child: Center(
                            child: Text(
                              'Driver',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      color: Colors.grey[300], // Set the background color here
                      child: const Center(
                        child: SizedBox(
                          height: 40.0, // Set the column height here
                          child: Center(
                            child: Text(
                              'Report',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '1',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the van details page when the container is tapped
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Vandetails(
                              routeNumber: 1,
                            ), // Replace with the actual page you want to navigate to
                          ));
                        },
                        child: const Text(
                          'TN 20 AQ 7909',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration
                                .underline, // Add underline to make it look like a link
                            color: Colors
                                .blue, // Change the text color to indicate a link
                          ),
                        ),
                      ),
                    ),
                  ),
                  const TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Mani',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to a new page when the icon is clicked.
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                // Replace `NewPage` with the actual widget for your new page.
                                return const Reportpage();
                              },
                            ));
                          },
                          child: const Icon(
                            Icons.remove_red_eye,
                            size: 24,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '2',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Ravi',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '3',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Mari',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '4',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Kalai',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '5',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Suresh',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '6',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Selvam',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '7',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Kathir',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '8',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Raj',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '9',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Mukesh',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '10',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Ruban',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '11',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Karthi',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '12',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Manoj',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '13',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Siva',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '14',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Suresh',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '15',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Mani',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '16',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Mani',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '17',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Mani',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '18',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Mani',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '19',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Mani',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '20',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'TN 20 AQ 7909',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        'Mani',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: SizedBox(
                      height: 40.0, // Set the height of the TableCell here
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Add more TableRow widgets for additional rows.
            ],
          ),
        ),
      ),
    );
  }
}
