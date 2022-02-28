import 'package:flutix/controllers/registration_page_controller.dart';
import 'package:flutix/screens/widgets/header_title.dart';
import 'package:flutix/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

class ConfirmAccountPage extends StatelessWidget {
  const ConfirmAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegistrationPageController>();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          HeaderTitle(
            backFunction: Get.back,
            title: 'Confirmn\nNew Account',
          ),
          const SizedBox(
            height: 90,
          ),
          controller.image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    controller.image!,
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
            style: mediumText,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            controller.nameController.text,
            style: largeText.copyWith(fontWeight: FontWeight.w600),
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
              onPressed: () {},
              child: Text(
                'Create My Account',
                style: mediumText.copyWith(
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
