import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants.dart';
import 'package:my_store/firebase/auth.dart';
import 'package:my_store/view/screens/admin/admin_services.dart';

class SignUpController extends GetxController {
  final Auth _auth = Auth();
  final AdminServices _adminServices = AdminServices();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController confirmPwController = TextEditingController();
  bool showPassword = false;
  bool showConfirmPassword = false;

  void hidePassword() {
    showPassword = !showPassword;
    update();
  }

  void hideConfirmPassword() {
    showConfirmPassword = !showConfirmPassword;
    update();
  }

  Future<void> signUp() async {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        pwController.text.isNotEmpty &&
        confirmPwController.text.isNotEmpty) {
      if (pwController.text == confirmPwController.text) {
        Get.dialog(const AlertDialog(
          title: Text('Signing Up...'),
          content: SizedBox(
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          ),
        ));
        String massage = await _auth.signUp(
            emailController.text, pwController.text, nameController.text);
        Get.back();
        if (massage == "Signed up") {
          await _adminServices.saveThisDevice();
          Get.offAllNamed(MyRoutes.navigationBarWraper);
        }
        if (massage == 'weak-password') {
          Get.defaultDialog(
            title: 'Error',
            middleText: 'اجتهد شوية و خلي الباسورد اطول من كدة شوية',
          );
        }
        if (massage == 'invalid-email') {
      Get.defaultDialog(
        title: 'Error',
        middleText: 'دا مش شكل ايميل يا واجهة',
      );
    }
        if (massage == 'email-already-in-use') {
          Get.defaultDialog(
            title: 'Error',
            middleText: 'الايميل دا حد تاني مستخدمه او انت نسيت الباسورد بتاعه',
          );
        }
      } else {
        Get.defaultDialog(
          title: 'Error',
          middleText: 'Password and Confirm Password are not the same',
        );
      }
    } else {
      Get.defaultDialog(
        title: 'Error',
        middleText: 'Please fill all the fields',
      );
    }
    
  }
}
