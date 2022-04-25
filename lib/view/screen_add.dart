import 'package:flutter/material.dart';
import 'package:ketan_ramani/database/database_helper.dart';
import 'package:ketan_ramani/enum/enum_action.dart';
import 'package:ketan_ramani/resources/app_colors.dart';
import 'package:ketan_ramani/resources/app_constants.dart';
import 'package:ketan_ramani/resources/app_strings.dart';
import 'package:ketan_ramani/resources/app_styles.dart';
import 'package:ketan_ramani/resources/validation_helper.dart';
import 'package:ketan_ramani/widgets/app_button.dart';
import 'package:ketan_ramani/widgets/app_toolbar.dart';

class ScreenAdd extends StatefulWidget {
  final EnumAction? action;
  final Map<String, dynamic>? map;
  const ScreenAdd({Key? key, this.action, this.map}) : super(key: key);

  @override
  State<ScreenAdd> createState() => _ScreenAddState();
}

class _ScreenAddState extends State<ScreenAdd> {
  final dbHelper = DatabaseHelper.instance;
  final _formKey = GlobalKey<FormState>();
  int? _id;
  var _name = '',
      _email = '',
      _contactNo = '',
      _education = '',
      _currentCompany = '',
      _designation = '',
      _projectTitle = '',
      _projectDescription = '';
  var _loading = false;

  _addResume(context) async {
    setState(() {
      _loading = true;
    });
    await dbHelper!.insert(DatabaseHelper.tableUser, {
      DatabaseHelper.colName: _name,
      DatabaseHelper.colEmail: _email.toString().toLowerCase(),
      DatabaseHelper.colContactNo: _contactNo,
      DatabaseHelper.colEducation: _education,
      DatabaseHelper.colCurrentCopmany: _currentCompany,
      DatabaseHelper.colDesignation: _designation,
      DatabaseHelper.colProjectTitle: _projectTitle,
      DatabaseHelper.colProjectDescription: _projectDescription,
    }).then((value) async {
      Navigator.of(context).pop(true);
    }).whenComplete(() {
      setState(() {
        _loading = false;
      });
    }).onError((error, stackTrace) {
      setState(() {
        _loading = false;
      });
    });
  }

