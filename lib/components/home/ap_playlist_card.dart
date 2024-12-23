import 'package:flutter/material.dart';
import 'package:music_shuffle/config/constants.dart';
import 'package:music_shuffle/config/navigator_key.dart';
import 'package:music_shuffle/views/home/songs_view.dart';

class ApPlaylistCard extends StatelessWidget {
  const ApPlaylistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigatorKey.push(const SongsView());
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: Row(children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.none,
            child: Image.asset(albumArt),
          ),
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Hip-Hop Workout',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: whiteColor,
                ),
              ),
              Text(
                '25 Songs',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: const Color(0xFFEBEBF5).withOpacity(.6),
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
