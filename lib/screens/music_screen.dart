import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/firestore_provider.dart';
import '../routers/app_router.dart';
import '../widgets/container_with_image.dart';
import '../widgets/default_circular_avatar.dart';
import 'letters_screen.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({Key? key}) : super(key: key);
  static String routeName = 'MusicScreen';
  @override
  Widget build(BuildContext context) {
    return Consumer<FirestoreProvider>(
      builder: (context, provider, x) => Scaffold(
        body: ContainerWithImage(
          imageName: 'assets/images/background_examples.png',
          children: [
            SizedBox(
              height: 20.h,
            ),
            DefaultCirculeAvatar(
              onTap: () async {
                await provider.audioPlayer.stop();
                await provider.setIsSongPlaying(false);
                AppRouter.router
                    .pushNamedWithReplacementFunction(LettersScreen.routeName);
              },
            ),
            SizedBox(
              height: 200.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 43.w),
              child: Row(
                children: [
                  Image.asset('assets/images/food.png'),
                  Image.asset(
                    'assets/images/ألف.png',
                    color: Colors.white,
                  ), // we will take from selected letter that on the provider
                ],
              ),
            ),
            Center(
                child: GestureDetector(
              child: Image.asset('assets/images/left.png'),
              onTap: () async {
                await provider.playAudio(isSound: false);
              },
            )),
          ],
        ),
      ),
    );
  }
}
