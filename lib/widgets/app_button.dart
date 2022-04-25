import 'package:flutter/material.dart';
import 'package:ketan_ramani/resources/app_colors.dart';

class AppButton extends StatelessWidget {
  final String? text;

  final double? height;
  final double? width;
  final double? textSize;
  final double? borderRadius;

  final Color? textColor;
  final Color? backGroundColor;

  final FontWeight? fontWeight;

  final VoidCallback? onPressed;

  const AppButton({
    Key? key,
    this.text = '',
    this.height,
    this.width,
    this.textSize,
    this.borderRadius,
    this.textColor,
    this.backGroundColor,
    this.fontWeight,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 45,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              /*if (states.contains(MaterialState.disabled)) {
                return greyColor;
              }*/
              return backGroundColor ?? AppColors.secondaryColor; // Defer to the widget's default.
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: (borderRadius != null)
                  ? BorderRadius.circular(borderRadius!)
                  : BorderRadius.circular(3),
            ),
          ),
          elevation: MaterialStateProperty.resolveWith<double>(
            // As you said you don\'t need elevation. I'm returning 0 in both case
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return 0;
              }
              return 0; // Defer to the widget's default.
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              /*if (states.contains(MaterialState.disabled)) {
                return greyColor;
              }*/
              return backGroundColor ?? AppColors.secondaryColor; // Defer to the widget's default.
            },
          ),
          visualDensity: const VisualDensity(horizontal: VisualDensity.minimumDensity),
        ),
        onPressed: onPressed,
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor ?? AppColors.themeColor,
            fontSize: textSize ?? 16,
            fontWeight: fontWeight ?? FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
