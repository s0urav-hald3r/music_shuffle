import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:music_shuffle/config/constants.dart';
import 'package:music_shuffle/config/navigator_key.dart';
import 'package:music_shuffle/controllers/youtube_controller.dart';
import 'package:music_shuffle/utils/extension.dart';
import 'package:music_shuffle/views/home/custom_navbar.dart';
import 'package:music_shuffle/views/home/manage_platform_view.dart';
import 'package:music_shuffle/views/home/settings_view.dart';
import 'package:music_shuffle/views/home/transferred_view.dart';
import 'package:music_shuffle/views/premium_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            Container(
              height: 34,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        NavigatorKey.push(const SettingsView());
                      },
                      child: SvgPicture.asset(settingsIcon),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: InkWell(
                onTap: () {
                  NavigatorKey.push(const PremiumView());
                },
                child: Image.asset(premiumBanner),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Platforms',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: whiteColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        NavigatorKey.push(const ManagePlatformView());
                      },
                      child: const Text(
                        'Manage',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFAE6AEA),
                        ),
                      ),
                    ),
                  ]),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 100.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFF00D95F),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.transparent,
                                  child: SvgPicture.asset(spotifySvg),
                                ),
                                Text(
                                  'Spotify',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: blackColor,
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFA233B), Color(0xFFFB5C74)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 44,
                                height: 44,
                                child: SvgPicture.asset(appleSvg),
                              ),
                              Text(
                                'Apple Music',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: whiteColor,
                                ),
                              )
                            ]),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(height: 10),
                Obx(() {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (YoutubeController.instance.isConnected) {
                              NavigatorKey.push(CustomNavbar(index: 2));
                            } else {
                              YoutubeController.instance.authentication();
                            }
                          },
                          child: Container(
                            height: 100.h,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 22,
                                        child: Image.asset(youtubeImage),
                                      ),
                                      if (YoutubeController
                                          .instance.isConnected)
                                        SvgPicture.asset(link),
                                    ],
                                  ),
                                  Text(
                                    'Youtube Music',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: blackColor,
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 100.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFF25D2D9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 22,
                                  child: SvgPicture.asset(amazoneSvg),
                                ),
                                Text(
                                  'Amazone Music',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: blackColor,
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ]),
                  );
                }),
              ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 54,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: const Color(0xFF6F7278).withOpacity(.24),
                border: Border.all(color: const Color(0xFF3A3A3C), width: 0.5),
              ),
              child: ElevatedButton(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SvgPicture.asset(transfer),
                  const SizedBox(width: 12),
                  Text(
                    'Transferred Playlist ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: whiteColor.withOpacity(.6),
                    ),
                  ),
                ]),
                onPressed: () {
                  NavigatorKey.push(const TransferredView());
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
