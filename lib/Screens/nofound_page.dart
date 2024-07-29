import 'package:flutter/material.dart';

class NofoundPage extends StatelessWidget {
  const NofoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Untitled-1 2.png'),
            const Text(
              'NO LEAD FOUND',
              style: TextStyle(
                  color: Color.fromRGBO(62, 102, 205, 1), fontSize: 18),
            ),
            Text(
              'We Cannot Find the Leads',
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
