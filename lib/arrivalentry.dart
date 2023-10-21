import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataModel extends ChangeNotifier {
  List<String> dataList = [];

  void addData(String data) {
    dataList.add(data);
    notifyListeners();
  }
}

class ArrivalPage extends StatelessWidget {
  const ArrivalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Van App',
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.purple,
            title: const Text(
              'Arrival Entry',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: const MyTable(),
        ),
      ),
    );
  }
}

class MyTable extends StatefulWidget {
  const MyTable({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyTableState createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  String? selectedValue;
  String? recordedTime;
  String? selectedValues;
  String? selectedValuess;
  String? selectedValuesss;

  List<String> options = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
  List<String> dropdownOptionss = [
    'Ram',
    'Ravi',
    'Aravind',
    'Babu',
    'David',
    'John',
    'Raja',
    'Ramu',
    'Raj',
    'Ajay',
    'Balu',
    'Daniel'
  ];
  List<String> dropdownOptions = ['Yes', 'No'];
  List<String> dropdownOption = ['Yes', 'No'];
  List<String> dataList = [];
  final TextEditingController textController = TextEditingController();
  final TextEditingController textController2 = TextEditingController();
  final TextEditingController textController3 = TextEditingController();
  final TextEditingController textController4 = TextEditingController();
  final TextEditingController textController5 = TextEditingController();
  final TextEditingController textController6 = TextEditingController();

  void recordTime() {
    final now = DateTime.now();
    final formattedTime = DateFormat('HH:mm').format(now);
    setState(() {
      recordedTime = formattedTime;
    });
    textController2.text = recordedTime!;
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      dataList = prefs.getStringList('dataList') ?? [];
    });
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('dataList', dataList);
  }

  @override
  void initState() {
    super.initState();
    loadData(); // Load data from shared preferences when the page is initialized
  }

