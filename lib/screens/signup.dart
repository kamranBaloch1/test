import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview/server/provider.dart';
import 'package:interview/widgets/cusotm_textfield.dart';
import 'package:interview/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _cPassword = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _cPassword.dispose();
    super.dispose();
  }

  void registerUser() {
    String email = _email.text.trim();
    String password = _password.text.trim();

    final registrProvider =
        Provider.of<ProvidersMethods>(context, listen: false);
    registrProvider.registerWithEmailAndPasswordProvider(
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
              Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/img/boat.jpeg",
                    width: 150.w,
                    height: 150.h,
                  )),
              SizedBox(
                height: 50.h,
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
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length <8) {
                                return 'password must be more than 8 chars';
                              }
                              return null;
                            },
                            textController: _password,
                            icon: Icons.lock,
                            hintText: "Password"),
                        SizedBox(height: 25.h),
                        CustomTextField(
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value != _password.text.trim()) {
                                return 'password and confirm password are not same ';
                              }
                              return null;
                            },
                            textController: _cPassword,
                            icon: Icons.lock,
                            hintText: "Confirm password"),
                        SizedBox(height: 50.h),
                        CustomButton(
                          navigateToNextScreen: () {
                            if (_formKey.currentState!.validate()) {
                              registerUser();
                            }
                          },
                          text: "Sign Up",
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 70.h),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.all(15.w),
                  margin: EdgeInsets.only(left: 20.w),
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(30)),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30.sp,
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
