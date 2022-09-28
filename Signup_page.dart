import 'package:email_auth/email_auth.dart';
import 'package:final_year_project/auth_controller.dart';
import 'package:final_year_project/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup_page extends StatefulWidget {
  const Signup_page({Key? key}) : super(key: key);


  @override
  State<Signup_page> createState() => _Signup_pageState();
}

class _Signup_pageState extends State<Signup_page> {
  bool _isHidden = true;
  var emailcontroller= TextEditingController();
  var passwordcontroller= TextEditingController();
  var OTPcontroller= TextEditingController();
  var emailauth = EmailAuth(sessionName: "OTP");
  void sendOTP() async{
    bool res=await emailauth.sendOtp(recipientMail: emailcontroller.text);
    if(res){
        print("OTP Sent");
    }
    else{
      print("we could not send");
    }
  }
  // void verifyOPT(){
  //   var res= emailauth.validateOtp(recipientMail: emailcontroller.text, userOtp: OTPcontroller.text);
  //   if(res){
  //     AuthController.instance.register(emailcontroller.text.trim(), passwordcontroller.text.trim());
  //   }
  //   else{
  //     print("Invalid");
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //first container
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              child: Column(
                children: [
                  Icon(
                    Icons.calendar_month_rounded,
                    size: 100,
                  ),
                  // CircleAvatar(
                  //   radius: 50.0,
                  //   backgroundImage: AssetImage('images/Logo.jpg'),
                  // ),
                  Text(
                    'Meeting Scheduler',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'For Students & Lecturers',
                    style: TextStyle(
                      fontFamily: 'RubikMoonrocks',
                      fontSize: 15.0,
                      letterSpacing: 2.5,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            //second container
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                    child: TextField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:
                            BorderSide(color: Colors.white, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            )),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        hintText: 'Email',
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        suffixIcon: IconButton(
                          onPressed:()=> sendOTP(),
                          icon: Icon(Icons.send),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                    child: TextField(
                      controller: passwordcontroller,
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:
                            BorderSide(color: Colors.white, width: 1.0)),

                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            )),

                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                        prefixIcon: Icon(
                          Icons.key,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        suffixIcon: IconButton(
                          onPressed: _togglePasswordView,
                          icon: Icon(_isHidden ? Icons.visibility : Icons.visibility_off,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //OTP
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                    child: TextField(
                      controller: OTPcontroller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:
                            BorderSide(color: Colors.white, width: 1.0)),

                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            )),

                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        prefixIcon: Icon(
                          Icons.numbers,
                          color: Colors.grey,
                        ),
                        hintText: 'OTP Code',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Text(
                        'Forgotten Password?',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //Third container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: (){
                  var res= emailauth.validateOtp(recipientMail: emailcontroller.text, userOtp: OTPcontroller.text);
                  if(res){
                    if(emailcontroller.text == null || passwordcontroller.text == null){
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Invalid Input'),
                          content: const Text('Please Fill All TextField'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                    else{
                      AuthController.instance.register(emailcontroller.text.trim(), passwordcontroller.text.trim());
                    }
                  }
                  else{
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Invalid Email'),
                        content: const Text('Please provide the valid email'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color(0XFF15B3C2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: w * 0.2,
            ),
            RichText(
                text: TextSpan(
                    text: "Do you have an account?",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                          text: " Sign In",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(() => login_page()))
                    ]))
          ],
        ),
      ),
    );
  }
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}

