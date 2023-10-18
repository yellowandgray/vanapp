// RouteNo.dart

import 'package:flutter/material.dart';
import 'package:vanapp/vandetails.dart';

class RouteNo extends StatefulWidget {
  RouteNo({Key? key}) : super(key: key);

  @override
  _RouteNoState createState() => _RouteNoState();
}

class _RouteNoState extends State<RouteNo> {
  int selectedRoute = 1; // Initialize with a default route number

  final List<int> numbers =
      List.generate(24, (index) => index + 1); // Generating 24 numbers
  final List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.pink
  ];

  Color getColorForIndex(int index) {
    return colors[index % colors.length];
  }

  void selectRoute(int route) {
    setState(() {
      selectedRoute = route;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text('Route No'),
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // 4 items per row
            ),
            itemCount: numbers.length,
            itemBuilder: (context, index) {
              final color = getColorForIndex(index);
              return AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: 1.0,
                child: CircleNumber(numbers[index], color, index, selectRoute),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CircleNumber extends StatelessWidget {
  final int number;
  final Color color;
  final int index;
  final Function(int) onSelectRoute; // Function to update the selected route

  const CircleNumber(this.number, this.color, this.index, this.onSelectRoute,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelectRoute(number); // Pass the selected number to the parent widget
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) {
              return Vandetails(routeNumber: number);
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // Enter from the right
              const end = Offset.zero;
              const curve = Curves.easeInOut;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        width: 60,
        height: 60,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
