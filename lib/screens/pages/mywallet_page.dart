import 'package:flutix/screens/widgets/header_title.dart';
import 'package:flutix/screens/widgets/recent_transaction_widget.dart';
import 'package:flutix/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supercharged/supercharged.dart';

class MyWalletPage extends StatelessWidget {
  const MyWalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: () {},
          // elevation: 2,
          backgroundColor: yellowColor,
          child: Icon(
            Icons.download,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderTitle(
                  backFunction: Get.back,
                  title: 'My Wallet',
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: phoneWidth - 2 * defaultMargin,
                  height: 185,
                  decoration: BoxDecoration(
                    color: '382A74'.toColor(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 20),
                        child: Row(
                          children: [
                            Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: 'FFF2CB'.toColor(),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: yellowColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(904592934),
                          style: currencySmallText.copyWith(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, bottom: 20),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Card Holder',
                                  style: smallText.copyWith(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Angga Risky',
                                      style: smallText.copyWith(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Container(
                                      width: 14,
                                      height: 14,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/icons/checklist.png'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Card ID',
                                  style: smallText.copyWith(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'BWAFLUTIX',
                                      style: smallText.copyWith(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Container(
                                      width: 14,
                                      height: 14,
                                      decoration: const BoxDecoration(
                                        image: const DecorationImage(
                                          image: const AssetImage(
                                              'assets/icons/checklist.png'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Recent Transactions',
                  style: smallText.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                RecentTransactionWidget(
                  title: 'Avengers: Infinity Wars',
                  subtitle: 'CGV Paris van Java Mall',
                  amount: 650000,
                  imageMovie: 'avengers.jpg',
                ),
                RecentTransactionWidget(
                  subtitle: 'Wednesday, 22 January 2022',
                  amount: 800400000,
                ),
                RecentTransactionWidget(
                  subtitle: 'Wednesday, 22 January 2022',
                  amount: 800400000,
                ),
                RecentTransactionWidget(
                  subtitle: 'Wednesday, 22 January 2022',
                  amount: 800400000,
                ),
                RecentTransactionWidget(
                  subtitle: 'Wednesday, 22 January 2022',
                  amount: 800400000,
                ),
                RecentTransactionWidget(
                  subtitle: 'Wednesday, 22 January 2022',
                  amount: 800400000,
                ),
                RecentTransactionWidget(
                  subtitle: 'Wednesday, 22 January 2022',
                  amount: 800400000,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
