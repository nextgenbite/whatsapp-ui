import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/ui_helper.dart';

import '../login/login_screen.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 125,
              backgroundImage: AssetImage('assets/images/boarding.png'),
            ),
            SizedBox(height: 20),
            UiHelper.customTextStyle(
              text: 'Welcome to WhatsApp',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.customTextStyle(text: 'Read our ', fontSize: 14),
                UiHelper.customTextStyle(
                  text: 'Privacy Policy',
                  fontSize: 14,
                  color: Colors.blue,
                ),
                UiHelper.customTextStyle(
                  text: '. Tap “Agree and continue”',
                  fontSize: 14,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.customTextStyle(text: 'to accept the ', fontSize: 14),
                UiHelper.customTextStyle(
                  text: 'Teams of Service',
                  fontSize: 14,
                  color: Colors.blue,
                ),
                UiHelper.customTextStyle(text: '.', fontSize: 14),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: UiHelper.customButton(
        context: context,
        callback: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        title: 'AGREE AND CONTINUE',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
