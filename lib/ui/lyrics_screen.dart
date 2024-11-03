import 'package:flutter/material.dart';
import 'package:spotify_app/constants/constants.dart';
import 'package:spotify_app/widgets/stream_buttons.dart';

class LyricsScreen extends StatelessWidget {
  const LyricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff2b8094),
      body: Column(
        children: [
          _Header(),
          SizedBox(height: 20),
          _Lyrics(),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: _ActionButtons(),
          ),
        ],
      ),
    );
  }
}

class _Lyrics extends StatelessWidget {
  const _Lyrics();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 310,
        width: MediaQuery.of(context).size.width,
        child: const SingleChildScrollView(
          child: Column(
            children: [
              Text(
                """
Langit dan laut saling membantu
Mencipta awan hujan pun turun
Ketika dunia saling membantu
Lihat cinta mana yang tak jadi satu
Kau memang manusia sedikit kata
Bolehkah aku yang berbicara
Kau memang manusia tak kasat rasa
Biar aku yang mengemban cinta""",
                style: TextStyle(
                  color: MyColors.whiteColor,
                  fontFamily: "AM",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              Text(
                """
Awan dan alam saling bersentuh (bersentuh)
Mencipta hangat kau pun tersenyum
Ketika itu kulihat syahdu
Lihat hati mana yang tak akan jatuh
Kau memang manusia sedikit kata
Bolehkah aku yang berbicara
Kau memang manusia tak kasat rasa
Biar aku yang mengemban cinta
Kau dan aku saling membantu
Membasuh hati yang pernah pilu
Mungkin akhirnya tak jadi satu
Namun bersorai pernah bertemu
""",
                style: TextStyle(
                  color: MyColors.blackColor,
                  fontFamily: "AM",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff000000).withOpacity(0.4),
              ),
              child: const Center(
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),
          ),
          const Column(
            children: [
              Text(
                "Sorai",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "AM",
                  color: MyColors.whiteColor,
                  fontSize: 18,
                ),
              ),
              Text(
                "Nadin Amizah",
                style: TextStyle(
                  fontFamily: "AM",
                  fontSize: 12,
                  color: Color.fromARGB(255, 253, 239, 239),
                ),
              ),
            ],
          ),
          Image.asset(
            'images/icon_flag.png',
            height: 24,
            width: 24,
          ),
        ],
      ),
    );
  }
}

class _ActionButtons extends StatefulWidget {
  const _ActionButtons();

  @override
  State<_ActionButtons> createState() => __ActionButtonsState();
}

class __ActionButtonsState extends State<_ActionButtons> {
  double _currentNumber = 30;
  bool _isInPlay = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SliderTheme(
            data: const SliderThemeData(
              trackHeight: 2,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Slider(
                min: 0,
                max: 100,
                activeColor: const Color.fromARGB(255, 230, 229, 229),
                inactiveColor: const Color.fromARGB(255, 199, 196, 196),
                value: _currentNumber,
                onChanged: (onChanged) {
                  setState(() {
                    _currentNumber = onChanged;
                  });
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "0:55",
                  style: TextStyle(
                    fontFamily: "AM",
                    fontSize: 12,
                    color: Color.fromARGB(255, 230, 229, 229),
                  ),
                ),
                Text(
                  "2:45",
                  style: TextStyle(
                    fontFamily: "AM",
                    fontSize: 12,
                    color: Color.fromARGB(255, 230, 229, 229),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'images/icon_sing.png',
                height: 20,
                width: 20,
                color: Colors.white,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _isInPlay = !_isInPlay;
                  });
                },
                child: (_isInPlay)
                    ? const PauseButton(
                        iconWidth: 5,
                        color: MyColors.whiteColor,
                        height: 60,
                        width: 60,
                        iconHeight: 20,
                      )
                    : const PlayButton(
                        color: MyColors.whiteColor,
                        height: 60,
                        width: 60,
                      ),
              ),
              Image.asset(
                'images/share.png',
                color: Colors.white,
                height: 20,
                width: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
