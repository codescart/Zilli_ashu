import 'package:zilli/Screen/Authentication/log_in.dart';
import 'package:zilli/Screen/Constant%20Data/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: const AssetImage('images/bg.png'),
              width: context.width(),
              height: context.height(),
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              height: context.height() / 1.6,
              width: context.width() / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/cash.png'),
                      ),
                    ),
                  ),
                  Text(
                    'Zilli Cash',
                    style: kTextStyle.copyWith(
                        color: kTitleColor, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'Let’s Get Startes',
                    style: kTextStyle.copyWith(
                        color: kTitleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Luctus mauris pharetra sit elit integer consec tetur etiam quis auctor.',
                    style: kTextStyle.copyWith(color: kGreyTextColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30.0),
                  Card(
                    color: const Color(0xFF1877F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: ListTile(
                      onTap: (() => const LogIn().launch(context)),
                      leading: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white),
                        child: const Icon(
                          FontAwesomeIcons.facebookF,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text(
                        'Continue with Facebook',
                        style: kTextStyle.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: kGreyTextColor.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: ListTile(
                      onTap: (() => const LogIn().launch(context)),
                      leading: const Image(
                        image: AssetImage('images/google.png'),
                      ),
                      title: Text(
                        'Continue with Google',
                        style: kTextStyle.copyWith(color: kTitleColor),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: kGreyTextColor.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: ListTile(
                      onTap: (() => const LogIn().launch(context)),
                      title: Center(
                        child: Text(
                          'Sign up with Email',
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  RichText(
                    text: TextSpan(
                      text: 'Already have an account?',
                      style: kTextStyle.copyWith(color: kGreyTextColor),
                      children: [
                        TextSpan(
                          text: ' Login',
                          style: kTextStyle.copyWith(color: kMainColor),
                        ),
                      ],
                    ),
                  ).onTap(
                    () => const LogIn().launch(context),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
