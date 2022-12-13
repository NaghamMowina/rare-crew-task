import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rare_task/view/auth/screens/login/login_screen.dart';
import 'package:rare_task/viewModel/auth_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final viewModel = ref.watch(auth);
      return ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/prof.png'),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        Card(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.email),
                        )),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            viewModel.email!,
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          viewModel.logOut(context);
                        },
                        child: Icon(
                          Icons.logout,
                          size: 35,
                        ))
                  ],
                ),
              ),
            );
          });
    });
  }
}
