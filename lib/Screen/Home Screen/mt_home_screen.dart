// ignore_for_file: unused_result

import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart'as http;
import 'package:url_launcher/url_launcher.dart';

import 'package:zilli/Model/user_profile_model.dart';
import 'package:zilli/Provider/profile_provider.dart';
import 'package:zilli/Repositories/authentication_repo.dart';
import 'package:zilli/Screen/Constant%20Data/constant.dart';
import 'package:zilli/Screen/Home%20Screen/Features%20Screen/mt_quiz.dart';
import 'package:zilli/Screen/Home%20Screen/Features%20Screen/mt_videos.dart';
import 'package:zilli/Screen/Home%20Screen/home.dart';
import 'package:zilli/Screen/Home%20Screen/no_internet_screen.dart';
import 'package:zilli/Screen/Profile/mt_profile.dart';
import 'package:zilli/Videos/Admob/admob.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:share_plus/share_plus.dart';

import '../Constant Data/config.dart';
import '../Offer Toro/offertoro_offerwall.dart';
import 'Features Screen/mt_refer.dart';
import 'Features Screen/mt_wheel.dart';
import 'Features Screen/redeem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Admob admob = Admob();
  void showRewardPopUp(String amount) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: SizedBox(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            image: const DecorationImage(
                              image: AssetImage('images/rewardbanner.png'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20.0),
                              Text(
                                'Congratulations',
                                style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                '$amount Points received',
                                style: kTextStyle.copyWith(color: Colors.white),
                                maxLines: 2,
                              ),
                              const SizedBox(height: 20.0),
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(begin: Alignment.topCenter, colors: [
                                    Color(0xFFFFBF53),
                                    Color(0xFFFF8244),
                                  ]),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                  child: Text(
                                    'Ok',
                                    style: kTextStyle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ).onTap(() => {
                                    finish(context),
                                    const Home().launch(context),
                                  })
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void showRewardsPopUp() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        height: 150,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: const DecorationImage(
                            image: AssetImage('images/banner3.png'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10.0),
                            Text(
                              'Daily Reward!',
                              style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              'Already rewarded\ncome back later',
                              style: kTextStyle.copyWith(color: Colors.white, fontSize: 18.0),
                              maxLines: 2,
                            ),
                            const SizedBox(height: 10.0),
                            Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(begin: Alignment.topCenter, colors: [
                                  Color(0xFFFFBF53),
                                  Color(0xFFFF8244),
                                ]),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                                child: Text(
                                  'Ok',
                                  style: kTextStyle.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ).onTap(() => {
                                  finish(context),
                                  const Home().launch(context),
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  // void showPopUp() {
  //   showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Stack(
  //           alignment: Alignment.topCenter,
  //           children: [
  //             Dialog(
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(20.0),
  //               ),
  //               child: SizedBox(
  //                 height: 330.0,
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(10.0),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       const SizedBox(height: 60.0),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                         children: [
  //                           Column(
  //                             children: [
  //                               Stack(
  //                                 alignment: Alignment.center,
  //                                 children: [
  //                                   const Icon(
  //                                     FontAwesomeIcons.solidStar,
  //                                     size: 45.0,
  //                                     color: kMainColor,
  //                                   ),
  //                                   Text(
  //                                     '+10',
  //                                     style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
  //                                   )
  //                                 ],
  //                               ),
  //                               Text(
  //                                 'Monday',
  //                                 style: kTextStyle.copyWith(color: kGreyTextColor),
  //                               ),
  //                             ],
  //                           ).onTap(() => showRewardsPopUp()),
  //                           Column(
  //                             children: [
  //                               Stack(
  //                                 alignment: Alignment.center,
  //                                 children: [
  //                                   const Icon(
  //                                     FontAwesomeIcons.solidStar,
  //                                     size: 45.0,
  //                                     color: kMainColor,
  //                                   ),
  //                                   Text(
  //                                     '+10',
  //                                     style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
  //                                   )
  //                                 ],
  //                               ),
  //                               Text(
  //                                 'Tuesday',
  //                                 style: kTextStyle.copyWith(color: kGreyTextColor),
  //                               ),
  //                             ],
  //                           ).onTap(() => showRewardsPopUp()),
  //                           Column(
  //                             children: [
  //                               Stack(
  //                                 alignment: Alignment.center,
  //                                 children: [
  //                                   const Icon(
  //                                     FontAwesomeIcons.solidStar,
  //                                     size: 45.0,
  //                                     color: kMainColor,
  //                                   ),
  //                                   Text(
  //                                     '+10',
  //                                     style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
  //                                   )
  //                                 ],
  //                               ),
  //                               Text(
  //                                 'Wednes',
  //                                 style: kTextStyle.copyWith(color: kGreyTextColor),
  //                               ),
  //                             ],
  //                           ).onTap(() => showRewardsPopUp()),
  //                         ],
  //                       ),
  //                       const SizedBox(height: 20.0),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                         children: [
  //                           Column(
  //                             children: [
  //                               Stack(
  //                                 alignment: Alignment.center,
  //                                 children: [
  //                                   const Icon(
  //                                     FontAwesomeIcons.solidStar,
  //                                     size: 45.0,
  //                                     color: kMainColor,
  //                                   ),
  //                                   Text(
  //                                     '+10',
  //                                     style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
  //                                   )
  //                                 ],
  //                               ),
  //                               Text(
  //                                 'Thursday',
  //                                 style: kTextStyle.copyWith(color: kGreyTextColor),
  //                               ),
  //                             ],
  //                           ).onTap(() => showRewardsPopUp()),
  //                           Column(
  //                             children: [
  //                               Stack(
  //                                 alignment: Alignment.center,
  //                                 children: [
  //                                   const Icon(
  //                                     FontAwesomeIcons.solidStar,
  //                                     size: 45.0,
  //                                     color: kMainColor,
  //                                   ),
  //                                   Text(
  //                                     '+10',
  //                                     style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
  //                                   )
  //                                 ],
  //                               ),
  //                               Text(
  //                                 'Friday',
  //                                 style: kTextStyle.copyWith(color: kGreyTextColor),
  //                               ),
  //                             ],
  //                           ).onTap(() => showRewardsPopUp()),
  //                           Column(
  //                             children: [
  //                               Stack(
  //                                 alignment: Alignment.center,
  //                                 children: [
  //                                   const Icon(
  //                                     FontAwesomeIcons.solidStar,
  //                                     size: 45.0,
  //                                     color: kMainColor,
  //                                   ),
  //                                   Text(
  //                                     '+10',
  //                                     style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
  //                                   )
  //                                 ],
  //                               ),
  //                               Text(
  //                                 'Saturday',
  //                                 style: kTextStyle.copyWith(color: kGreyTextColor),
  //                               ),
  //                             ],
  //                           ).onTap(() => showRewardsPopUp()),
  //                         ],
  //                       ),
  //                       const SizedBox(height: 20.0),
  //                       Center(
  //                         child: Column(
  //                           children: [
  //                             Stack(
  //                               alignment: Alignment.center,
  //                               children: [
  //                                 const Icon(
  //                                   FontAwesomeIcons.solidStar,
  //                                   size: 45.0,
  //                                   color: kMainColor,
  //                                 ),
  //                                 Text(
  //                                   '+10',
  //                                   style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
  //                                 )
  //                               ],
  //                             ),
  //                             Text(
  //                               'Sunday',
  //                               style: kTextStyle.copyWith(color: kGreyTextColor),
  //                             ),
  //                           ],
  //                         ),
  //                       ).onTap(() => showRewardsPopUp()),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             const Padding(
  //               padding: EdgeInsets.only(top: 87),
  //               child: Image(
  //                 image: AssetImage('images/star.png'),
  //               ),
  //             ),
  //           ],
  //         );
  //       });
  // }

  List<String> bannerList = [
    'images/banner1.png',
    'images/banner2.png',
  ];
  List<String> featureList = [
    'images/offer.png',
    'images/videos.png',
    'images/wheel.png',
    'images/refer.png',
  ];
  List<String> featureList2 = [
    'images/redeem.png',
    'images/quiz.png',
    'images/tutorial.png',
    'images/share.png',
  ];
  bool isBalanceShow = false;

  Future<void> checkInternet() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (!result && mounted) {
      NoInternetScreen(screenName: widget).launch(context);
    }
  }

  @override
  void initState() {
    checkInternet();
    banner();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, watch) {
      AsyncValue<UserProfileModel> profile = ref.watch(personalProfileProvider);
      return profile.when(data: (info) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0.0,
            automaticallyImplyLeading: false,
            backgroundColor: kMainColor,
            elevation: 0.0,
            title: ListTile(
              leading: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), border: Border.all(color: Colors.white)),
                child: CircleAvatar(
                  radius: 18.0,
                  backgroundImage: NetworkImage(info.data?.user?.image == Config.siteUrl
                      ? 'https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/female/68.png'
                      : info.data?.user?.image ?? 'https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/female/68.png'),
                ),
              ).onTap(
                () => const Profile().launch(context),
              ),
              title: Text(
                info.data?.user?.name ?? '',
                style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(15.0),
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
          body: RefreshIndicator(
            onRefresh: () async {
              ref.refresh(personalProfileProvider);
              ref.refresh(withdrawHistoryProvider);
              ref.refresh(userHistoryProvider);
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height:100,
                      width: MediaQuery.of(context).size.width,
                      child: CarouselSlider(
                        items: state_data.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return InkWell(
                                onTap: () async{
                                  final Uri _url = Uri.parse(i['url'].toString());
                                    if (!await launchUrl(_url)) {
                                      throw Exception('Could not launch $_url');
                                  }
                                },
                                child: Container(
                                  height:MediaQuery.of(context).size.height*1,
                                  width: MediaQuery.of(context).size.width*0.99,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            15.0),
                                      ),
                                      elevation: 5,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            15.0),
                                        child: Image.network("https://cashrockets.apponrent.co.in/public/uploads/"+i['image'].toString(), fit: BoxFit.fill,
                                          height:MediaQuery.of(context).size.height*1,),
                                      )
                                  ),
                                ),

                              );
                            },
                          );
                          // $i'
                        }).toList(),
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height*1,
                          aspectRatio: 12/9,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          // onPageChanged: callbackFunction,
                          scrollDirection: Axis.horizontal,
                        ),
                      )
                  ),
                  // Container(
                  //   width: context.width(),
                  //   decoration: const BoxDecoration(
                  //     color: kMainColor,
                  //     borderRadius: BorderRadius.only(
                  //       bottomLeft: Radius.circular(30.0),
                  //       bottomRight: Radius.circular(30.0),
                  //     ),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Container(
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(30.0),
                  //             border: Border.all(
                  //               color: Colors.white.withOpacity(0.3),
                  //             ),
                  //             color: Colors.white.withOpacity(0.5),
                  //           ),
                  //           child: ListTile(
                  //             contentPadding: const EdgeInsets.only(left: 4.0),
                  //             leading: const CircleAvatar(
                  //               backgroundColor: Colors.transparent,
                  //               radius: 25,
                  //               backgroundImage: AssetImage('images/meter.png'),
                  //             ),
                  //             title: Center(
                  //               child: Text(
                  //                 'Collect Daily Reward Now!',
                  //                 style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  //               ),
                  //             ),
                  //             trailing: Container(
                  //                 padding: const EdgeInsets.all(15.0),
                  //                 decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                  //                 child: Text(
                  //                   '20+',
                  //                   style: kTextStyle.copyWith(color: kMainColor, fontWeight: FontWeight.bold),
                  //                 )),
                  //           ),
                  //         ).onTap(
                  //           () async {
                  //             try {
                  //               EasyLoading.show(status: 'Getting Today\'s Reward');
                  //               var status = await AuthRepo().dailyRewards();
                  //               if (status) {
                  //                 showRewardPopUp('100');
                  //                 EasyLoading.showSuccess('Reward Added');
                  //                 admob.showInterstitialAd();
                  //                 ref.refresh(personalProfileProvider);
                  //               } else {
                  //                 EasyLoading.showError('Already Rewarded. Try Again Later');
                  //                 showRewardsPopUp();
                  //               }
                  //             } catch (e) {
                  //               showRewardsPopUp();
                  //               EasyLoading.showError(e.toString().replaceRange(0, 10, ''));
                  //             }
                  //           },
                  //         ),
                  //         const SizedBox(height: 10.0),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  HorizontalList(
                    itemCount: bannerList.length,
                    itemBuilder: (_, i) {
                      return Container(
                        height: 150,
                        width: 305,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              bannerList[i],
                            ),
                          ),
                        ),
                      ).onTap(() {
                        if (i == 0) {
                          const Redeem().launch(context);
                        } else {
                          Share.share(
                              'I have earned \₹100 in a day. Use my refer code to earn \₹10 on signup. My Refer Code is ${info.data?.user?.referCode ?? ''}');
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'All Features',
                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Image(
                                  image: AssetImage('images/offer.png'),
                                ),
                                const SizedBox(height: 4.0),
                                Center(
                                    child: Text(
                                  'Offers',
                                  style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                )),
                              ],
                            ).onTap(
                              () => const OffertoroOfferwall().launch(context),
                            ),
                            Column(
                              children: [
                                const Image(
                                  image: AssetImage('images/videos.png'),
                                ),
                                const SizedBox(height: 4.0),
                                Center(
                                    child: Text(
                                  'Task',
                                  style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                )),
                              ],
                            ).onTap(
                              () => const Videos().launch(context),
                            ),
                            Column(
                              children: [
                                const Image(
                                  image: AssetImage('images/wheel.png'),
                                ),
                                const SizedBox(height: 4.0),
                                Center(
                                    child: Text(
                                  'Wheel',
                                  style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                )),
                              ],
                            ).onTap(
                              () => const Wheel().launch(context),
                            ),
                            Column(
                              children: [
                                const Image(
                                  image: AssetImage('images/refer.png'),
                                ),
                                const SizedBox(height: 4.0),
                                Center(
                                    child: Text(
                                  'Refer',
                                  style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                )),
                              ],
                            ).onTap(
                              () => const Refer().launch(context),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                const Image(
                                  image: AssetImage('images/reedem.png'),
                                ),
                                const SizedBox(height: 4.0),
                                Center(
                                    child: Text(
                                  'Redeem',
                                  style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                )),
                              ],
                            ).onTap(
                              () => const Redeem().launch(context),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            // Column(
                            //   children: [
                            //     const Image(
                            //       image: AssetImage('images/quiz.png'),
                            //     ),
                            //     const SizedBox(height: 4.0),
                            //     Center(
                            //         child: Text(
                            //       'Quiz',
                            //       style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                            //     )),
                            //   ],
                            // ).onTap(
                            //   () => const MtQuiz().launch(context),
                            // ),
                            Column(
                              children: [
                                const Image(
                                  image: AssetImage('images/tutorial.png'),
                                ),
                                const SizedBox(height: 4.0),
                                Center(
                                    child: Text(
                                  'Tutorial',
                                  style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                )),
                              ],
                            ),
                            // Column(
                            //   children: [
                            //     const Image(
                            //       image: AssetImage('images/share.png'),
                            //     ),
                            //     const SizedBox(height: 4.0),
                            //     Center(
                            //       child: Text(
                            //         'Share',
                            //         style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                            //       ),
                            //     )
                            //   ],
                            // ).onTap(() => Share.share(
                            //     'I have earned \$100 in a day. Use my refer code to earn \$10 on signup. My Refer Code is ${info.data?.user?.referCode ?? ''}')
                            // )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
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
  List state_data = [];
  Future<String> banner() async {
    print("vvvvv");
    final res = await http.get(
        Uri.parse("https://cashrockets.apponrent.co.in/api/v1/get_banner")
    );
    final resBody = json.decode(res.body);
    print("hhhhhhhhhhhhh");
    print(resBody);
    setState(() {
      state_data = resBody;
    });
    return "Sucess";
  }
}
