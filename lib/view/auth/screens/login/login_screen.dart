import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../res/app_constants.dart';
import '../../../../res/text_widget.dart';
import '../../../../viewModel/auth_view_model.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(body: Consumer(builder: (context, ref, child) {
      final viewModel = ref.watch(auth);
      return ScreenUtilInit(
          // designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return Form(
              key: _formkey,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 40.w),

                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Image.asset(
                    'assets/images/login.png',
                    height: 100.h,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextUtils(
                    text: 'Login',
                    fontFamily: 'Tajawal',
                    align: TextAlign.center,
                    color: AppConstants.orange,
                    fontWeight: FontWeight.w500,
                    fontSize: 28.sp,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextUtils(
                    text: 'Email',
                    fontFamily: 'Tajawal',
                    fontSize: 18.sp,
                    color: AppConstants.grey,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    // textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailcontroller,
                    validator: (value) =>
                        value!.isEmpty ? 'enter a valid email' : null,

                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppConstants.blue,
                    ),
                    //This will obscure text dynamically
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8.h),
                      // Here is key idea
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppConstants.blue),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppConstants.blue),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppConstants.orange),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppConstants.orange),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextUtils(
                    text: 'Password',
                    fontFamily: 'Tajawal',
                    fontSize: 18.sp,
                    color: AppConstants.grey,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordcontroller,
                    obscureText: !_passwordVisible,

                    validator: (value) =>
                        value!.isEmpty ? 'enter a valid password' : null,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppConstants.blue,
                    ),
                    //This will obscure text dynamically
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppConstants.grey, size: 20.h,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      contentPadding: EdgeInsets.all(8.h),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppConstants.blue),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppConstants.blue),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppConstants.orange),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppConstants.orange),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                      width: size.width * .6,
                      height: 35.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(2.h),
                            backgroundColor: AppConstants.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              viewModel.setLogin(
                                _emailcontroller.text,
                                _passwordcontroller.text,
                                context,
                              );
                            }
                          },
                          child: TextUtils(
                            text: 'Login',
                            color: Colors.white,
                            // fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ))),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        text: "Don't have an account?",
                        fontSize: 15.sp,
                        align: TextAlign.center,
                        color: AppConstants.grey,
                        fontWeight: FontWeight.w700,
                      ),
                      TextButton(
                          onPressed: () {
                            print('preesssssss');
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                          },
                          child: TextUtils(
                            text: 'Register',
                            fontFamily: 'Tajawal',
                            fontSize: 20.sp,
                            align: TextAlign.center,
                            color: AppConstants.orange,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ],
              ),
            );
          });
    }));
  }
}