  _editResume(context) async {
    setState(() {
      _loading = true;
    });

    await dbHelper!.update(DatabaseHelper.tableUser,
        whereColumn: DatabaseHelper.colId,
        whereColumnValue: _id!,
        data: {
          DatabaseHelper.colName: _name,
          DatabaseHelper.colEmail: _email.toString().toLowerCase(),
          DatabaseHelper.colContactNo: _contactNo,
          DatabaseHelper.colEducation: _education,
          DatabaseHelper.colCurrentCopmany: _currentCompany,
          DatabaseHelper.colDesignation: _designation,
          DatabaseHelper.colProjectTitle: _projectTitle,
          DatabaseHelper.colProjectDescription: _projectDescription,
        }).then((value) {
      Navigator.of(context).pop(true);
    }).whenComplete(() {
      setState(() {
        _loading = false;
      });
    }).onError((error, stackTrace) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      if (widget.action == EnumAction.edit ||
          widget.action == EnumAction.view) {
        setState(() {
          _id = int.parse(widget.map![DatabaseHelper.colId].toString());
          _name = widget.map![DatabaseHelper.colName];
          _email = widget.map![DatabaseHelper.colEmail];
          _contactNo = widget.map![DatabaseHelper.colContactNo];
          _education = widget.map![DatabaseHelper.colEducation];
          _currentCompany = widget.map![DatabaseHelper.colCurrentCopmany];
          _designation = widget.map![DatabaseHelper.colDesignation];
          _projectTitle = widget.map![DatabaseHelper.colProjectTitle];
          _projectDescription =
              widget.map![DatabaseHelper.colProjectDescription];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppToolbar(
        title: widget.action == EnumAction.add
            ? AppStrings.strAdd
            : AppStrings.strEdit,
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: AppColors.appThemeColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  AppStyles.etLabel(AppStrings.strName),
                  TextFormField(
                    key: _name.isEmpty
                        ? const Key('_name')
                        : const Key('_name1'),
                    initialValue: _name,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    inputFormatters: ValidationHelper.allowCharactersWithSpace,
                    style: AppStyles.etTextStyle,
                    decoration: AppStyles.etDecoration(
                      hintText: AppStrings.strEnter + ' ' + AppStrings.strName,
                    ),
                    validator: ((value) {
                      return ValidationHelper.isValidName(value!);
                    }),
                    onSaved: ((value) {
                      _name = value!;
                    }),
                  ),
                  AppStyles.divider(),

                  // Email
                  AppStyles.etLabel(AppStrings.strEmail),
                  TextFormField(
                    key: _email.isEmpty
                        ? const Key('_email')
                        : const Key('_email1'),
                    initialValue: _email,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    style: AppStyles.etTextStyle,
                    decoration: AppStyles.etDecoration(
                      hintText: AppStrings.strEnter + ' ' + AppStrings.strEmail,
                    ),
                    validator: ((value) {
                      return ValidationHelper.isValidEmail(value!);
                    }),
                    onSaved: ((value) {
                      _email = value!;
                    }),
                  ),
                  AppStyles.divider(),

                  // Contact No
                  AppStyles.etLabel(AppStrings.strContactNo),
                  TextFormField(
                    key: _contactNo.isEmpty
                        ? const Key('_contactNo')
                        : const Key('_contactNo1'),
                    initialValue: _contactNo,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: ValidationHelper.allowDigitsOnly,
                    maxLength: AppConstants.contactNoMaxLength,
                    style: AppStyles.etTextStyle,
                    decoration: AppStyles.etDecoration(
                      hintText:
                          AppStrings.strEnter + ' ' + AppStrings.strContactNo,
                    ),
                    validator: ((value) {
                      return ValidationHelper.isValidContactNo(value!);
                    }),
                    onSaved: ((value) {
                      _contactNo = value!;
                    }),
                  ),
                  AppStyles.divider(),

                  // Education
                  AppStyles.etLabel(AppStrings.strEducation),
                  TextFormField(
                    key: _education.isEmpty
                        ? const Key('_education')
                        : const Key('_education1'),
                    initialValue: _education,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    style: AppStyles.etTextStyle,
                    decoration: AppStyles.etDecoration(
                      hintText:
                          AppStrings.strEnter + ' ' + AppStrings.strEducation,
                    ),
                    validator: ((value) {
                      return ValidationHelper.isBasicValidation(value!);
                    }),
                    onSaved: ((value) {
                      _education = value!;
                    }),
                  ),
                  AppStyles.divider(),

                  // Current Company
                  AppStyles.etLabel(AppStrings.strCurrentCopmany),
                  TextFormField(
                    key: _currentCompany.isEmpty
                        ? const Key('_currentCompany')
                        : const Key('_currentCompany1'),
                    initialValue: _currentCompany,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    style: AppStyles.etTextStyle,
                    decoration: AppStyles.etDecoration(
                      hintText: AppStrings.strEnter +
                          ' ' +
                          AppStrings.strCurrentCopmany,
                    ),
                    validator: ((value) {
                      return ValidationHelper.isBasicValidation(value!);
                    }),
                    onSaved: ((value) {
                      _currentCompany = value!;
                    }),
                  ),
                  AppStyles.divider(),

                  // Designation
                  AppStyles.etLabel(AppStrings.strDesignation),
                  TextFormField(
                    key: _designation.isEmpty
                        ? const Key('_designation')
                        : const Key('_designation1'),
                    initialValue: _designation,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    style: AppStyles.etTextStyle,
                    decoration: AppStyles.etDecoration(
                      hintText:
                          AppStrings.strEnter + ' ' + AppStrings.strDesignation,
                    ),
                    validator: ((value) {
                      return ValidationHelper.isBasicValidation(value!);
                    }),
                    onSaved: ((value) {
                      _designation = value!;
                    }),
                  ),
                  AppStyles.divider(),

                  // Project Title
                  AppStyles.etLabel(AppStrings.strProjectTitle),
                  TextFormField(
                    key: _projectTitle.isEmpty
                        ? const Key('_projectTitle')
                        : const Key('_projectTitle1'),
                    initialValue: _projectTitle,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    style: AppStyles.etTextStyle,
                    decoration: AppStyles.etDecoration(
                      hintText: AppStrings.strEnter +
                          ' ' +
                          AppStrings.strProjectTitle,
                    ),
                    validator: ((value) {
                      return ValidationHelper.isBasicValidation(value!);
                    }),
                    onSaved: ((value) {
                      _projectTitle = value!;
                    }),
                  ),
                  AppStyles.divider(),

                  // Project Description
                  AppStyles.etLabel(AppStrings.strProjectDescription),
                  TextFormField(
                    key: _projectDescription.isEmpty
                        ? const Key('_projectDescription')
                        : const Key('_projectDescription1'),
                    initialValue: _projectDescription,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    style: AppStyles.etTextStyle,
                    decoration: AppStyles.etDecoration(
                      hintText: AppStrings.strEnter +
                          ' ' +
                          AppStrings.strProjectDescription,
                    ),
                    validator: ((value) {
                      return ValidationHelper.isBasicValidation(value!);
                    }),
                    onSaved: ((value) {
                      _projectDescription = value!;
                    }),
                  ),
                  AppStyles.divider(),

                  // Submit
                  SizedBox(
                    width: double.infinity,
                    child: _loading
                        ? const Center(
                            child: CircularProgressIndicator.adaptive())
                        : AppButton(
                            text: AppStrings.strSubmit.toUpperCase(),
                            onPressed: () {
                              //Hide Keyboard Form
                              FocusScope.of(context).requestFocus(FocusNode());
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                if (widget.action == EnumAction.add) {
                                  _addResume(context);
                                } else if (widget.action == EnumAction.edit) {
                                  _editResume(context);
                                }
                              }
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
