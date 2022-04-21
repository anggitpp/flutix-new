import 'package:flutix/widgets/header_title.dart';

import '../../config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

import '../../models/user.dart';

class ConfirmAccountPage extends StatelessWidget {
  const ConfirmAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    User user = arguments['user'];
    String password = arguments['password'];
    print(user);
    print(password);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          HeaderTitle(
            backFunction: () => Navigator.pop(context),
            title: 'Confirm\nNew Account',
          ),
          const SizedBox(
            height: 90,
          ),
          user.image.path.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    user.image,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/nophoto.png'),
                    ),
                  ),
                ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Welcome',
            style: AppTextStyle.mediumText,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            user.name,
            style: AppTextStyle.largeText.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 110,
          ),
          SizedBox(
            width: 250,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: '3E9D9D'.toColor(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => Get.toNamed('/home'),
              child: Text(
                'Create My Account',
                style: AppTextStyle.mediumText.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
