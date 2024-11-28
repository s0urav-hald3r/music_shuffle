import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_shuffle/components/onboarding/platform_card.dart';
import 'package:music_shuffle/config/constants.dart';

class SelectPlatform extends StatelessWidget {
  const SelectPlatform({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF1E1E1E),
            ),
            child: Column(children: [
              PlatformCard(
                icon: spotifyIcon,
                title: 'Spotify',
                callBack: () {},
              ),
              Divider(height: 0, thickness: .25, color: whiteColor),
              PlatformCard(
                icon: appleIcon,
                title: 'Apple Music',
                callBack: () {},
              ),
              Divider(height: 0, thickness: .25, color: whiteColor),
              PlatformCard(
                icon: youtubeIcon,
                title: 'Youtube Music',
                callBack: () {},
              ),
              Divider(height: 0, thickness: .25, color: whiteColor),
              PlatformCard(
                icon: amazoneIcon,
                title: 'Amazone Music',
                callBack: () {},
              )
            ]),
          )
        ]),
      )),
    );
  }
}
