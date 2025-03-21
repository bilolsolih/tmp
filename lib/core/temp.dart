import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';




class Temp extends StatelessWidget {
  const Temp({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Builder(
                builder: (context) {
                  return const Placeholder();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class MaknunMen extends StatelessWidget {
  const MaknunMen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

