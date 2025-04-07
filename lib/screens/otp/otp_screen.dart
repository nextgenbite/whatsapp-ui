import 'package:flutter/material.dart';

import '../../widgets/ui_helper.dart';
import '../profile/profile_screen.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({required this.phoneNumber, super.key});
  final String phoneNumber;
  final TextEditingController otp1Controller = TextEditingController();
  final TextEditingController otp2Controller = TextEditingController();
  final TextEditingController otp3Controller = TextEditingController();
  final TextEditingController otp4Controller = TextEditingController();
  final TextEditingController otp5Controller = TextEditingController();
  final TextEditingController otp6Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80),
            UiHelper.customTextStyle(
              text: "Verifying your number",
              fontSize: 20,
              color: const Color(0XFF00A884),
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 30),
            UiHelper.customTextStyle(
              text: "You've tried to register +91$phoneNumber",
              fontSize: 15,
            ),
            UiHelper.customTextStyle(
              text: "recently. Wait before requesting an sms or a call",
              fontSize: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.customTextStyle(
                  text: "with your code. ",
                  fontSize: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: UiHelper.customTextStyle(
                    text: "Wrong number?",
                    fontSize: 15,
                    color: const Color(0XFF00A884),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.customContainer(otp1Controller),
                const SizedBox(width: 10),
                UiHelper.customContainer(otp2Controller),
                const SizedBox(width: 10),
                UiHelper.customContainer(otp3Controller),
                const SizedBox(width: 10),
                UiHelper.customContainer(otp4Controller),
                const SizedBox(width: 10),
                UiHelper.customContainer(otp5Controller),
                const SizedBox(width: 10),
                UiHelper.customContainer(otp6Controller),
              ],
            ),
            const SizedBox(height: 30),
            UiHelper.customTextStyle(
              text: "Didn’t receive code?",
              fontSize: 14,
              color: const Color(0XFF00A884),
            ),
          ],
        ),
      ),
      floatingActionButton: UiHelper.customButton(
        context: context,
        callback: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
        },
        title: "Next",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
