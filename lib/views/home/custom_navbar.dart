import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:music_shuffle/config/constants.dart';
import 'package:music_shuffle/controllers/home_controller.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1E1E1E),
        padding: EdgeInsets.zero,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _menuItem(0, playlists, 'Playlists'),
          _menuItem(1, liked, 'Liked Playlists'),
          _menuItem(2, albums, 'Albums'),
        ]),
      ),
    );
  }

  Widget _menuItem(int index, String icon, String title) {
    return InkWell(
      onTap: () {
        HomeController.instance.index = index;
      },
      child: Obx(() {
        return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            icon,
            color: HomeController.instance.index == index
                ? whiteColor
                : whiteColor.withOpacity(.3),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 11,
              color: HomeController.instance.index == index
                  ? whiteColor
                  : whiteColor.withOpacity(.3),
            ),
          )
        ]);
      }),
    );
  }
}
