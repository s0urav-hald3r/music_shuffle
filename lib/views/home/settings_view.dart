import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:music_shuffle/config/constants.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        iconTheme: IconThemeData(
          color: whiteColor, //change your color here
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: whiteColor,
          ),
        ),
      ),
      body: Column(children: [
        listCard(rate, 'Rate App', () async {
          if (await InAppReview.instance.isAvailable()) {
            InAppReview.instance.requestReview();
          }
        }),
        Divider(indent: 56, height: 1, thickness: .25, color: whiteColor),
        listCard(share, 'Share App', () async {
          await Share.share(shareText);
        }),
        Divider(indent: 56, height: 1, thickness: .25, color: whiteColor),
        listCard(feedback, 'Send Feedback', () {}),
        Divider(indent: 56, height: 1, thickness: .25, color: whiteColor),
        listCard(privacy, 'Privacy Policy', () async {
          Uri uri = Uri.parse(privacyUrl);
          if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
            throw Exception('Could not launch $uri');
          }
        }),
        Divider(indent: 56, height: 1, thickness: .25, color: whiteColor),
        listCard(restore, 'Restore Subscriptions', () {}),
        Divider(indent: 56, height: 1, thickness: .25, color: whiteColor),
        listCard(terms, 'Terms of Use', () async {
          Uri uri = Uri.parse(termsUseUrl);
          if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
            throw Exception('Could not launch $uri');
          }
        }),
      ]),
    );
  }

  Widget listCard(String icon, String title, Function callBack) {
    return InkWell(
      onTap: () {
        callBack();
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17,
              color: whiteColor,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(arrow),
        ]),
      ),
    );
  }
}
