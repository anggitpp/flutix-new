import 'package:flutix/widgets/textbox_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/blocs.dart';
import '../../config/route_name.dart';
import '../../config/theme.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../widgets/button_next.dart';
import '../../widgets/header_title.dart';

class SelectGenrePage extends StatelessWidget {
  const SelectGenrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final List<String> genres = [
      'Horror',
      'Music',
      'Action',
      'Drama',
      'War',
      'Crime',
    ];

    final List<String> languages = [
      'Bahasa',
      'English',
      'Japanese',
      'Korean',
    ];

    var phoneWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<SelectGenreCubit, SelectGenreState>(
      builder: (context, state) {
        User user = arguments['user'];
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderTitle(
                    backFunction: () => Navigator.pop(context),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.defaultMargin,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Your\nFavorite Genre',
                          style: AppTextStyle.largeText.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: phoneWidth - 2 * AppSizes.defaultMargin,
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 24,
                            runSpacing: 24,
                            children: genres
                                .map(
                                  (e) => InkWell(
                                    onTap: () => context
                                        .read<SelectGenreCubit>()
                                        .addSelectedGenre(e),
                                    child: TextBoxWidget(
                                      width: phoneWidth / 2 - 38,
                                      height: 60,
                                      color: state.selectedGenres.contains(e)
                                          ? AppColors.yellowColor
                                          : Colors.transparent,
                                      text: e,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Movie Language\nYou Prefer?',
                          style: AppTextStyle.largeText.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: phoneWidth - 2 * AppSizes.defaultMargin,
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 24,
                            runSpacing: 24,
                            children: languages
                                .map(
                                  (e) => InkWell(
                                    onTap: () => context
                                        .read<SelectGenreCubit>()
                                        .selectLanguage(e),
                                    child: TextBoxWidget(
                                        width: phoneWidth / 2 - 38,
                                        height: 60,
                                        color: state.selectedLanguage == e
                                            ? AppColors.yellowColor
                                            : Colors.transparent,
                                        text: e),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () => state.isCanNextStep
                              ? Navigator.pushNamed(
                                  context, RouteName.confirmAccount,
                                  arguments: {
                                      'user': User(
                                        name: user.name,
                                        email: user.email,
                                        genres: state.selectedGenres,
                                        language: state.selectedLanguage,
                                        image: user.image,
                                      ),
                                    })
                              : () {},
                          child: ButtonNext(
                            arrowColor: state.isCanNextStep
                                ? Colors.white
                                : AppColors.darkGreyColor,
                            backgroundColor: state.isCanNextStep
                                ? AppColors.purpleColor
                                : AppColors.lightGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
