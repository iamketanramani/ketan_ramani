import 'package:flutter/material.dart';
import 'package:ketan_ramani/resources/app_colors.dart';

class WidgetDesign extends StatelessWidget {
  final String? text;
  const WidgetDesign({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 2,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Colors.white,
                Colors.transparent,
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text!,
          style: const TextStyle(
            color: AppColors.whiteColor,
            fontSize: 12,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 50,
          height: 2,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.white,
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
