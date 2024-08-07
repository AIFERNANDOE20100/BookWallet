import 'package:book_wallert/colors.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.navigationBarColor,
        title: const Text(
          'Test Screens',
          style: TextStyle(color: MyColors.text2Color),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(8, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context,
                      '/screen${index + 1}'); // routing button to go to relavent screen.
                },
                child: Text('Screen ${index + 1}'),
              ),
            );
          }),
        ),
      ),
    );
  }
}
