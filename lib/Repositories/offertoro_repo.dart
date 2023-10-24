import 'dart:convert';

import 'package:zilli/Model/offertoro_model.dart';
import 'package:zilli/Screen/Constant%20Data/config.dart';
import 'package:http/http.dart' as http;

import '../Provider/database_provider.dart';

class OffertoroRepo {

  Future<OffertoroModel> getOfferToro() async {
    final String offertoroPubId = await DataBase().retrieveString('offertoroPublisherId') ?? Config
        .offertoroPubId;
    final String offertoroAppId = await DataBase().retrieveString('offertoroAppId') ?? Config
        .offertoroAppId;
    final String offertoroSecretKey = await DataBase().retrieveString('offertoroSecretKey') ?? Config
        .offertoroSecretKey;

    final response = await http.get(
        Uri.parse('${Config.offertoroUrl}?pubid=$offertoroPubId&appid=$offertoroAppId&secretkey=$offertoroSecretKey&country=${Config
            .offertoroCountry}&platform=${Config
            .offertoroPlatform}&format=${Config.offertoroFormat}')

    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return OffertoroModel.fromJson(data);
    } else {
      throw Exception('No Offer Found');
    }
  }
}