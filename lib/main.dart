import 'package:flutter/material.dart';
import 'package:vanapp/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Van App',
      home: MySplashScreen(), // Use MySplashScreen here initially
    );
  }
}

// ignore: use_key_in_widget_constructors

// ignore: use_key_in_widget_constructors
class MySplashScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay to display the splash screen for a few seconds
    Future.delayed(const Duration(seconds: 3), () {
      // After the delay, navigate to the homepage
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                      bottom: 70.0), // You can adjust the value as needed
                  child: Text(
                    'Mekana International School',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
                // Circular image
                Material(
                  elevation: 8, // Adjust the elevation as needed
                  shape: const CircleBorder(), // Create a circular shape
                  child: ClipOval(
                    child: Image.asset(
                      'img/logo1.gif',
                      width: 170.0,
                      height: 170.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 30.0), // You can adjust the value as needed
                  child: Text(
                    'Van Modules',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
