import 'package:flutix/screens/tickets/widgets/my_tickets_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/blocs.dart';
import '../../config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final List<String> tabs = ['Newest', 'Oldest'];
    return BlocBuilder<TicketsCubit, TicketsState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              width: phoneWidth,
              height: 110,
              decoration: BoxDecoration(
                color: AppColors.darkPurpleColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: AppSizes.defaultMargin),
                    child: Text(
                      'My Tickets',
                      style: AppTextStyle.largeText.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                        children: tabs
                            .map(
                              (e) => InkWell(
                                onTap: () =>
                                    context.read<TicketsCubit>().selectTab(e),
                                child: Container(
                                  width: phoneWidth / 2 - 20,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: e == state.selectedTab
                                            ? AppColors.yellowColor
                                            : Colors.transparent,
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    e,
                                    style: AppTextStyle.mediumText.copyWith(
                                      color: e == state.selectedTab
                                          ? Colors.white
                                          : '6F678E'.toColor(),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                            .toList()),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.defaultMargin,
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Get.toNamed('/ticketdetail'),
                    child: const MyTicketsWidget(
                      title: 'Avengers: Infinity Wars',
                      subtitle: 'CGV Paris van Java Mall',
                      language: 'English',
                      genre: 'Action',
                      imageMovie: 'avengers.jpg',
                    ),
                  ),
                  const MyTicketsWidget(
                    title: 'Avengers: Infinity Wars',
                    subtitle: 'CGV Paris van Java Mall',
                    language: 'English',
                    genre: 'Action',
                    imageMovie: 'avengers.jpg',
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
