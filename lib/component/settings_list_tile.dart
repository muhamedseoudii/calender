import 'package:calender/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsListTile extends StatelessWidget {
  final String text;
  final Widget? widget, icon;
  final void Function()? onTap;
  final ColorFilter? colorFilter;

  const SettingsListTile({
    super.key,
    required this.text,
    this.widget,
    this.onTap,
    this.colorFilter,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Container(
          height: 55.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            // border: Border.fromBorderSide(BorderSide(color: Colors.red)),
          ),
          child: ListTile(
            title: Text(
              text,
              style: AppTextStyles.largeTitle16,
            ),
            leading: Container(
              height: 35.h,
              width: 35.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: const Color(0xffB2EBF2),
              ),
              child: icon,
            ),
            trailing: widget,
          ),
        ),
      ),
    );
  }
}
