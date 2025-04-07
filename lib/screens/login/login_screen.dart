import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/ui_helper.dart';

import '../otp/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  String? selectedCode = '+91';
  @override
  Widget build(BuildContext context) {
    final List<String> countryCodes = ['+1', '+44', '+91', '+61', '+81'];
    final countryCodeListItems =
        countryCodes.map((countryCode) {
          return DropdownMenuItem(value: countryCode, child: Text(countryCode));
        }).toList();
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.customTextStyle(
                text: 'Enter your phone number',
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 20),
              UiHelper.customTextStyle(
                text:
                    'WhatsApp will need to verify your phone number. Carrier charges may apply.',
                fontSize: 14,
                maxLines: 2,
                textAlign: TextAlign.center,
                color: Colors.grey,
              ),
              UiHelper.customTextStyle(
                text: 'What’s my number?',
                fontSize: 14,
                textAlign: TextAlign.center,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 20),
              // country code dropdwon
              DropdownButtonFormField(
                items: countryCodeListItems,
                value: selectedCode,
                onChanged: (value) {
                  setState(() {
                    selectedCode = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              // phone number text field
              Row(
                children: [
                  // country code text field
                  SizedBox(
                    width: 100,
                    child: TextField(
                      readOnly: true,

                      controller: TextEditingController(text: selectedCode),
                      decoration: InputDecoration(hintText: selectedCode),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: 'Phone Number'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: UiHelper.customButton(
        context: context,
        callback: () {
          login(phoneController.text.toString());
        },
        title: 'Next',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  login(String phonenumber) {
    if (phonenumber == "") {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Enter Phone Number"),
          backgroundColor: Color(0XFF00A884),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPScreen(phoneNumber: phonenumber),
        ),
      );
    }
  }
}
