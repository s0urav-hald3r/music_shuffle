import 'package:flutter/material.dart';
import 'package:music_shuffle/components/home/transferred_card.dart';
import 'package:music_shuffle/config/constants.dart';

class TransferredView extends StatelessWidget {
  const TransferredView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        iconTheme: IconThemeData(
          color: whiteColor, //change your color here
        ),
        title: Text(
          'Transferred Playlist',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: whiteColor,
          ),
        ),
      ),
      body: ListView(children: const [
        TransferredCard(),
        TransferredCard(),
        TransferredCard(),
        TransferredCard(),
      ]),
    );
  }
}
