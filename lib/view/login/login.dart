import 'package:flutter/material.dart';

import '../../utils/color_constant/color_constant.dart';
import '../home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Text(
                "Login",
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w500,
                    color: ColorConstant.purple),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    fillColor: ColorConstant.defPurple.withOpacity(0.3),
                    filled: true,
                    hintText: "Enter Your Email",
                    hintStyle: TextStyle(color: ColorConstant.purple),
                    prefixIcon: Icon(
                      Icons.mail,
                      size: 25,
                      color: ColorConstant.purple,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorConstant.defPurple,
                          width: 50,
                        ),
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    fillColor: ColorConstant.defPurple.withOpacity(0.3),
                    filled: true,
                    hintText: "Enter Your password",
                    hintStyle: TextStyle(color: ColorConstant.purple),
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(
                        obscureText
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                        size: 25,
                        color: ColorConstant.purple,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorConstant.defPurple,
                          width: 50,
                        ),
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(ColorConstant.purple)),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                  child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
