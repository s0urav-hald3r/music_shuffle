import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_shuffle/components/home/big_platform_card.dart';
import 'package:music_shuffle/config/constants.dart';

class ManagePlatformView extends StatelessWidget {
  const ManagePlatformView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        iconTheme: IconThemeData(
          color: whiteColor, //change your color here
        ),
        title: Text(
          'Manage Platforms',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: whiteColor,
          ),
        ),
      ),
      body: Column(children: [
        BigPlatformCard(
          icon: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.transparent,
            child: SvgPicture.asset(spotifyPlatform),
          ),
          title: 'Spotify',
          description:
              'Add Spotify Music to effortlessly transfer your playlists across other platforms',
          callBack: () {},
        ),
        Divider(height: 0, thickness: .25, color: whiteColor, indent: 100),
        BigPlatformCard(
          icon: CircleAvatar(
            radius: 32,
            backgroundColor: whiteColor,
            child: SvgPicture.asset(applePlatform),
          ),
          title: 'Apple Music',
          description:
              'Add Spotify Music to effortlessly transfer your playlists across other platforms',
          callBack: () {},
        ),
        Divider(height: 0, thickness: .25, color: whiteColor, indent: 100),
        BigPlatformCard(
          icon: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.transparent,
            child: SvgPicture.asset(youtubePlatform),
          ),
          title: 'Youtube Music',
          description:
              'Add Spotify Music to effortlessly transfer your playlists across other platforms',
          callBack: () {},
        ),
        Divider(height: 0, thickness: .25, color: whiteColor, indent: 100),
        BigPlatformCard(
          icon: CircleAvatar(
            radius: 32,
            backgroundColor: const Color(0xFF25D2D9),
            child: SvgPicture.asset(amazonePlatform),
          ),
          title: 'Amazone Music',
          description:
              'Add Spotify Music to effortlessly transfer your playlists across other platforms',
          callBack: () {},
        ),
      ]),
    );
  }
}
