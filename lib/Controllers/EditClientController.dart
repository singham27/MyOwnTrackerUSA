
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditClientController extends GetxController {


  Rx<TextEditingController> clientNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController = TextEditingController().obs;
  Rx<TextEditingController> homeNumberController = TextEditingController().obs;
  Rx<TextEditingController> billingAddressController = TextEditingController().obs;



}
