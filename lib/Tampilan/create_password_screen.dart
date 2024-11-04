import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Tambahkan ini untuk Supabase
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/Tampilan/choose_gender_screen.dart';

class CreatePasswordScreen extends StatefulWidget {
  final String email; // Ambil email dari layar sebelumnya

  const CreatePasswordScreen({required this.email, super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  String password = ""; // Variabel untuk menyimpan password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darGreyColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const _Header(),
              const Row(
                children: [
                  SizedBox(width: 3),
                  Text(
                    "Create a password",
                    style: TextStyle(
                      fontFamily: "AB",
                      fontSize: 20,
                      color: MyColors.whiteColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              Container(
                height: 51,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xff777777),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: TextField(
                  obscureText: true, // Menyembunyikan input password
                  onChanged: (value) {
                    setState(() {
                      password = value; // Set password saat pengguna mengetik
                    });
                  },
                  style: const TextStyle(
                    fontFamily: "AM",
                    fontSize: 14,
                    color: MyColors.whiteColor,
                  ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                        width: 0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text(
                    "Use at least 8 characters.",
                    style: TextStyle(
                      fontFamily: "AM",
                      fontSize: 10,
                      color: MyColors.whiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const SizedBox(height: 35),
              GestureDetector(
                onTap: () async {
                  if (password.length >= 8) {
                    // Mendaftar pengguna ke Supabase
                    final response = await Supabase.instance.client.auth.signUp(
                      widget.email, // Menggunakan email yang diteruskan
                      password,
                    );
                    if (response.error == null) {
                      // Pendaftaran berhasil
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChooseGenderScreen(),
                        ),
                      );
                    } else {
                      // Menampilkan error jika pendaftaran gagal
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(response.error!.message)),
                      );
                    }
                  }
                },
                child: Container(
                  height: 45,
                  width: 90,
                  decoration: BoxDecoration(
                    color: (password.length >= 8)
                        ? MyColors.whiteColor
                        : MyColors.lightGrey,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontFamily: "AB",
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
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
      padding: const EdgeInsets.only(bottom: 35, top: 35),
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.blackColor,
              ),
              child: Center(
                child: Image.asset(
                  "images/icon_arrow_left.png",
                  height: 16,
                  width: 16,
                ),
              ),
            ),
          ),
          const Text(
            "Create Account",
            style: TextStyle(
              fontFamily: "AB",
              fontSize: 16,
              color: MyColors.whiteColor,
            ),
          ),
          const SizedBox(height: 32, width: 32),
        ],
      ),
    );
  }
}
