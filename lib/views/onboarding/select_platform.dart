import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:music_shuffle/components/onboarding/platform_card.dart';
import 'package:music_shuffle/config/constants.dart';
import 'package:music_shuffle/controllers/spotify_controller.dart';
import 'package:music_shuffle/controllers/youtube_controller.dart';

class SelectPlatform extends StatelessWidget {
  const SelectPlatform({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
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
                child: SizedBox(
              width: size.width,
              height: size.height,
              child: Column(children: [
                const SizedBox(height: 20),
                Container(
                  width: size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(vectorLogo),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Playlist Transfer Service',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 36,
                              color: whiteColor,
                            ),
                          ),
                        ),
                        const Text(
                          'Grant access to your music library so we can seamlessly arrange your playlists.',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xFFAEAEAE),
                          ),
                        )
                      ]),
                ),
                Obx(() {
                  return Container(
                    width: size.width,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF1E1E1E),
                    ),
                    child: Column(children: [
                      PlatformCard(
                        icon: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.transparent,
                          child: SvgPicture.asset(spotifyPlatform),
                        ),
                        title: 'Spotify',
                        action: SpotifyController.instance.isConnecting
                            ? SizedBox(
                                width: 32,
                                height: 32,
                                child: CupertinoActivityIndicator(
                                  color: whiteColor,
                                ),
                              )
                            : SpotifyController.instance.isConnected
                                ? const SizedBox.shrink()
                                : InkWell(
                                    onTap: () {
                                      SpotifyController.instance
                                          .authentication();
                                    },
                                    child: Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: whiteColor),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(addIcon,
                                            color: whiteColor),
                                      ),
                                    ),
                                  ),
                      ),
                      Divider(height: 0, thickness: .25, color: whiteColor),
                      PlatformCard(
                        icon: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(appleImage),
                        ),
                        title: 'Apple Music',
                        action: false
                            ? SizedBox(
                                width: 32,
                                height: 32,
                                child: CupertinoActivityIndicator(
                                  color: whiteColor,
                                ),
                              )
                            : InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: whiteColor),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(addIcon,
                                        color: whiteColor),
                                  ),
                                ),
                              ),
                      ),
                      Divider(height: 0, thickness: .25, color: whiteColor),
                      PlatformCard(
                        icon: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(youtubeImage),
                        ),
                        title: 'Youtube Music',
                        action: YoutubeController.instance.isConnecting
                            ? SizedBox(
                                width: 32,
                                height: 32,
                                child: CupertinoActivityIndicator(
                                  color: whiteColor,
                                ),
                              )
                            : YoutubeController.instance.isConnected
                                ? const SizedBox.shrink()
                                : InkWell(
                                    onTap: () {
                                      YoutubeController.instance
                                          .authentication();
                                    },
                                    child: Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: whiteColor),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(addIcon,
                                            color: whiteColor),
                                      ),
                                    ),
                                  ),
                      ),
                      Divider(height: 0, thickness: .25, color: whiteColor),
                      PlatformCard(
                        icon: CircleAvatar(
                          radius: 24,
                          backgroundColor: const Color(0xFF25D2D9),
                          child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.transparent,
                              child: SvgPicture.asset(amazonePlatform)),
                        ),
                        title: 'Amazone Music',
                        action: false
                            ? SizedBox(
                                width: 32,
                                height: 32,
                                child: CupertinoActivityIndicator(
                                  color: whiteColor,
                                ),
                              )
                            : InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: whiteColor),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(addIcon,
                                        color: whiteColor),
                                  ),
                                ),
                              ),
                      )
                    ]),
                  );
                })
              ]),
            )),
          ],
        ),
      ),
    );
  }
}
