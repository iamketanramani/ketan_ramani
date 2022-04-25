import 'package:flutter/material.dart';
import 'package:ketan_ramani/database/database_helper.dart';
import 'package:ketan_ramani/resources/app_colors.dart';
import 'package:ketan_ramani/resources/app_strings.dart';
import 'package:ketan_ramani/resources/app_styles.dart';
import 'package:ketan_ramani/widgets/app_toolbar.dart';
import 'package:ketan_ramani/widgets/widget_design.dart';

class ScreenPreview extends StatelessWidget {
  final Map<String, dynamic>? resumeData;
  const ScreenPreview({Key? key, this.resumeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppToolbar(
        title: AppStrings.strPreview,
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: AppColors.appThemeColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WidgetDesign(text: AppStrings.strPersonalInfo),
                AppStyles.divider(height: 10),

                // Name
                AppStyles.etLabel(AppStrings.strName),
                AppStyles.etText(resumeData![DatabaseHelper.colName]),
                AppStyles.divider(height: 10),

                // Email
                AppStyles.etLabel(AppStrings.strEmail),
                AppStyles.etText(resumeData![DatabaseHelper.colEmail]),
                AppStyles.divider(height: 10),

                // Contact No
                AppStyles.etLabel(AppStrings.strContactNo),
                AppStyles.etText(resumeData![DatabaseHelper.colContactNo]),
                AppStyles.divider(height: 10),

                const WidgetDesign(text: AppStrings.strEducationalInfo),
                AppStyles.divider(height: 10),

                // Education
                AppStyles.etLabel(AppStrings.strEducation),
                AppStyles.etText(resumeData![DatabaseHelper.colEducation]),
                AppStyles.divider(height: 10),

                // Company
                AppStyles.etLabel(AppStrings.strCurrentCopmany),
                AppStyles.etText(resumeData![DatabaseHelper.colCurrentCopmany]),
                AppStyles.divider(height: 10),

                // Designation
                AppStyles.etLabel(AppStrings.strDesignation),
                AppStyles.etText(resumeData![DatabaseHelper.colDesignation]),
                AppStyles.divider(height: 10),

                const WidgetDesign(text: AppStrings.strProjectDetails),
                AppStyles.divider(height: 10),

                // Project Title
                AppStyles.etLabel(AppStrings.strProjectTitle),
                AppStyles.etText(resumeData![DatabaseHelper.colProjectTitle]),
                AppStyles.divider(height: 10),

                // Project Description
                AppStyles.etLabel(AppStrings.strProjectDescription),
                AppStyles.etText(
                    resumeData![DatabaseHelper.colProjectDescription]),
                AppStyles.divider(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
