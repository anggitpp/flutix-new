import 'package:flutix/blocs/blocs.dart';
import 'package:flutix/config/route_name.dart';
import 'package:flutix/widgets/header_title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

import '../../models/user.dart';
import '../../widgets/error_dialog.dart';

class ConfirmAccountPage extends StatelessWidget {
  const ConfirmAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    User user = arguments['user'];

    void _submit() {
      context.read<ConfirmAccountCubit>().confirmAccount(
            user.name,
            user.email,
            user.genres,
            user.language,
            user.image.path,
          );
    }

    return BlocConsumer<ConfirmAccountCubit, ConfirmAccountState>(
      listener: (context, state) {
        if (state.confirmAccountStatus == ConfirmAccountStatus.success) {
          Navigator.pushNamed(context, RouteName.home);
        } else if (state.confirmAccountStatus == ConfirmAccountStatus.error) {
          errorDialog(context, state.error);
        }
      },
      builder: (context, state) {
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
                style: AppTextStyle.largeText
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 110,
              ),
              state.confirmAccountStatus == ConfirmAccountStatus.submitting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      width: 250,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: '3E9D9D'.toColor(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () => _submit(),
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
      },
    );
  }
}
