import 'package:find_sport/src/core/constants/app_colors.dart';
import 'package:find_sport/src/core/constants/app_icons.dart';
import 'package:find_sport/src/core/localization/app_localizations.dart';
import 'package:find_sport/src/core/validator/sign_up_validator.dart';
import 'package:find_sport/src/presentation/widget/custom_botton.dart';
import 'package:find_sport/src/presentation/widget/custom_text_field.dart';
import 'package:find_sport/src/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  late TextInputFormatter inputFormatter;

  @override
  void initState() {
    nameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 30),
          child: Form(
            key: globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(
                    AppIcons.signUpImg,
                  ),
                  height: 250,
                ),
                Text(
                  AppLocalizations.of(context).sign_up,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(height: size.height * 0.028),
                CustomTextField(
                  text: AppLocalizations.of(context).first_name,
                  hintText: "Enter your first name",
                  controller: nameController,
                  validator: (value) => SignUpValidator.nameValidator(value!),
                ),
                SizedBox(height: size.height * 0.025),
                CustomTextField(
                  text: AppLocalizations.of(context).last_name,
                  hintText: "Enter your last name",
                  controller: lastNameController,
                  validator: (value) => SignUpValidator.lastName(value!),
                ),
                SizedBox(height: size.height * 0.018),
                CustomTextField(
                  text: AppLocalizations.of(context).phone_number,
                  hintText: "Enter your phone number",
                  controller: phoneNumberController,
                  validator: (value) => SignUpValidator.phoneNumber(value!),
                ),
                SizedBox(height: size.height * 0.018),
                CustomTextField(
                  text: AppLocalizations.of(context).password,
                  hintText: "Enter your password",
                  controller: passwordController,
                  validator: (value) {
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      return "Iltimos passwordlarni bir xil kiriting!";
                    } else {
                      SignUpValidator.password(value!);
                    }
                  },
                ),
                SizedBox(height: size.height * 0.018),
                CustomTextField(
                  text: AppLocalizations.of(context).confirm_password,
                  hintText: "Enter your confirm password",
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      return "Iltimos passwordlarni bir xil kiriting!";
                    } else {
                      SignUpValidator.password(value!);
                    }
                  },
                ),
                SizedBox(height: size.height * 0.023),
                CustomButton(
                  onPressed: () {
                    if (globalKey.currentState!.validate()) {
                      signUpButton();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUpButton() async {
    try {
      NetworkService().saveApiUserData(
        nameController.text,
        lastNameController.text,
        phoneNumberController.text,
        passwordController.text,
        confirmPasswordController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } catch (e) {
      throw Exception("Error sign up buttons!");
      Navigator.pop(context);
    }
  }
}
