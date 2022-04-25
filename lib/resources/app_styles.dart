import 'package:flutter/material.dart';
import 'package:ketan_ramani/resources/app_colors.dart';

class AppStyles {
  static circleContainer(Color color) => BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      );

  static Widget divider({double? height}) => SizedBox(height: height ?? 20);

  static Widget etLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.whiteColor,
          fontSize: 14,
        ),
      ),
    );
  }

  static Widget etText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.secondaryColor,
          fontSize: 14,
        ),
      ),
    );
  }

  static TextStyle etTextStyle = const TextStyle(
    color: AppColors.whiteColor,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static InputDecoration etDecoration({
    String hintText = '',
    String prefix = '',
    Color fillColor = AppColors.etFillColor,
  }) {
    return InputDecoration(
      prefixIcon: prefix.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
                vertical: 15,
              ),
              child: Image.asset(
                prefix,
                width: 10,
              ),
            )
          : null,
      counterText: '',
      contentPadding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        color: AppColors.whiteColor.withOpacity(0.5),
        fontSize: 14,
      ),
      errorStyle: const TextStyle(
        color: AppColors.etErrorBorderColor,
        fontSize: 14,
      ),
      errorMaxLines: 2,
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(3),
        ),
        borderSide: BorderSide(
          width: 1,
          color: fillColor,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(3),
        ),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.etErrorBorderColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(3),
        ),
        borderSide: BorderSide(
          width: 1,
          color: fillColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(3),
        ),
        borderSide: BorderSide(
          width: 1,
          color: fillColor,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(3),
        ),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.secondaryColor,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(3),
        ),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.etErrorBorderColor,
        ),
      ),
      fillColor: fillColor,
      filled: true,
    );
  }
}
