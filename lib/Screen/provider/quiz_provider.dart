import 'dart:math';

import 'package:flutter/material.dart';
import 'package:re_mid_exam_flutter/Screen/Model/quiz.dart';
import 'package:re_mid_exam_flutter/utils/Api_helper.dart';

class QuizProvider extends ChangeNotifier
{
  QuizModel? data;

  List l1 = [];
  List useransList = [];

   Future<QuizModel> getData()
   async {
     data = await ApiHelper.apiHelper.ApiData();
     return data!;
   }

   void setData()
   {
    l1.add(data!.results![i].incorrectAnswers);
     print(l1);
     Random r =Random();
     var option = l1[r.nextInt(l1.length)];
   }

   int i=0;
   int count=0;

   void totle()
   {
     if(useransList[i]==data!.results![i].correctAnswer)
     {
       count++;
     }
   }
   void next()
   {
     if(i<9)
       {

         i++;
         notifyListeners();
       }
   }
  void back()
  {
   if(i>0)
     {
       i--;
       notifyListeners();
     }
  }
}