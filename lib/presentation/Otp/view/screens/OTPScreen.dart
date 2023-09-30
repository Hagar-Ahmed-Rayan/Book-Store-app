import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  final List<TextEditingController> otpControllers = List.generate(6, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter the verification code',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) => buildOtpTextField(index)),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String otp = otpControllers.map((controller) => controller.text).join();
                print('Entered OTP: $otp');
              },
              child: Text('Verify'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Resend OTP logic here
              },
              child: Text('Resend OTP'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOtpTextField(int index) {
    return Container(
      width: 50.0,
      height: 50.0,
      child: TextField(
        controller: otpControllers[index],
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(fontSize: 24.0),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}