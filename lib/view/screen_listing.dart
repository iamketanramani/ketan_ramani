import 'package:flutter/material.dart';
import 'package:ketan_ramani/adaptive/adaptive_dialog.dart';
import 'package:ketan_ramani/database/database_helper.dart';
import 'package:ketan_ramani/enum/enum_action.dart';
import 'package:ketan_ramani/resources/app_colors.dart';
import 'package:ketan_ramani/resources/app_helper.dart';
import 'package:ketan_ramani/resources/app_strings.dart';
import 'package:ketan_ramani/view/screen_add.dart';
import 'package:ketan_ramani/view/screen_preview.dart';

class ScreenListing extends StatefulWidget {
  const ScreenListing({Key? key}) : super(key: key);

  @override
  State<ScreenListing> createState() => _ScreenListingState();
}

class _ScreenListingState extends State<ScreenListing> {
  final dbHelper = DatabaseHelper.instance;
  var resumeList = [];

  Future<void> listResumes() async {
    resumeList.clear();
    await dbHelper!
        .queryAll(DatabaseHelper.tableUser)
        .then((value) {
          resumeList.addAll(value);
        })
        .then((value) {})
        .whenComplete(() {
          setState(() {});
        });
  }

  deleteResume(context, id) async {
    await dbHelper!
        .delete(DatabaseHelper.tableUser,
            whereColumn: DatabaseHelper.colId, whereColumnValue: int.parse(id))
        .then((value) {
          listResumes();
        })
        .then((value) {})
        .whenComplete(() {
          setState(() {});
        });
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      listResumes();
    }
  }

  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = resumeList.removeAt(oldindex);
      resumeList.insert(newindex, items);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.transparentColor,
        title: const Text(AppStrings.appName),
      ),
      backgroundColor: AppColors.appThemeColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppHelper.changeScreenForResult(
                  context, const ScreenAdd(action: EnumAction.add))
              .then((value) {
            if (value != null && value) {
              listResumes();
            }
          });
        },
        backgroundColor: AppColors.secondaryColor,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: resumeList.isEmpty
            ? const Center(
                child: Text(
                  AppStrings.strNoResume,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 15,
                  ),
                ),
              )
            : Theme(
                data: ThemeData(canvasColor: Colors.transparent),
                child: ReorderableListView(
                  children: resumeList.map((item) {
                    AppHelper.showLog('Ketan: ${item.toString()}');
                    var map = item;
                    return Column(
                      key: UniqueKey(),
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          key: UniqueKey(),
                          title: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                map[DatabaseHelper.colName],
                                style: const TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  AppHelper.changeScreen(
                                    context,
                                    ScreenPreview(resumeData: map),
                                  );
                                },
                                child: const Icon(
                                  Icons.remove_red_eye,
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  showDialog<bool>(
                                    context: context,
                                    builder: (context) {
                                      return AdaptiveDialog(
                                        message: AppStrings.strAlertDelete,
                                        left: AppStrings.strNo,
                                        right: AppStrings.strYes,
                                        iOSRedButton: true,
                                        leftClick: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        rightClick: () {
                                          Navigator.of(context).pop(true);
                                          deleteResume(
                                              context,
                                              map[DatabaseHelper.colId]
                                                  .toString());
                                        },
                                      );
                                    },
                                  );
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: AppColors.redColor,
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  AppHelper.changeScreenForResult(
                                      context,
                                      ScreenAdd(
                                        action: EnumAction.edit,
                                        map: map,
                                      )).then((value) {
                                    if (value != null && value) {
                                      listResumes();
                                    }
                                  });
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.menu,
                                color: AppColors.secondaryColor,
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Divider(
                            height: 1,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                  onReorder: reorderData,
                ),
              ),
      ),
    );
  }
}
