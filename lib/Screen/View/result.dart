import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    int count = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(count>=5?'assets/images/w.png':'assets/images/l.png'),
              Text('your Score : ${count!}',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,),),
            ],
          ),
        ),
      ),
    );
  }
}
