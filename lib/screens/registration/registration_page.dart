import 'package:flutix/config/route_name.dart';
import 'package:flutix/widgets/header_title.dart';
import 'package:flutix/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

import '../../blocs/registration/registration_cubit.dart';
import '../../config/theme.dart';
import '../../widgets/button_next.dart';
import '../../widgets/textformfield.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();

    Navigator.pushNamed(context, RouteName.genre);
  }

  void _checkValidForm() {
    context.read<RegistrationCubit>().checkValid(
          _nameController.text,
          _emailController.text,
          _passwordController.text,
          _confirmPasswordController.text,
        );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, RegistrationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HeaderTitle(
                        title: 'Create New\nYour Account',
                        backFunction: Get.back),
                    const SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: state.isLoadedImage
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.file(
                                      context.watch<RegistrationCubit>().image!,
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container(
                                    width: 90,
                                    height: 90,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/nophoto.png'))),
                                  ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: InkWell(
                              onTap: state.isLoadedImage
                                  ? context
                                      .read<RegistrationCubit>()
                                      .removeImage
                                  : context
                                      .read<RegistrationCubit>()
                                      .uploadImage,
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: state.isLoadedImage
                                        ? const AssetImage(
                                            'assets/icons/remove_photo.png')
                                        : const AssetImage(
                                            'assets/icons/add_photo.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: AppSizes.defaultMargin),
                      child: Column(
                        children: [
                          Focus(
                            onFocusChange: (value) => context
                                .read<RegistrationCubit>()
                                .changeFocusName(hasFocus: value),
                            child: CreateTextFormField(
                              controller: _nameController,
                              label: 'Full Name',
                              labelColor: state.nameLabelColor,
                              checkFunction: _checkValidForm,
                              validator: (String? value) {
                                if (value!.trim().length < 3) {
                                  context
                                      .read<RegistrationCubit>()
                                      .changeFocusName(isError: true);
                                  return 'Name required minimum 3 characters';
                                }

                                context
                                    .read<RegistrationCubit>()
                                    .changeFocusName(isError: false);
                                return null;
                              },
                              onSaved: (String? value) {
                                _nameController.text = value!;
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Focus(
                            onFocusChange: (value) => context
                                .read<RegistrationCubit>()
                                .changeFocusEmail(hasFocus: value),
                            child: CreateTextFormField(
                              controller: _emailController,
                              label: 'Email',
                              labelColor: state.emailLabelColor,
                              checkFunction: _checkValidForm,
                              validator: (String? value) {
                                if (!isEmail(value!)) {
                                  context
                                      .read<RegistrationCubit>()
                                      .changeFocusEmail(isError: true);
                                  return 'Please enter a valid email';
                                }

                                context
                                    .read<RegistrationCubit>()
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
                            height: 20,
                          ),
                          Focus(
                            onFocusChange: (value) => context
                                .read<RegistrationCubit>()
                                .changeFocusPassword(hasFocus: value),
                            child: CreateTextFormField(
                              controller: _passwordController,
                              label: 'Password',
                              labelColor: state.passwordLabelColor,
                              obsecureText: true,
                              checkFunction: _checkValidForm,
                              validator: (String? value) {
                                if (value != null && value.trim().length < 6) {
                                  context
                                      .read<RegistrationCubit>()
                                      .changeFocusPassword(isError: true);
                                  return 'Password required min 6 characters';
                                }

                                context
                                    .read<RegistrationCubit>()
                                    .changeFocusPassword(isError: false);
                                return null;
                              },
                              onSaved: (String? value) {
                                _passwordController.text = value!;
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Focus(
                            onFocusChange: (value) => context
                                .read<RegistrationCubit>()
                                .changeFocusConfirmPassword(hasFocus: value),
                            child: CreateTextFormField(
                              controller: _confirmPasswordController,
                              label: 'Confirm Password',
                              labelColor: state.confirmPasswordLabelColor,
                              obsecureText: true,
                              checkFunction: _checkValidForm,
                              validator: (String? value) {
                                if (value != _passwordController.text) {
                                  context
                                      .read<RegistrationCubit>()
                                      .changeFocusConfirmPassword(
                                          isError: true);
                                  return 'Confirm Password is not same with Password';
                                }

                                context
                                    .read<RegistrationCubit>()
                                    .changeFocusConfirmPassword(isError: false);
                                return null;
                              },
                              onSaved: (String? value) {
                                _confirmPasswordController.text = value!;
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ButtonNext(
                            onTap: () => state.isCanSignUp ? _submit() : () {},
                            arrowColor: state.isCanSignUp
                                ? Colors.white
                                : AppColors.darkGreyColor,
                            backgroundColor: state.isCanSignUp
                                ? AppColors.purpleColor
                                : AppColors.lightGreyColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
