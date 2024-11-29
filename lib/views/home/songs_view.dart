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
              child: Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                      const Spacer(),
                      Text(
                        '50 Songs',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: whiteColor,
                        ),
                      ),
                      Text(
                        'Apple New Music',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: whiteColor,
                        ),
                      ),
                      Text(
                        '9500 Gilman Drive La Jolla, CA',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: whiteColor,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Divider(
                        height: 1,
                        thickness: .5,
                        color: whiteColor.withOpacity(.5),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: size.height / 2.5,
                        child: ListView.separated(
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return Row(children: [
                              Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                clipBehavior: Clip.none,
                                child: Image.asset(albumArt),
                              ),
                              const SizedBox(width: 12),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Walk It Off',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: whiteColor,
                                        ),
                                      ),
                                      Text(
                                        'Bill Weeds & Cory Weeds',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: const Color(0xFFEBEBF5)
                                              .withOpacity(.6),
                                        ),
                                      ),
                                    ]),
                              )
                            ]);
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: 16,
                              thickness: .5,
                              color: whiteColor.withOpacity(.5),
                            );
                          },
                        ),
                      )
                    ]),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 52,
                margin: const EdgeInsets.symmetric(horizontal: 16),
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
            ),
          ),
        ]),
      ),
    );
  }
}
