import 'package:zilli/Model/offertoro_model.dart';
import 'package:zilli/Provider/offertoro_provider.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Constant Data/button_global.dart';
import '../Constant Data/constant.dart';


class OffertoroOfferDetails extends StatefulWidget {
  const OffertoroOfferDetails({Key? key, required this.offertoroModel, required this.userId})
      : super(key: key);
  final Offers offertoroModel;
  final String userId;

  @override
  State<OffertoroOfferDetails> createState() => _OffertoroOfferDetailsState();
}

class _OffertoroOfferDetailsState extends State<OffertoroOfferDetails> {
  List<String> categoryList = [
    'Top Offer!',
    'Free',
    'Hard',
  ];


  List<String> numberList = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
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
          title: ListTile(
            minLeadingWidth: 0,
            leading: Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.offertoroModel.imageUrl.toString(),
                    ),
                  )),
            ),
            title: Text(
              widget.offertoroModel.offerName.toString(),
              style: kTextStyle.copyWith(color: Colors.white),
            ),
            subtitle: Text(
              widget.offertoroModel.callToAction.toString(),
              style: kTextStyle.copyWith(color: Colors.white),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: const Icon(Icons.close, color: Colors.white).onTap(
                () =>  Navigator.pop(context)
              ),
            )
          ]),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          AsyncValue<OffertoroModel> offertoroOfferDetails =
              ref.watch(offertoroProvider);
          return offertoroOfferDetails.when(data: (offertoroOfferDetails) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10.0),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        image: DecorationImage(
                          image: NetworkImage(
                            widget.offertoroModel.imageUrl.toString(),
                          ),
                        ),
                      ),
                    ),
                    HorizontalList(
                      spacing: 10,
                      itemCount: widget.offertoroModel.verticals!.length,
                      itemBuilder: (_, i) {
                        return Container(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: const Color(0xFFFFABA5),
                          ),
                          child: Text(
                            widget.offertoroModel.verticals![i].verticalName.toString(),
                          ),
                        );
                      },
                    ),
                    Text(
                      'Instructions',
                      style: kTextStyle.copyWith(
                          color: kTitleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      widget.offertoroModel.offerDesc.toString(),
                      style: kTextStyle.copyWith(color: kGreyTextColor),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kGreyTextColor.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(4.0),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kMainColor,
                                    ),
                                    child: const Icon(
                                      FeatherIcons.dollarSign,
                                      color: Colors.white,
                                      size: 16.0,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    'BDT  ${widget.offertoroModel.amount.toString()}',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Total Rewards',
                                    style: kTextStyle.copyWith(
                                        color: kGreyTextColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 80.0,
                            width: 1.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.0),
                              color: kGreyTextColor,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FeatherIcons.calendar,
                                    color: Color(0xFF8555EA),
                                    size: 24.0,
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    widget.offertoroModel.disclaimer
                                        .toString()
                                        .toString(),
                                    style: kTextStyle.copyWith(
                                      color: kTitleColor,

                                    ),
                                    maxLines: 3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ButtonGlobal(
                        buttontext:
                            'Earn BDT  ${widget.offertoroModel.amount.toString()}',
                        buttonDecoration: kButtonDecoration,
                        onPressed: () async{
                          await launchUrl(Uri.parse(widget.offertoroModel.offerUrlEasy!.replaceAll('[USER_ID]', widget.userId)),mode: LaunchMode.externalApplication);
                        })
                  ],
                ),
              ),
            );
          }, error: (e, stack) {

            return Text(
              e.toString(),
              style: kTextStyle.copyWith(color: kTitleColor),
            );
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
        },
      ),
    );
  }
}
