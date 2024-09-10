import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:white_matrix_ecommerce/utils/widgets/custom_bottom_bar.dart';

class ScreenOtpVerification extends StatefulWidget {
  const ScreenOtpVerification({super.key});

  @override
  _ScreenOtpVerificationState createState() => _ScreenOtpVerificationState();
}

class _ScreenOtpVerificationState extends State<ScreenOtpVerification> {
  final TextEditingController _otpController = TextEditingController();

  _fnNavigateToHomePage() async {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
        builder: (context) => const CustomBottomBar(),
        settings: const RouteSettings(name: '/home'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Image.asset("assets/icons/otp.png"),
            const Text('Verification',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                )),
            const Text(
                'Enter the 6 digit verification code sent to your phone number',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                )),
            const SizedBox(height: 30),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                hintText: 'Enter 6-digit OTP',
                counterText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[800],
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your OTP verification logic here
                String otp = _otpController.text;
                if (otp.length == 6) {
                  // Do something with the OTP
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('OTP Verified'),
                  ));
                  _fnNavigateToHomePage();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.grey,
                    content: Text('Invalid OTP'),
                  ));
                }
              },
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