  @override
  Widget build(BuildContext context) {
    DataModel dataModel = Provider.of<DataModel>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Row(
                //   children: [
                //     const Expanded(
                //       flex: 2,
                //       child: Text(
                //         'R. No:',
                //         style: TextStyle(fontSize: 16),
                //       ),
                //     ),
                //     Expanded(
                //       flex: 3,
                //       child: DropdownButtonFormField<String>(
                //         value: selectedValue,
                //         onChanged: (String? newValue) {
                //           setState(() {
                //             selectedValue = newValue;
                //           });
                //           textController.text = newValue!;
                //         },
                //         items: options.map((String value) {
                //           return DropdownMenuItem<String>(
                //             value: value,
                //             child: Text(value),
                //           );
                //         }).toList(),
                //         decoration: InputDecoration(
                //           labelText: 'Select',
                //           isDense: true,
                //           contentPadding: const EdgeInsets.symmetric(
                //               horizontal: 12.0, vertical: 14.0),
                //           border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(4.0),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Image.asset('img/way.png',
                              width: 30,
                              height:
                                  30), // Replace 'my_icon' with the desired icon
                          const SizedBox(
                              width:
                                  8), // Add some space between the icon and the label
                          const Text(
                            'R. No:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: DropdownButtonFormField<String>(
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue;
                            // Set the corresponding driver name based on the selected 'R. No'
                            selectedValuesss =
                                dropdownOptionss[options.indexOf(newValue!)];
                          });
                          textController.text = newValue!;
                          textController6.text =
                              dropdownOptionss[options.indexOf(newValue)];
                        },
                        items: options.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: 'Select',
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 14.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Row(children: [
                          Image.asset('img/driver1.png',
                              width: 30,
                              height:
                                  30), // Replace 'my_icon' with the desired icon
                          const SizedBox(width: 8),

                          const Text(
                            'Driver Name:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ])),
                    Expanded(
  flex: 3,
  child: TextFormField(
    controller: textController6,
    readOnly: true, // To make it non-editable
    decoration: InputDecoration(
      labelText: '', // Set your label text here
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 14.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
  ),
),

                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Row(children: [
                          Image.asset('img/clock.png',
                              width: 30,
                              height:
                                  30), // Replace 'my_icon' with the desired icon
                          const SizedBox(width: 8),

                          const Text(
                            'Arrived Time:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ])),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextButton(
                              onPressed: () {
                                recordTime();
                              },
                              child: Text(
                                recordedTime ?? 'Record Time',
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Row(children: [
                          Image.asset('img/girl.png',
                              width: 30,
                              height:
                                  30), // Replace 'my_icon' with the desired icon
                          const SizedBox(width: 8),

                          const Text(
                            'CCG Present:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ])),
                    Expanded(
                      flex: 3,
                      child: DropdownButtonFormField<String>(
                        value: selectedValues,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValues = newValue;
                          });
                          textController3.text = newValue!;
                        },
                        items: dropdownOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: 'Select',
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 14.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Row(children: [
                          Image.asset('img/shirt.png',
                              width: 30,
                              height:
                                  30), // Replace 'my_icon' with the desired icon
                          const SizedBox(width: 8),

                          const Text(
                            'Uniform: ',
                            style: TextStyle(fontSize: 16),
                          ),
                        ])),
                    Expanded(
                      flex: 3,
                      child: DropdownButtonFormField<String>(
                        value: selectedValuess,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValuess = newValue;
                          });
                          textController4.text = newValue!;
                        },
                        items: dropdownOption.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: 'Select',
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 14.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 0),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        controller: textController5,
                        decoration: const InputDecoration(labelText: 'Remarks'),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 80.0, right: 80, bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        final data =
                            "${textController.text}|${textController6.text}|${textController2.text}|${textController3.text}|${textController4.text}|${textController5.text}";
                        if (textController.text.isEmpty ||
                            textController2.text.isEmpty ||
                            textController3.text.isEmpty ||
                            textController4.text.isEmpty ||
                            textController6.text.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content:
                                    const Text('Please fill in all details.'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFffd800),
                                    ),
                                    child: const Text(
                                      'OK',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          dataModel.addData(data);
                          saveData(); // Save the updated dataList to SharedPreferences

                          // Clear the text fields
                          textController.clear();
                          textController2.clear();
                          textController3.clear();
                          textController4.clear();
                          textController5.clear();
                          textController6.clear();

                          // Clear the selected values in DropdownButtonFormField
                          selectedValue = null;
                          selectedValues = null;
                          selectedValuess = null;
                          selectedValuesss = null;
                          recordedTime = null;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor:
                            const Color(0xFFffd800), // Button background color
                        elevation: 8, // Button elevation
                        padding: const EdgeInsets.only(
                            left: 40,
                            right: 40,
                            top: 17,
                            bottom: 17), // Button padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Button border radius
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: dataModel.dataList.length,
            itemBuilder: (context, index) {
              List<String> rowData = dataModel.dataList[index].split('|');
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(
                        0xFFFFFFF0), // Set your desired background color here
                    border: Border.all(
                      color: Colors.black, // Set your desired border color
                      width: 1.0, // Set the width of the border
                    ),
                    borderRadius: BorderRadius.circular(
                        10.0), // Set your desired border radius
                  ),
                  margin:
                      const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0), // Add the desired padding here
                    child: ListTile(
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'R. No: ${rowData[0]}',
                                  style: const TextStyle(
                                    fontSize: 16, // Increase the font size
                                    fontWeight:
                                        FontWeight.bold, // Make the text bold
                                  ),
                                ),
                              ),
                              const SizedBox(width: 0),
                              Image.asset('img/driver1.png',
                                  width: 30, height: 30),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  // ignore: unnecessary_string_interpolations
                                  '${rowData[1]}',
                                  style: const TextStyle(
                                    fontSize: 16, // Increase the font size
                                    fontWeight:
                                        FontWeight.bold, // Make the text bold
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                               Image.asset('img/shirt.png',
                                  width: 30, height: 30),
                              const SizedBox(width: 8),
                              Expanded(
                                
                               child: Text(
    '${rowData[4]}',
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: rowData[4] == 'Yes' ? Colors.green : Colors.red,
    ),
  ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                             
                               Image.asset('img/clock.png',
                                  width: 30, height: 30),
                              const SizedBox(width: 8),
                              Expanded(
                                 flex: 1,
                                child: Text(
                                
                                  // ignore: unnecessary_string_interpolations
                                  '${rowData[2]}',
                                  style: const TextStyle(
                                    fontSize: 16, // Increase the font size
                                    fontWeight:
                                        FontWeight.bold, // Make the text bold
                                  ),
                                ),
                              ),
                              const SizedBox(width: 19),
                              Image.asset('img/girl.png',
                                  width: 30, height: 30),
                              const SizedBox(width: 8),
                             Expanded(
  child: Text(
    '${rowData[3]}',
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: rowData[3] == 'Yes' ? Colors.green : Colors.red,
    ),
  ),
),

                              const SizedBox(width: 8),
                              Image.asset('img/notepad.png',
                                  width: 30, height: 30),
                              const SizedBox(width: 8),
                             Expanded(
  child: GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Remarks"),
            content: Text('${rowData[5]}'),
            actions: <Widget>[
              TextButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    },
   child: Text(
      '${rowData[5]}',
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 1, // Set to 1 line
      overflow: TextOverflow.ellipsis,
    ),
  ),
),

                            ],
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(const ArrivalPage());
}
