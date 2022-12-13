import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rare_task/res/text_widget.dart';

import 'add_item_widget.dart';

class EmptyWidget extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController subtitleController;
  const EmptyWidget(
      {super.key,
      required this.titleController,
      required this.subtitleController});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: LottieBuilder.asset(
                  'assets/json/empty.json',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                child: TextUtils(
                  text: 'No Items Yet',
                  align: TextAlign.center,
                  fontSize: 25.sp,
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AddItemWidget(
                          title: titleController,
                          subtitle: subtitleController,
                        );
                      });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 30,
                    )),
              )
            ],
          );
        });
  }
}
