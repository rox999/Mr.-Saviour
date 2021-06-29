import 'package:flutter/material.dart';
import 'package:mr_saviour/screens/authenticateScreen/otp_verification_page.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(25.0),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/registerBackground.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          Center(
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/otp.jpg'),
                    radius: 130,
                  ),
                  Card(
                    elevation: 2.0,
                    color: Color(0xfff3f6f3),
                    margin: EdgeInsets.all(25.0),
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            'Enter your mobile no. We will send OTP to you',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                                icon: Text(
                                  "+91",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(color: Color.fromRGBO(129,199,169, 0.7), width: 2.0),
                                ),
                               ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(14.0) ),
                            elevation: 0.5,
                            color: Color.fromRGBO(229,243,234, 0.1),
                            child: Text('Send otp',
                            ),
                            onPressed: () {
                              Future((){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>OtpCodeVerificationScreen(phoneNumber:"+91"+phoneController.text)));
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//#80c7a7 - cyan 229 243 234
//#e5f3ea - greenishWhite
