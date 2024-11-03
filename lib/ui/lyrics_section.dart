import 'package:flutter/material.dart';
import 'package:spotify_app/constants/constants.dart';
import 'package:animations/animations.dart';
import 'package:spotify_app/ui/lyrics_screen.dart';

class LyricsSection extends StatelessWidget {
  const LyricsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff2c7c93),
            Color(0xff215260),
            Color(0xff141517),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              OpenContainer(
                openElevation: 0.0,
                closedElevation: 0.0,
                transitionDuration: const Duration(milliseconds: 400),
                middleColor: Colors.transparent,
                closedColor: Colors.transparent,
                openColor: Colors.transparent,
                closedBuilder: (context, action) {
                  return const _LyricsSection();
                },
                openBuilder: (context, action) {
                  return const LyricsScreen();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LyricsSection extends StatelessWidget {
  const _LyricsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: const BoxDecoration(
                color: Color(0xff2b8094),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 33,
            left: 15,
            child: Text(
              "Lyrics",
              style: TextStyle(
                fontFamily: "AM",
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: MyColors.whiteColor,
              ),
            ),
          ),
          Positioned(
            top: 33,
            right: 15,
            child: Container(
              height: 28,
              decoration: BoxDecoration(
                color: MyColors.darGreyColor.withOpacity(0.6),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const Text(
                        "MORE",
                        style: TextStyle(
                          fontFamily: "AM",
                          fontSize: 10,
                          color: MyColors.whiteColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset("images/icon_bigger_size.png"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 15,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 47),
              child: Container(
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(
                      color: Colors.white.withOpacity(0.5), width: 1),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/share.png',
                          height: 10,
                          width: 10,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "SHARE",
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 10,
                            color: MyColors.whiteColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 30),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      """Langit dan laut saling membantu
Mencipta awan hujan pun turun
Ketika dunia saling membantu
Lihat cinta mana yang tak jadi satu""",
                      style: TextStyle(
                        color: MyColors.whiteColor,
                        fontFamily: "AM",
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      """
Kau memang manusia sedikit kata
Bolehkah aku yang berbicara
Kau memang manusia tak kasat rasa
Biar aku yang mengemban cinta
Awan dan alam saling bersentuh (bersentuh)
Mencipta hangat kau pun tersenyum
Ketika itu kulihat syahdu
Lihat hati mana yang tak akan jatuh
      """,
                      style: TextStyle(
                        color: MyColors.blackColor,
                        fontFamily: "AM",
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
