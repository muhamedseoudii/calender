import 'package:calender/component/text_field_custom.dart';
import 'package:calender/features/controllers/search_controller.dart';
import 'package:calender/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    SearchBarController searchController = Get.put(SearchBarController());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 130.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25.r),
                          bottomLeft: Radius.circular(25.r)),
                      color: const Color(0xff1565C0)),
                ),
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      Text(
                        "search".tr,
                        style: AppTextStyles.largeTitleWhite25,
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: SizedBox(
                          height: 50.h,
                          width: 300.w,
                          child: SearchTextField(
                            image: "assets/icons/search.svg",
                            hintText: "type something...",
                            controller: searchController.searchController,
                            onClick: () {
                              searchController.searchController.clear();
                            },
                            onChange: (p0) {},
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
