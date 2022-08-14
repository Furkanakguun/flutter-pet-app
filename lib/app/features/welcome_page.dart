import 'package:flutter/material.dart';
import 'package:petapp/app/features/login/controller/auth_controller.dart';

class WelcomePage extends StatelessWidget {
   String email;
   WelcomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          width: w,
          height: h * 0.3,
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage("assets/img/loginimg.png"),
          //       fit: BoxFit.cover),
          // ),
          // child: Column(children: [
          //   SizedBox(
          //     height: h * 0.14,
          //   ),
          //   const CircleAvatar(
          //     radius: 60,
          //     backgroundColor: Colors.white,
          //   )
          // ]),
        ),
        const SizedBox(
          height: 70,
        ),
        Container(
          width: w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const Text(
                'Welcome',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                email,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
        SizedBox(height: 200,),
        GestureDetector(
          onTap: (){
            AuthController.instance.logout();
          },
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
                "Sign out",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(height: h * 0.08),
      ]),
    );
  }
}
