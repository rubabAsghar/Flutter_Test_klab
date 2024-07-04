
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../constant/constant.dart';
import '../../widget/login_button.dart';
import '../../widget/redirect_button.dart';
import '../navbar_screen/navbar_screen.dart';
import '../post_screen/post.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: width * 0.04, horizontal: width * 0.04),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      "assets/connection.png",
                      scale: 3,
                    ),
                    Text(
                      "Let`s meeting new\n people around you ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: width * 0.07),
                    ),
                    Column(
                      children: [
                        LoginButton(
                            onTap: ()=>Get.to(const NavBarScreen()),
                            buttonColor: themeColor1,
                            image: "assets/phone.png",
                            title: "Login With Phone",
                            width: width,
                            textColor: Colors.white),
                        SizedBox(
                          height: width * 0.04,
                        ),
                        LoginButton(
                            onTap: () {

                            },
                            buttonColor: themeColor2,
                            image: "assets/search.png",
                            title: "Login With Google",
                            width: width,
                            textColor: themeColor1),
                      ],
                    ),
                  ],
                ),
              ),
              RedirectButton(
                  text: "Don't have an account?",
                  onTap: (){
                    Get.to(() => PostsScreen());
                  },
                  label: "Sign Up"),
              const SizedBox(height: 5,)
            ],
          ),
        ),
      ),
    );
  }
}
