import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_mid_exam_flutter/Screen/Model/quiz.dart';
import 'package:re_mid_exam_flutter/Screen/provider/quiz_provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

QuizProvider? pf;
QuizProvider? pt;

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    // Provider.of<QuizProvider>(context, listen: false).setData();
  }

  @override

  Widget build(BuildContext context) {
    pf = Provider.of<QuizProvider>(context, listen: false);
    pt = Provider.of<QuizProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Quiz"),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: pf!.getData(),
          builder: (context, snapshot) {
            if(snapshot.hasError)
              {
                return Center(child: Text("Lose Conection"));
              }
            else if(snapshot.hasData)
              {
                return Column(
                  children: [
                    SizedBox(height: 10.h,),
                    Container(
                      height: 10.h,
                      width: 90.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue[100],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${pt!.data!.results![pt!.i].question}'),
                      ),
                    ),
                    SizedBox(height: 2.h,),
                    MyContain('${pt!.data!.results![pt!.i].correctAnswer}'),
                    MyContain('${pt!.data!.results![pt!.i].incorrectAnswers![0]}'),
                    MyContain('${pt!.data!.results![pt!.i].incorrectAnswers![1]}'),
                    MyContain('${pt!.data!.results![pt!.i].incorrectAnswers![2]}'),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: () {
                          pf!.back();
                        }, child: Text("Back"),style: ElevatedButton.styleFrom(backgroundColor: Colors.red),),
                        SizedBox(width: 10.w),
                        ElevatedButton(onPressed: () {
                          pf!.totle();
                          pf!.next();
                        }, child: Text("Next"),style: ElevatedButton.styleFrom(backgroundColor: Colors.green),)
                      ],
                    ),
                    Visibility(
                      visible: pt!.i>=9?true:false,
                      child: ElevatedButton(onPressed: () {
                        Navigator.pushReplacementNamed(context, 'view',arguments: pt!.count);
                      }, child: Text("Finish")),
                    )
                  ],
                );
              }
            return Center(child:  CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }

  Widget MyContain(String? option)
  {
    return InkWell(
      onTap: () {
        pt!.useransList.add('$option');
        print(option);
      },
      child: Container(
        height: 7.h,
        width: 80.w,
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue
        ),
        child: Text("$option",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
      ),
    );
  }

}
