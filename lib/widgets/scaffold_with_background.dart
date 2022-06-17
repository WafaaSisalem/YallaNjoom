import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScaffoldWithBackground extends StatelessWidget {
  const ScaffoldWithBackground(
      {Key? key,
      required this.body,
      this.drawer = const Drawer(),
      this.appBarIsVisible = false,
      // ignore: avoid_init_to_null
      this.floatingActionButton = null})
      : super(key: key);
  final Widget body;
  final Drawer? drawer;
  final bool appBarIsVisible;
  final Widget? floatingActionButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            floatingActionButton: Padding(
              padding: EdgeInsets.only(left: 15.w, bottom: 30.h),
              child: floatingActionButton,
            ),
            drawer: drawer,
            appBar: appBarIsVisible
                ? AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    iconTheme: IconThemeData(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : null,
            backgroundColor: Colors.transparent,
            body: body,
            resizeToAvoidBottomInset: false,
          ),
        ),
      ),
    );
  }
}
