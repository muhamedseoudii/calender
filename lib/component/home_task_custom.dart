import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTaskCustom extends StatelessWidget {
  final String title, desc, date;
  final void Function()? onClick;
  final Widget? leading;
  final bool? isChecked;
  final void Function(bool?)? onCheckedChanged;

  const HomeTaskCustom({
    super.key,
    required this.title,
    this.onClick,
    required this.desc,
    this.leading,
    required this.date,
    this.isChecked,
    this.onCheckedChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onClick,
        child: Container(
          width: double.infinity,
          height: 70.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16.r),
              ),
              color: const Color(0xff1565C0)),
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            leading: Checkbox(
              side: const BorderSide(color: Colors.white, width: 2),
              checkColor: Colors.amber,
              value: isChecked,
              onChanged: onCheckedChanged,
            ),
            subtitle: Text(
              desc,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: Text(
              date,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ));
  }
}
