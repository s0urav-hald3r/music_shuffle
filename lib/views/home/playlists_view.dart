import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_shuffle/components/home/playlist_card.dart';
import 'package:music_shuffle/config/constants.dart';
import 'package:music_shuffle/controllers/youtube_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PlaylistsView extends StatefulWidget {
  final int index;
  const PlaylistsView({super.key, required this.index});

  @override
  State<PlaylistsView> createState() => _PlaylistsViewState();
}

class _PlaylistsViewState extends State<PlaylistsView> {
  late final controller;

  @override
  void initState() {
    super.initState();
    switch (widget.index) {
      case 2:
        controller = YoutubeController.instance;
      default:
    }
    controller.fetchPlaylist();
  }

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
            return Obx(() {
              return Skeletonizer(
                enabled: controller.isFetching,
                child: const PlaylistCard(),
              );
            });
          }),
    );
  }
}
