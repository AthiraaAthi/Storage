import 'package:flutter/material.dart';
import 'package:practising_wrk/utils/color_constant/color_constant.dart';
import 'package:practising_wrk/view/home_screen/home_screen.dart';
import 'package:practising_wrk/view/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureTextt = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisSize: MainAxisSize.min,
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
                        // borderSide: BorderSide(
                        //   color: ColorConstant.defPurple,
                        // ),
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: obscureTextt ? null : passController, //awww myselff
                obscureText: obscureTextt,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    fillColor: ColorConstant.defPurple.withOpacity(0.3),
                    filled: true,
                    hintText: "Enter Your password",
                    hintStyle: TextStyle(color: ColorConstant.purple),
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureTextt = !obscureTextt;
                        });
                      },
                      icon: Icon(
                        obscureTextt ? Icons.visibility_off : Icons.visibility,
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
                    // Obtain shared preferences.
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    if (emailController.text.trim().isNotEmpty &&
                        passController.text.trim().isNotEmpty) {
                      await prefs.setString(
                          'email', emailController.text.trim());
                      await prefs.setString('pass', passController.text.trim());

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Enter a valid username & password")));
                    }
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
    );
  }
}
