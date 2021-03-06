import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';

import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';

showLoaderGetX() {
  Get.dialog(
    Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: 60,
          margin: EdgeInsets.only(left: 40, right: 40),
          decoration: BoxDecoration(
              color: ColorStyle.secondryColor, borderRadius: BorderRadius.circular(4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(ColorStyle.primaryColor),
                ),
              ),
              Container(
                width: 16,
              ),
              Text(
                  "Loading ...",
                  style: TextStylesProductSans.textStyles_16.apply(
                      color: ColorStyle.primaryColor,
                      fontWeightDelta: 1
                  )
              ),
            ],
          ),
        ),
      ),
    ),
    barrierDismissible: false,
  );
}

hideLoader() {
  Navigator.pop(Get.context!);
}

extension SnackBar on String {
  showError() {
    Get.snackbar(
      "Error!",
      this,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  showSuccess() {
    Get.snackbar(
      "Success!",
      this,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}

share() async {
  await FlutterShare.share(
      title: 'Example share',
      text: 'Example share text',
      linkUrl: 'https://flutter.dev/',
      chooserTitle: 'Example Chooser Title'
  );
}

goToAnotherScreen(Widget page) {
  GetPage(
    name: "/second",
    page: () => page,
    transition: Transition.rightToLeft,
    transitionDuration: Duration(milliseconds: 400),
    curve: Curves.fastOutSlowIn,
  );
}