import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petapp/app/features/login/controller/auth_controller.dart';
import 'package:petapp/app/features/login/view/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Container(
          width: w,
          height: h * 0.2,
          color: Colors.white,
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage("assets/img/loginimg.png"),
          //       fit: BoxFit.cover),
          // ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          width: w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 56,
                    fontWeight: FontWeight.bold),
              ),
              const Text('Sign into your account'),
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
                      hintStyle: TextStyle(color: Colors.grey),
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
                      hintStyle: const TextStyle(color: Colors.grey),
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
                height: 20,
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  const Text('Forgot your password ?')
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            AuthController.instance.login(emailController.text.trim(), passwordController.text.trim()); 
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 35),
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
                  "Sign in",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: w * 0.01),
        Center(
          child: RichText(
            text: TextSpan(
                text: "Don't have an account ?",
                style: TextStyle(color: Colors.grey[500], fontSize: 20),
                children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => SignUpPage()),
                      text: "Create",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))
                ]),
          ),
        )
      ]),
    );
  }
}
