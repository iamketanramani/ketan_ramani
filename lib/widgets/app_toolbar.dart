import 'package:flutter/material.dart';
import 'package:ketan_ramani/resources/app_colors.dart';

class AppToolbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final String? title;
  const AppToolbar({Key? key, this.onBack, this.title = ''}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.transparentColor,
      leading: InkWell(
        onTap: onBack,
        child: const Icon(Icons.arrow_back_ios),
      ),
      title: Text(title!),
      // elevation: 0,
    );
  }
}
