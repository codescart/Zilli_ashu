import 'dart:convert';

import 'package:zilli/Model/withdraw_currency_convert_model.dart';
import 'package:zilli/Model/withdraw_history_model.dart';
import 'package:zilli/Model/history/user_history_model.dart';
import 'package:zilli/Model/withdraw_method_model.dart';
import 'package:http/http.dart' as http;

import '../Provider/database_provider.dart';
import '../Screen/Constant Data/config.dart';

class WithdrawRepo {
  Future<WithdrawMethodModel> withdrawMethodInfo() async {
    Uri url = Uri.parse(Config.serverUrl + Config.withdrawMethodUrl);
    String? token = await DataBase().retrieveString('token');
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return WithdrawMethodModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Authorization Failed');
    }
  }

  Future<WithdrawCurrencyConvertModel> withdrawCurrencyInfo() async {
    Uri url = Uri.parse(Config.serverUrl + Config.withdrawCurrencyUrl);
    String? token = await DataBase().retrieveString('token');
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return WithdrawCurrencyConvertModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Authorization Failed');
    }
  }

  Future<WithdrawHistoryModel> withdrawHistoryInfo() async {
    Uri url = Uri.parse(Config.serverUrl + Config.withdrawHistoryUrl);
    String? token = await DataBase().retrieveString('token');
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return WithdrawHistoryModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Authorization Failed');
    }
  }

  Future<UserHistoryModel> userHistoryInfo() async {
    Uri url = Uri.parse(Config.serverUrl + Config.userHistoryUrl);
    String? token = await DataBase().retrieveString('token');
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      return UserHistoryModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Authorization Failed');
    }
  }

  Future<bool> withdrawRequestInfo(String methodId, String currencyId, String coinAMount, String account) async {
    Uri url = Uri.parse(Config.serverUrl + Config.withdrawRequestUrl);
    String? token = await DataBase().retrieveString('token');
    var response = await http.post(url,
        headers: {'Authorization': 'Bearer $token'},
        body: <String, String>{'method_id': methodId, 'currency_convert_id': currencyId, 'coins': coinAMount, 'account': account});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('An Error Happened. Please Try Again');
    }
  }
}
