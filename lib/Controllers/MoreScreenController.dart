
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:get/get.dart';
import '../Controllers/MyAccountController.dart';



class MoreScreenController extends GetxController {
  final controllerMyAccount  = Get.put(MyAccountController());

  RxList<String> images1 = <String>[
    ImageStyle.Group3134,
    ImageStyle.Group3140,
    ImageStyle.Group3135,
    ImageStyle.Group3136,
    ImageStyle.Group3137,
    ImageStyle.Group3139,
  ].obs;

  RxList<String> moreItem = [
    'My Company',
    'Taxes',
    'Items',
    'Document Settings',
    'Email Messages',
    'About',
  ].obs;

  RxList<String> moreItem1 = [
    'Edit your company details',
    'Add or manage your taxes',
    'Add or manage items',
    'Contract and Payment settings',
    'Edit your email message',
    'About company and terms',
  ].obs;

  reset() {
    Future.delayed(Duration(microseconds: 100), () {
      controllerMyAccount.refresh();
      readProfile();
    });
  }

  readProfile() {
    controllerMyAccount.readProfile();
  }

}