import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_shuffle/config/constants.dart';
import 'package:music_shuffle/config/navigator_key.dart';

class SongsView extends StatelessWidget {
  const SongsView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(children: [
          Image.asset(thumbnail),
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, blackColor, blackColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SizedBox(
            width: size.width,
            height: size.height,
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                NavigatorKey.pop();
                              },
                              child: SvgPicture.asset(leftArrow),
                            ),
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(upload),
                            ),
                          ]),
                    ),
                    const Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 52,
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: elevated,
                      ),
                      child: ElevatedButton(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(transfer),
                              const SizedBox(width: 12),
                              Text(
                                'Transfer',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: whiteColor,
                                ),
                              ),
                            ]),
                        onPressed: () {},
                      ),
                    ),
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}
