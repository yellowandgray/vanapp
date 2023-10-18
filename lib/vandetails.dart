import 'package:flutter/material.dart';

class Vandetails extends StatelessWidget {
  const Vandetails({super.key, required this.routeNumber});
  final int routeNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text('Van Details'),
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 100.0, right: 100, top: 20, bottom: 20),
                  child: ClipOval(
                    child: Image.asset(
                      'img/van-02.png', // Replace with the path to your image asset
                      width: 40, // Set the width of the image
                      height: 40, // Set the height of the image
                    ),
                  ),
                ),
                Material(
                  color:
                      const Color(0xFFFFFFF0), // Set the background color here
                  // Adjust the radius as needed
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFF0),
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              const Icon(
                                Icons
                                    .fiber_manual_record, // You can use a different icon if you prefer
                                size: 16, // Adjust the size as needed
                                color:
                                    Colors.black, // Adjust the color as needed
                              ),
                              const SizedBox(
                                  width:
                                      8), // Add some spacing between the icon and text
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Route No: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: routeNumber
                                          .toString(), // Use the routeNumber parameter
                                      style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              const Icon(
                                Icons
                                    .fiber_manual_record, // You can use a different icon if you prefer
                                size: 16, // Adjust the size as needed
                                color:
                                    Colors.black, // Adjust the color as needed
                              ),
                              const SizedBox(
                                  width:
                                      8), // Add some spacing between the icon and text
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Reg No: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: 'TN 20 AP 5486',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              const Icon(
                                Icons
                                    .fiber_manual_record, // You can use a different icon if you prefer
                                size: 16, // Adjust the size as needed
                                color:
                                    Colors.black, // Adjust the color as needed
                              ),
                              const SizedBox(
                                  width:
                                      8), // Add some spacing between the icon and text
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 16, // Set the font size
                                    color: Colors.black, // Set the text color
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Make Year: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: 'SML/2007',
                                      style: TextStyle(
                                          fontWeight: FontWeight
                                              .normal), // Set to normal
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons
                                      .fiber_manual_record, // You can use a different icon if you prefer
                                  size: 16, // Adjust the size as needed
                                  color: Colors
                                      .black, // Adjust the color as needed
                                ),
                                const SizedBox(
                                    width:
                                        8), // Add some spacing between the icon and text
                                RichText(
                                  text: const TextSpan(
                                    style: TextStyle(
                                      fontSize: 16, // Set the font size
                                      color: Colors.black, // Set the text color
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Total No.of Seat: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: '32+1',
                                        style: TextStyle(
                                            fontWeight: FontWeight
                                                .normal), // Set to normal
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              const Icon(
                                Icons
                                    .fiber_manual_record, // You can use a different icon if you prefer
                                size: 16, // Adjust the size as needed
                                color:
                                    Colors.black, // Adjust the color as needed
                              ),
                              const SizedBox(
                                  width:
                                      8), // Add some spacing between the icon and text
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 16, // Set the font size
                                    color: Colors.black, // Set the text color
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Diesel Capacity Ltrs: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: '90',
                                      style: TextStyle(
                                          fontWeight: FontWeight
                                              .normal), // Set to normal
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              const Icon(
                                Icons
                                    .fiber_manual_record, // You can use a different icon if you prefer
                                size: 16, // Adjust the size as needed
                                color:
                                    Colors.black, // Adjust the color as needed
                              ),
                              const SizedBox(
                                  width:
                                      8), // Add some spacing between the icon and text
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 16, // Set the font size
                                    color: Colors.black, // Set the text color
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Engine No: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: 'SLTEP112312',
                                      style: TextStyle(
                                          fontWeight: FontWeight
                                              .normal), // Set to normal
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              const Icon(
                                Icons
                                    .fiber_manual_record, // You can use a different icon if you prefer
                                size: 16, // Adjust the size as needed
                                color:
                                    Colors.black, // Adjust the color as needed
                              ),
                              const SizedBox(
                                  width:
                                      8), // Add some spacing between the icon and text
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 16, // Set the font size
                                    color: Colors.black, // Set the text color
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Chassis No: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: 'OEZGL4GM011898',
                                      style: TextStyle(
                                          fontWeight: FontWeight
                                              .normal), // Set to normal
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(const MaterialApp(
//     home: Vandetails(),
//   ));
// }
