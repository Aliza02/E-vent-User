import 'package:get/get.dart';
import 'package:otp/otp.dart';
import 'package:http/http.dart' as http;

import '../controllers/signup_controller.dart';
import '../firebaseMethods/userAuthentication.dart';
import 'dart:convert';

final signupcontroller = Get.put(SignupController());

void generateOtp() {
  final userKey = auth.currentUser?.uid;
  signupcontroller.OTPCode.value = OTP.generateTOTPCodeString(
      userKey.toString(), DateTime.now().millisecondsSinceEpoch,
      interval: signupcontroller.secondsRemainingforOtp.value,
      algorithm: Algorithm.SHA512);
}

void sendOTP() {
  generateOtp();

  sendEmail(
    email: signupcontroller.emailController.text,
    message: signupcontroller.OTPCode.value,
    subject: 'OTP Verification',
  );
}

Future sendEmail(
    {required String email,
    required String subject,
    required String message}) async {
  const serviceId = 'service_hyta9ug';
  const templateId = 'template_msvsubc';
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(
    url,
    headers: {
      'origin': 'http://localhost',
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': 'NDyE00Tk9HPhXioxy',
      'accessToken': 'CGiWPCJQEM0VHqHeIW4y6',
      'template_params': {
        'to_email': email,
        'user_subject': subject,
        'message': message,
      },
    }),
  );
  print(response.body);
}
