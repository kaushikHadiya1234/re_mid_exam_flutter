import 'package:flutter/material.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0x1D1D69),
        body: Stack(
          children: [
            Image.asset(
              'assets/images/kbc.jpg',
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:30.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton.extended(onPressed: () {
                  Navigator.pushNamed(context, 'home');
                },label: Text("Play"),backgroundColor: Colors.yellow,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
