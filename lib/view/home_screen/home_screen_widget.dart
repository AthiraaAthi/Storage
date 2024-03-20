import 'package:flutter/material.dart';
import 'package:practising_wrk/utils/color_constant/color_constant.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 100,
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            name,
            style: TextStyle(color: ColorConstant.purple, fontSize: 20),
          ))
        ],
      ),
    );
  }
}
