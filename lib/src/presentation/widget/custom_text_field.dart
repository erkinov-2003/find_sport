import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    required this.hintText,
    required this.controller,
    this.prefix,
    this.validator,
  });
  final String text;
  final String hintText;
  final TextEditingController controller;
  final Widget? prefix;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyColor, width: 0.4),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextFormField(
                  validator: validator,
                  controller: controller,
                  style: const TextStyle(color: AppColors.blackColor),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefix: prefix,
                    enabledBorder: InputBorder.none,
                    hintText: hintText,
                    hintStyle:
                    Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
