import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview/screens/signup.dart';
import 'package:interview/server/provider.dart';
import 'package:interview/widgets/cusotm_textfield.dart';
import 'package:interview/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  void loginUser() {
    String email = _email.text.trim();
    String password = _password.text.trim();

    final loginProvider = Provider.of<ProvidersMethods>(context, listen: false);

    loginProvider.loginWithEmailAndPasswordProvider(
        email: email, password: password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 222, 250),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/img/boat.jpeg",
                    width: 150.w,
                    height: 150.h,
                  )),
              SizedBox(
                height: 70.h,
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(200.r),
                      topRight: Radius.zero,
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r), // adjust as needed
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Center(
                          child: ClipOval(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.transparent,
                              child: Image.asset(
                                "assets/img/user2.png",
                                fit: BoxFit.cover,
                                width: 100.w,
                                height: 100.h,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50.h),
                        CustomTextField(
                            validator: (value) {
                              return RegExp(
                                          // Regular expression to validate email
                                          r"[a-z0-9!#%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                      .hasMatch(value!)
                                  ? null
                                  : "Please enter a valid email address";
                            },
                            textController: _email,
                            icon: Icons.email,
                            hintText: "Email"),
                        SizedBox(height: 25.h),
                        CustomTextField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            textController: _password,
                            icon: Icons.lock,
                            hintText: "Password"),
                        Container(
                          margin: EdgeInsets.only(top: 20.h),
                          alignment: Alignment.topRight,
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.sp),
                          ),
                        ),
                        SizedBox(height: 50.h),
                        CustomButton(
                          navigateToNextScreen: () {
                           if(_formKey.currentState!.validate()){
                             loginUser();

                           }
                          },
                          text: "Login",
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 70.h),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){
                    Get.to(const SignupScreen());
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
