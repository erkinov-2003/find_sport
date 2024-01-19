import 'package:find_sport/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.gradientColor1,
                AppColors.gradientColor2,
              ],
            ),
          ),
          child: Center(
            child: Text(
              "Save",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
