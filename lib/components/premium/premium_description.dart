import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_shuffle/config/constants.dart';

class PremiumDescription extends StatelessWidget {
  const PremiumDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: Column(children: [
        Row(children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFFC4227D).withOpacity(.2),
            child: SvgPicture.asset(premium1),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 270,
            child: Text('Quickly transfer unlimited playlists and 100+ songs.',
                style: TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                )),
          )
        ]),
        const SizedBox(height: 16),
        Row(children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFFC4227D).withOpacity(.2),
            child: SvgPicture.asset(premium2),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 270,
            child:
                Text('Enjoy all your music collections  without Advertainment.',
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    )),
          )
        ]),
        const SizedBox(height: 16),
        Row(children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFFC4227D).withOpacity(.2),
            child: SvgPicture.asset(premium3),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 270,
            child: Text(
                'Transfer your playlists between all your favorite music platforms.',
                style: TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                )),
          )
        ]),
      ]),
    );
  }
}
