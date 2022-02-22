import 'package:flutix/shared/theme.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 130,
            height: 136,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Text(
            'New Experience',
            style: largeText.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Watch a new movie much\neasier than any before',
            style: greyMediumText,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 70,
          ),
          Container(
            width: 250,
            height: 45,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: purpleColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Text(
                  'Get started',
                  style: mediumText.copyWith(
                    color: Colors.white,
                  ),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: greySmallText,
              ),
              Text(
                'Sign In',
                style: smallText.copyWith(color: purpleColor),
              )
            ],
          )
        ],
      )),
    );
  }
}
