import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_mid_exam_flutter/Screen/View/Dash_screen.dart';
import 'package:re_mid_exam_flutter/Screen/View/home_screen.dart';
import 'package:re_mid_exam_flutter/Screen/View/result.dart';
import 'package:re_mid_exam_flutter/Screen/View/splace_screen.dart';
import 'package:re_mid_exam_flutter/Screen/provider/quiz_provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => ChangeNotifierProvider(
        create: (context) => QuizProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'splace',
          routes: {
            '/': (context) => DashScreen(),
            'home': (context) => HomeScreen(),
            'view': (context) => ViewScreen(),
            'splace': (context) => SplaceScreen(),

          },
        ),
      ),
    ),
  );
}
