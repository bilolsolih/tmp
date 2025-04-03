import 'package:flutter/material.dart';

class CompleteProfileDescription extends StatelessWidget {
  const CompleteProfileDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Complete Your Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam.",
          style: TextStyle(fontSize: 13),
        ),
      ],
    );
  }
}
