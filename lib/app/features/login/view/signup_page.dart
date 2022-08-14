import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petapp/app/features/login/controller/auth_controller.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List images = ["g.png", "t.png", "f.png"];

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Container(
          width: w,
          height: h * 0.15,
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage("assets/img/signup.png"), fit: BoxFit.cover),
          // ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 18.0),
          child: Text(
            'Sign Up',
            style: TextStyle(
                color: Colors.black, fontSize: 56, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 18.0),
          child: Text('Sign up your account'),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          width: w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 7)
                    ]),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.deepOrangeAccent,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(30)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(30)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 7)
                    ]),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: const Icon(
                        Icons.password_outlined,
                        color: Colors.deepOrangeAccent,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(30)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(30)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              // Row(
              //   children: [
              //     Expanded(child: Container()),
              //     const Text('Forgot your password ?')
              //   ],
              // )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            AuthController.instance.register(
                emailController.text.trim(), passwordController.text.trim());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Container(
              width: w * 0.5,
              height: h * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                    image: AssetImage("assets/img/loginbtn.png"),
                    fit: BoxFit.cover),
              ),
              child: const Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: RichText(
            text: TextSpan(
                text: "Already have an account ",
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                style: TextStyle(color: Colors.grey[500], fontSize: 20),
                children: [
                   TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => LoginPage()),
                      text: "Login",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))
                ]),
          ),
        ),
        SizedBox(height: h * 0.08),
      ]),
    );
  }
}
