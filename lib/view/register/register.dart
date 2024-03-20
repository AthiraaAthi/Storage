import 'package:flutter/material.dart';
import 'package:practising_wrk/utils/color_constant/color_constant.dart';
import 'package:practising_wrk/view/home_screen/home_screen.dart';
import 'package:practising_wrk/view/login/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Register",
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text("Register")),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: ColorConstant.purple),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: ColorConstant.purple,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
