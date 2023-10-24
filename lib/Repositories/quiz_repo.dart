import 'dart:convert';

import 'package:zilli/Model/Quiz_model.dart';
import 'package:http/http.dart' as http;

import '../Provider/database_provider.dart';
import '../Screen/Constant Data/config.dart';

class QuizRepo {
  Future<QuizModel> allQuizzes() async {
    String? token = await DataBase().retrieveString('token');
    Uri url = Uri.parse(Config.serverUrl + Config.allQuizUrl);
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return QuizModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Password Update Failed');
    }
  }
}