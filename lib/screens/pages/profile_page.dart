import '../../config/theme.dart';
import '../../widgets/button_text.dart';
import 'package:flutix/screens/widgets/dash_separator.dart';
import 'package:flutix/widgets/header_title.dart';
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
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/nophoto.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Anggit Pangestu Putra',
              style: AppTextStyle.mediumText.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'anggitpp23@gmail.com',
              style: AppTextStyle.greyMediumText,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: phoneWidth - 2 * AppSizes.defaultMargin,
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Get.toNamed('/editProfile'),
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/icons/profile.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Edit Profile',
                          style: AppTextStyle.mediumText,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DashSeparator(
                    height: 1,
                    color: AppColors.lightGreyColor,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () => Get.toNamed('/mywallet'),
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/icons/wallet.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'My Wallet',
                          style: AppTextStyle.mediumText,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DashSeparator(
                    height: 1,
                    color: AppColors.lightGreyColor,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  ButtonText(
                    color: AppColors.purpleColor,
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
