import 'dart:math';

import 'package:calender/features/models/task_hive_model.dart';
import 'package:calender/utils/app_text_styles.dart';
import 'package:calender/utils/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PersonalTaskView extends StatelessWidget {
  const PersonalTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final taskBox = Hive.box<TaskModel>('tasks');

    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xff1565C0),
          title: Text(
            'personal task'.tr,
            style: AppTextStyles.largeTitleWhite20,
          )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            children: [
              ValueListenableBuilder(
                valueListenable: taskBox.listenable(),
                builder: (context, Box<TaskModel> box, _) {
                  if (box.values.isEmpty) {
                    return Center(
                      child: Text(
                        'no tasks added.'.tr,
                        style: AppTextStyles.largeTitle22,
                      ),
                    );
                  }

                  return Expanded(
                    child: ListView.separated(
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        final task = box.getAt(index);
                        return Dismissible(
                          key: Key(task?.key.toString() ?? ''),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) async {
                            final taskKey = task?.key.toInt();
                            if (taskKey != null) {
                              await LocalNotificationService()
                                  .cancelNotification(taskKey);
                              taskBox.deleteAt(index);
                              Get.snackbar(
                                'successful'.tr,
                                "you deleted your task".tr,
                                duration: const Duration(seconds: 2),
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            }
                          },
                          background: Container(
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.red,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          child: Card(
                            margin: EdgeInsets.zero,
                            color: Colors.primaries[
                                Random().nextInt(Colors.primaries.length - 1)],
                            child: ListTile(
                              title: Text(
                                task?.taskName ?? '',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                              subtitle: Text(
                                '${task?.description} - ${task?.date}',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                              trailing: Text(
                                task?.clock ?? '',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 10.h,
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
