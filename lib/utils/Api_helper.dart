import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:re_mid_exam_flutter/Screen/Model/quiz.dart';

class ApiHelper
{
  static ApiHelper apiHelper =  ApiHelper();

  Future<QuizModel> ApiData()
  async {
    String? link = 'https://opentdb.com/api.php?amount=10&category=27&difficulty=medium&type=multiple';

    var res = await http.get(Uri.parse(link));

    var json = jsonDecode(res.body);

    QuizModel quizModel = QuizModel.fromJson(json);

    return quizModel;

  }
}