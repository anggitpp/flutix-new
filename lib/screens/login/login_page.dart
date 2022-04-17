import 'package:flutix/blocs/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme.dart';
import '../../widgets/button_next.dart';
import '../../widgets/textformfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Form(
                key: _formKey,
                autovalidateMode: _autovalidateMode,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.defaultMargin, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/logo.png'))),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Text(
                          'Welcome Back,\nExplorer!',
                          style: AppTextStyle.largeText.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: [
                            Focus(
                              onFocusChange: (value) => context
                                  .read<LoginCubit>()
                                  .changeFocusEmail(hasFocus: value),
                              child: CreateTextFormField(
                                controller: _emailController,
                                labelColor: state.emailLabelColor,
                                checkFunction: () => context
                                    .read<LoginCubit>()
                                    .checkValid(_emailController.text,
                                        _passwordController.text),
                                label: 'Email Address',
                                validator: (String? value) {
                                  if (!isEmail(value!)) {
                                    context
                                        .read<LoginCubit>()
                                        .changeFocusPassword(isError: true);
                                    return 'Please enter a valid email';
                                  }
                                  context
                                      .read<LoginCubit>()
                                      .changeFocusEmail(isError: false);
                                  return null;
                                },
                                onSaved: (String? value) {
                                  _emailController.text = value!;
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Focus(
                              onFocusChange: (value) => context
                                  .read<LoginCubit>()
                                  .changeFocusPassword(hasFocus: value),
                              child: CreateTextFormField(
                                checkFunction: () => context
                                    .read<LoginCubit>()
                                    .checkValid(_emailController.text,
                                        _passwordController.text),
                                controller: _passwordController,
                                labelColor: state.passwordLabelColor,
                                obsecureText: true,
                                label: 'Password',
                                onSaved: (String? value) {
                                  _passwordController.text = value!;
                                  return null;
                                },
                                validator: (String? value) {
                                  if (value == null || value.trim().isEmpty) {
                                    context
                                        .read<LoginCubit>()
                                        .changeFocusPassword(isError: true);
                                    return 'Password required';
                                  }
                                  if (value.trim().length < 6) {
                                    context
                                        .read<LoginCubit>()
                                        .changeFocusPassword(isError: true);
                                    return 'Password required min 6 character';
                                  }

                                  context
                                      .read<LoginCubit>()
                                      .changeFocusPassword(isError: false);
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: ButtonNext(
                                onTap: () => _submit(),
                                arrowColor: state.isCanSignIn
                                    ? Colors.white
                                    : AppColors.darkGreyColor,
                                backgroundColor: state.isCanSignIn
                                    ? AppColors.purpleColor
                                    : AppColors.lightGreyColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Start fresh now?',
                                style: AppTextStyle.greySmallText
                                    .copyWith(color: AppColors.greyColor),
                              ),
                              InkWell(
                                onTap: (() => Get.toNamed('/registration')),
                                child: Text(
                                  ' Sign Up',
                                  style: AppTextStyle.smallText.copyWith(
                                      color: AppColors.purpleColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
