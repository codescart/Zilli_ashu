import 'dart:io';

import 'package:zilli/Provider/database_provider.dart';
import 'package:zilli/Repositories/rewards_repo.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Screen/Constant Data/ad_helper.dart';
import '../../Screen/Constant Data/constant.dart';

class Admob {
  int? reward;
  RewardedAd? _rewardedAd;
  int _numRewardedLoadAttempts = 0;
  static const AdRequest request = AdRequest(
    nonPersonalizedAds: true,
  );


  //Video ads
  void createRewardedAd() async{
    String rewardedId = Platform.isAndroid ?await DataBase().retrieveString('admobRewardedAndroid') ?? AdHelper.rewardedAdUnitId : await DataBase().retrieveString('admobRewardedAdIos') ?? AdHelper.rewardedAdUnitId;


    RewardedAd.load(
        adUnitId: rewardedId,
        request: request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            _rewardedAd = ad;
            _numRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            _rewardedAd = null;
            _numRewardedLoadAttempts += 1;
            if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
              createRewardedAd();
            }
          },
        ));
  }
  void showRewardedAd() {
    if (_rewardedAd == null) {
      toast('Please wait till loaded');
      createRewardedAd();
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) {
        toast('Showing ads');
      },
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        toast('Dismissed');
        ad.dispose();
        createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        ad.dispose();
        createRewardedAd();
      },
    );
    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) async{
          try{
            EasyLoading.show(status: 'Getting rewards');
            var response = await RewardRepo().addPoint('10', 'Admob Video Ads');
            if(response){
              EasyLoading.showSuccess('You Have Earned 10 Coins');
            }else{
              EasyLoading.showError('Error Happened. Try Again');
            }
          }catch(e){
            EasyLoading.showError(e.toString());
          }

        });
    _rewardedAd = null;
  }

  //Interstitial Ads
  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  void createInterstitialAd() async{
    String interstitialAdUnitId = Platform.isAndroid ?await DataBase().retrieveString('admobInterstitialAndroid') ?? AdHelper.interstitialAdUnitId : await DataBase().retrieveString('admobInterstitialIos') ?? AdHelper.interstitialAdUnitId;

    InterstitialAd.load(
        adUnitId: interstitialAdUnitId,
        request: request,
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
              createInterstitialAd();
            }
          },
        ));
  }
  void showInterstitialAd() {
    if (_interstitialAd == null) {
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {

      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
        createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }
}