
import 'package:zilli/Model/og_ads_model.dart';
import 'package:zilli/Repositories/og_ads_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

OgAdsRepo _ogAdsRepo = OgAdsRepo();

final ogAdsProvider = FutureProvider<OgAdsModel>((ref) async {
  return _ogAdsRepo.getOgAds();
});