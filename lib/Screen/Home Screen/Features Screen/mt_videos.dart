import 'package:applovin_max/applovin_max.dart';
import 'package:zilli/Screen/Constant%20Data/constant.dart';
import 'package:zilli/Videos/Admob/admob.dart';
import 'package:zilli/Videos/AppLovin/applovin.dart';
import 'package:zilli/Videos/StartApp/startapp.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:startapp_sdk/startapp.dart';

import '../../../Model/user_profile_model.dart';
import '../../../Provider/profile_provider.dart';
import '../../../Videos/Audience Network/audience_network.dart';
import '../no_internet_screen.dart';

class Videos extends StatefulWidget {
  const Videos({Key? key}) : super(key: key);

  @override
  State<Videos> createState() => _VideosState();
}

enum AdLoadState { notLoaded, loading, loaded }

class _VideosState extends State<Videos> {
  List<String> imageList = [
    'images/bg1.png',
    'images/bg2.png',
    'images/bg3.png',
    'images/bg4.png',
    'images/bg1.png',
    'images/bg2.png',
    'images/bg3.png',
    'images/bg4.png',
    'images/bg4.png',
    'images/bg1.png'
  ];

  List<String> logoList = [
    // 'images/app.png',
    // 'images/sa.png',
    'images/am.png',
    'images/am.png',
    'images/am.png',
    'images/am.png',
    'images/am.png',
    'images/am.png',
    'images/am.png',
    'images/am.png',
    'images/am.png',
    'images/am.png',
    // 'images/an.png',
  ];

  List<String> titleList = [
    'Task 1',
    'Task 2',
    'Task 3',
    'Task 4',
    'Task 5',
    'Task 6',
    'Task 7',
    'Task 8',
    'Task 9',
    'Task 10',
    // 'AppLovin',
    // 'StartApp',
    // 'AdMob',
    // 'Audience Network',
  ];
  List<String> subtitleList = [
    'Watch views and get Points',
    'Watch views and get Points',
    'Watch views and get Points',
    'Watch views and get Points',
    'Watch views and get Points',
    'Watch views and get Points',
    'Watch views and get Points',
    'Watch views and get Points',
    'Watch views and get Points',
    'Watch views and get Points',
  ];

  bool isBalanceShow = false;
  var startAppSdk = StartAppSdk();
  Admob admob = Admob();
  FacebookRewardVideoAd facebookRewardVideoAd = FacebookRewardVideoAd();
  StartApp startApp = StartApp();
  AppLovin appLovin = AppLovin();

  void initialization() async{
    await AppLovinMAX.initialize(sdkKey);
    FacebookAudienceNetwork.init(
      testingId: "a77955ee-3304-4635-be65-81029b0f5201",
      iOSAdvertiserTrackingEnabled: true,
    );
  }

  Future<void> checkInternet() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (!result && mounted) {
      NoInternetScreen(screenName: widget).launch(context);
    }
  }

  @override
  void initState() {
    checkInternet();
    initialization();
    facebookRewardVideoAd.loadRewardedVideoAd();
    admob.createRewardedAd();
    startApp.loadRewardedVideoAd();
    appLovin.loadAds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_,ref,watch){
      AsyncValue<UserProfileModel> profile = ref.watch(personalProfileProvider);
      return profile.when(data: (info) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            toolbarHeight: 90,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
            ),
            backgroundColor: kMainColor,
            elevation: 0.0,
            title: Text(
              'Task',
              style: kTextStyle.copyWith(color: Colors.white),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white.withOpacity(0.3),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedOpacity(
                        opacity: !isBalanceShow ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 1000),
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: kMainColor,
                            border: Border.all(color: Colors.white, width: 2.0),
                          ),
                          child: const Icon(
                            Icons.currency_rupee,
                            size: 15.0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      Text(isBalanceShow ? '${info.data?.user?.wallet?.balance ?? ''}' : 'Balance'),
                      const SizedBox(width: 5.0),
                      AnimatedOpacity(
                        opacity: isBalanceShow ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 1000),
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: kMainColor,
                            border: Border.all(color: Colors.white, width: 2.0),
                          ),
                          child: const Icon(
                            Icons.currency_rupee,
                            size: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ).onTap(() {
                  setState(() {
                    isBalanceShow = !isBalanceShow;
                  });
                }),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.count(
                    crossAxisCount: 1,
                    crossAxisSpacing: 0.0,
                    childAspectRatio: 2.0,
                    mainAxisSpacing: 0.0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      titleList.length,
                          (i) {
                        return Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: AssetImage(
                                      imageList[i],
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 20.0,
                                    backgroundImage: AssetImage(
                                      logoList[i],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    titleList[i],
                                    style: kTextStyle.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    subtitleList[i],
                                    style: kTextStyle.copyWith(
                                        color: Colors.white, fontSize: 12.0),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ).onTap(() {
                          switch (i) {
                            case 0:
                              // appLovin.showAds();
                              admob.showRewardedAd();
                              break;
                            case 1:
                              // startApp.showAds();
                              admob.showRewardedAd();
                              break;
                            case 2:
                              admob.showRewardedAd();
                              break;
                            case 3:
                              // facebookRewardVideoAd.showRewardedAd();
                              admob.showRewardedAd();
                              break;
                            case 4:
                            // facebookRewardVideoAd.showRewardedAd();
                              admob.showRewardedAd();
                              break;
                            case 5:
                            // facebookRewardVideoAd.showRewardedAd();
                              admob.showRewardedAd();
                              break;
                            case 6:
                            // facebookRewardVideoAd.showRewardedAd();
                              admob.showRewardedAd();
                              break;
                            case 7:
                            // facebookRewardVideoAd.showRewardedAd();
                              admob.showRewardedAd();
                              break;
                            case 8:
                            // facebookRewardVideoAd.showRewardedAd();
                              admob.showRewardedAd();
                              break;
                            case 9:
                            // facebookRewardVideoAd.showRewardedAd();
                              admob.showRewardedAd();
                              break;
                            default:
                              admob.showRewardedAd();
                          }
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }, error: (e, stack) {
        return Center(
          child: Text(e.toString()),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
    });
  }
}