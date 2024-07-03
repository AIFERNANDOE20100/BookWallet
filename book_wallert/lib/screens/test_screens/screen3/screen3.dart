import 'package:flutter/material.dart';
import 'package:book_wallert/colors.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // replace with your screen
      backgroundColor: MyColors.bgColor,
      body: Center(
        child: Text(
          'a test screen3',
          style: TextStyle(color: MyColors.text2Color),
        ),
      ),
    );
  }
}
