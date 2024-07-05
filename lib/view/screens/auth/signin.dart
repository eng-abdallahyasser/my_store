import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/sign_in_controller.dart';
import 'package:my_store/core/constants.dart';
import 'package:my_store/view/global%20widget/my_button.dart';
import 'package:my_store/view/global%20widget/my_textfield.dart';

class SignInScreen extends StatelessWidget {
  final SignInController controller = Get.put(SignInController());

  SignInScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color(0xFF7f30fe),
                    Color(0xFF6380fb),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 106.0))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Column(
                children: [
                  const Center(
                      child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  )),
                  const Center(
                      child: Text(
                    "Login to your account",
                    style: TextStyle(
                        color: Color(0xFFbbb0ff),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  )),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: GetBuilder<SignInController>(builder: (_) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10.0),
                              MyTextfield(
                                controller: controller.emailController,
                                hintText: "Email",
                                obscureText: false,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(height: 10.0),
                              Row(children: [
                                Expanded(
                                  child: MyTextfield(
                                    hintText: 'Password',
                                    controller: controller.pwController,
                                    obscureText: controller.showPassword,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      controller.hidePassword();
                                    },
                                    icon: const Icon(
                                        Icons.remove_red_eye_outlined))
                              ]),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("I forgetten my password, ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400)),
                                  Text("Reset it.",
                                      style: TextStyle(
                                          color: Color(0xff7f30fe),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: controller.signIn,
                                  child: const MyButton(text: "Sign In"),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "I don't have acount, ",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(MyRoutes.signUpScreen);
                          },
                          child: const Text(
                            "Sign Up Now",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xff7f30fe),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
