import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinkpawscat/views/screens/authorization/login_screen/login_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              "assets/images/get_started.png",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const LoginScreen());
                    },
                    child: Image.asset(
                      'assets/images/startedbtn.png',
                      width: 300,
                      height: 60,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
