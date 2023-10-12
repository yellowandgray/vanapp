import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class DataModel extends ChangeNotifier {
  List<String> dataList = [];

  void addData(String data) {
    dataList.add(data);
    notifyListeners();
  }
}

class RoutePage extends StatelessWidget {
  const RoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) => DataModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
         title: 'Van App',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple, // Change the app bar color to blue
            title: const Text('Route Details', style: TextStyle(
      fontSize: 17, // Adjust the font size as needed
    ),),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back), // Add a back button
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
  final TextEditingController textController = TextEditingController();
    final TextEditingController textController2 = TextEditingController();
      final TextEditingController textController3 = TextEditingController();
        final TextEditingController textController4 = TextEditingController();
          final TextEditingController textController5
          
          
           = TextEditingController();
           

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
      TextField(
        controller: textController,
        decoration: const InputDecoration(labelText: 'R. No'),
      ),
      TextField(
        controller: textController2,
        decoration: const InputDecoration(labelText: 'Arrived Time'),
      ),
      TextField(
        controller: textController3,
        decoration: const InputDecoration(labelText: 'CCG Present'),
      ),
      TextField(
        controller: textController4,
        decoration: const InputDecoration(labelText: 'Driver Uniform'),
      ),
      TextField(
        controller: textController5,
        decoration: const InputDecoration(labelText: 'Remarks'),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: ElevatedButton(
          onPressed: () {
            final data = "${textController.text}|${textController2.text}|${textController3.text}|${textController4.text}|${textController5.text}";
            if (textController.text.isEmpty ||
                textController2.text.isEmpty ||
                textController3.text.isEmpty ||
                textController4.text.isEmpty ) {
              // Show an error message or handle the empty fields here
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: const Text('Please fill in all details.'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                         style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFffd800),
          ),
                        child: const Text('OK',style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),),
                      ),
                    ],
                  );
                },
              );
            } else {
              dataModel.addData(data);
              textController.clear();
              textController2.clear();
              textController3.clear();
              textController4.clear();
              textController5.clear();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFffd800),
          ),
          child: const Text(
            'Add',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
      ),
    ],
  ),
)


,
   Padding(
  padding: const EdgeInsets.all(8.0),
  child: SingleChildScrollView(
  scrollDirection: Axis.horizontal,
   child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), // Specify the border color here
      ),
      child: DataTable(
      columns:const [
        DataColumn(label: Text('R. No', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Arrived Time', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('CCG Present', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Driver Uniform', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Remarks', style: TextStyle(fontWeight: FontWeight.bold))),
      ],
      rows: dataModel.dataList.map((data) {
        List<String> rowData = data.split('|'); // Split data by '|' to get individual column values
        return DataRow(
          cells: rowData.map((item) {
            return DataCell(Text(item));
          }).toList(),
        );
      }).toList(),
    ),
    ),
   ),
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
