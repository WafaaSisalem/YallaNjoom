import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/screens/parents_home_screen.dart';
import 'package:yalla_njoom/widgets/default_elevated_button.dart';
import '../routers/app_router.dart';
import '../screens/child_home_screen.dart';

class UserCodeDialog extends StatelessWidget {
  const UserCodeDialog({Key? key, required this.code, required this.isParent})
      : super(key: key);
  final bool isParent;
  final int code;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 325.w,
              height: 300.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: theme.primaryColor,
                  width: 3.0,
                ),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'انتبه',
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          color: Colors.red,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'الرمز الخاص بك',
                      style: theme.textTheme.headline2,
                    ),
                    Text(
                      code.toString(),
                      style: theme.textTheme.headline2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0.w),
                      child: SizedBox(
                        width: 180.w,
                        child: Text(
                          'احتفظ بالكود لتستطيع الدخول به مرة أخرى',
                          style: theme.textTheme.subtitle1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0.w),
                      child: DefaultElevatedButton(
                        top: 0,
                        child: Text(
                          'التالي',
                          style: theme.textTheme.headline3!
                              .copyWith(color: Colors.white),
                        ),
                        radius: 10.r,
                        onPressed: () {
                          if (isParent) {
                            AppRouter.router.pushNamedWithReplacementFunction(
                                ParentsHomeScreen.routeName);
                          } else {
                            AppRouter.router.pushNamedWithReplacementFunction(
                                ChildHomeScreen.routeName);
                          }
                        },
                        size: Size(178.w, 44.h),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 20.h,
                left: -30.w,
                child: Image.asset(
                  'assets/images/code_dialog.png',
                  width: 185.5.w,
                  height: 194.6.h,
                )),
          ],
        ),
      ),
    );
  }
}
