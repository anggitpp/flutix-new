import 'package:flutix/screens/widgets/button_text.dart';
import 'package:flutix/screens/widgets/dash_separator.dart';
import 'package:flutix/screens/widgets/header_title.dart';
import 'package:flutix/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderTitle(
              backFunction: Get.back,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/nophoto.png'),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Anggit Pangestu Putra',
              style: mediumText.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'anggitpp23@gmail.com',
              style: greyMediumText,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: phoneWidth - 2 * defaultMargin,
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Get.toNamed('/editProfile'),
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/icons/profile.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Edit Profile',
                          style: mediumText,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DashSeparator(
                    height: 1,
                    color: lightGreyColor,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () => Get.toNamed('/mywallet'),
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/icons/wallet.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'My Wallet',
                          style: mediumText,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DashSeparator(
                    height: 1,
                    color: lightGreyColor,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  ButtonText(
                    color: purpleColor,
                    text: 'Logout',
                    function: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
