import 'package:flutter/material.dart';
import 'package:music_shuffle/components/home/playlist_card.dart';
import 'package:music_shuffle/config/constants.dart';

class PlaylistsView extends StatelessWidget {
  const PlaylistsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        iconTheme: IconThemeData(
          color: whiteColor, //change your color here
        ),
        title: Text(
          'Playlists',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: whiteColor,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return const PlaylistCard();
          }),
    );
  }
}
