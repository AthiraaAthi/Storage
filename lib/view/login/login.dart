import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/color_constant/color_constant.dart';
import '../home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                controller: emailController,
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
                controller: obscureText ? null : passController,
                obscureText: obscureText,
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
                  onPressed: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    final String Regemail = prefs.getString('email').toString();
                    final String Regpass = prefs.getString('pass').toString();
                    if (emailController.text.trim() == Regemail &&
                        passController.text.trim() == Regpass) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                      print(
                          "REISTERED EMAIL AND PASS ARE : ${await prefs.getString('email')} , ${await prefs.getString('pass')}");
                    }
                  },
                  child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
