import 'package:fadingpageview/fadingpageview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_shuffle/config/constants.dart';
import 'package:music_shuffle/config/navigator_key.dart';
import 'package:music_shuffle/controllers/onboarding_controller.dart';
import 'package:music_shuffle/views/home/home_view.dart';
import 'package:music_shuffle/views/onboarding/select_platform.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  FadingPageViewController pageController = FadingPageViewController(0, 4);
  final controller = OnboardingController.instance;

  DateTime? lTapTime;

  final contentBody = [
    {
      'title': 'Playlist Transfer',
      'description':
          'Effortlessly transfer your playlists between your favorite music platforms!'
    },
    {
      'title': 'Across any platform',
      'description':
          'Experience the freedom of accessing your favorite tunes on your preferred service.'
    },
    {
      'title': 'Easily transfer',
      'description':
          'Easily transfer your playlists across any platform and enjoy your music wherever you go!'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [_buildPageView(), _buildContent()]),
      ),
    );
  }

  Widget _buildPageView() {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: FadingPageView(
          controller: pageController,
          disableWhileAnimating: true,
          fadeInDuration: const Duration(milliseconds: 250),
          fadeOutDuration: const Duration(milliseconds: 250),
          itemBuilder: (context, itemIndex) {
            return [
              Stack(children: [
                Image.asset(onboardingOneImage),
                Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, blackColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.3, 0.7],
                    ),
                  ),
                ),
              ]),
              SizedBox(
                width: size.width,
                height: size.height,
                child: Stack(
                  children: [
                    Positioned(
                      left: -size.width / 3,
                      top: -size.width / 3,
                      child: Container(
                        width: size.width * 1.1,
                        height: size.width * 1.1,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(colors: [
                            const Color(0xFF5016DF).withOpacity(.25),
                            blackColor
                          ], stops: const [
                            0.001,
                            0.999
                          ]),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Column(children: [
                        Image.asset(onboardingTwoImage),
                      ]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.height,
                child: Stack(children: [
                  Positioned(
                    left: -size.width / 3,
                    top: -size.width / 3,
                    child: Container(
                      width: size.width * 1.1,
                      height: size.width * 1.1,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(colors: [
                          const Color(0xFF5016DF).withOpacity(.25),
                          blackColor
                        ], stops: const [
                          0.001,
                          0.999
                        ]),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Column(children: [
                      Image.asset(onboardingThreeImage),
                    ]),
                  ),
                ]),
              ),
              const SelectPlatform(),
            ][itemIndex];
          }),
    );
  }

  Widget _buildContent() {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: MediaQuery.of(context).size.width,
        child: Obx(
          () => Column(children: [
            if (controller.index < 3)
              Column(children: [
                Text(
                  contentBody[controller.index]['title']!,
                  style: TextStyle(
                    fontSize: 36,
                    color: whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  contentBody[controller.index]['description']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: whiteColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 46,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.index == index
                              ? whiteColor
                              : whiteColor.withOpacity(.4),
                        ),
                      );
                    }),
                  ),
                ),
              ]),
            SafeArea(
              top: false,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 52,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: elevated,
                ),
                child: ElevatedButton(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: whiteColor,
                    ),
                  ),
                  onPressed: () {
                    final cTime = DateTime.now();
                    if (lTapTime == null ||
                        cTime.difference(lTapTime!) >
                            const Duration(milliseconds: 500)) {
                      lTapTime = cTime;
                      // Your button action here
                      debugPrint("Button tapped");
                    } else {
                      debugPrint("Double tap detected - ignored");
                      return;
                    }

                    if (controller.index < 3) {
                      controller.index++;

                      pageController.next();
                    } else {
                      NavigatorKey.pushReplacement(const HomeView());
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 30)
          ]),
        ),
      ),
    );
  }
}
