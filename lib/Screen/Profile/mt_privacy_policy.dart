import 'package:flutter/material.dart';

import '../Constant Data/constant.dart';
class MtPrivacyPolicy extends StatefulWidget {
  const MtPrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<MtPrivacyPolicy> createState() => _MtPrivacyPolicyState();
}

class _MtPrivacyPolicyState extends State<MtPrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
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
          'Privacy Policy',
          style: kTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            Text(
              'Privacy Policy | Zilli',
              style: kTextStyle.copyWith(
                  color: kTitleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Date Updated” (7 Jun 2021)',
              style: kTextStyle.copyWith(color: kGreyTextColor),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adip is ci ng elit. Neque nulla sed mauris feugiat eget. Augu e id neque nisl nibh ut facilisis massa,',
              style: kTextStyle.copyWith(color: kGreyTextColor),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Ullamcorper eros senectus urna sit elementum ali quet. Nibh mauris tristique elit pellentesque sa pien malesuada eleifend iaculis malesuada. Mau ris, ut id hendrerit habitant gravida urna congue arcu sit. At quisque leo semper urna gravida',
              style: kTextStyle.copyWith(color: kGreyTextColor),
            ),
            const SizedBox(height: 10.0),
            Text(
              ' iaculis nibh aliquam. Morbi tempor facilisi ultricies magna vitae sit. Velit augue sagittis, tempor, amet arcu nullam quam. Sit feugiat amet, pellentesque morbi mattis id blandit arcu morbi. Morbi cursus ac tortor amet. Iaculis nunc bibendum in vitae turpis mattis nisl viverra. Turpis habitant purus, venenatis vitae ut urna, rhoncus nunc. Aliquam turpis pellentesque arcu malesuada ut et lorem. Donec tincidunt tristique ultricies sed faucibus. Morbi et eu mi, nec, suscipit. Duis pellentesque facilisi pharetra enim neque sagittis.',
              style: kTextStyle.copyWith(color: kGreyTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
