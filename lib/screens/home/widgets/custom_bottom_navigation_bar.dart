import 'package:flutix/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/theme.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> pages = ['movies', 'tickets'];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: pages
                .map(
                  (e) => GestureDetector(
                    onTap: () => context.read<HomeCubit>().changePage(e),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 18,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/icons/${e != state.selectedPage ? e + '_inactive' : e}.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          e == 'movies' ? 'New Movies' : 'My Tickets',
                          style: AppTextStyle.smallText.copyWith(
                            fontSize: 11,
                            color: e == state.selectedPage
                                ? Colors.black
                                : AppColors.lightGreyColor,
                          ),
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
