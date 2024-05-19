import 'package:calender/features/controllers/locale_controller.dart';
import 'package:calender/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final LocaleController controllerLang = Get.find<LocaleController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1565C0),
        title: Text(
          "change language".tr,
          style: AppTextStyles.largeTitleWhite20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  RadioListTile<String>(
                    title: const Text("English"),
                    value: "en",
                    groupValue: controllerLang.inialLang.languageCode,
                    onChanged: (value) {
                      controllerLang.changeLang(value!);
                      Get.back();
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text("عربى"),
                    value: "ar",
                    groupValue: controllerLang.inialLang.languageCode,
                    onChanged: (value) {
                      controllerLang.changeLang(value!);
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
