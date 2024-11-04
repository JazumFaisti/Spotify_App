import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:spotify_clone/DI/service_locator.dart';
import 'package:spotify_clone/DI/service_locator.dart';
import 'package:spotify_clone/Tampilan/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Tambahkan ini untuk memastikan semua widget sudah diinisialisasi
  await Supabase.initialize(
    url: 'https://xtvpaqtgfoevtnnuolwh.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh0dnBhcXRnZm9ldnRubnVvbHdoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzA2ODk4MzQsImV4cCI6MjA0NjI2NTgzNH0.DO354BPcZ-4CI1dBizIrsUYAhbqgj0kq_Cs8nAmlfoU',
  );

  initServiceLocator(); // Inisialisasi service locator
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home:
          const SplashScreen(), // Ganti SignUp dengan SplashScreen atau layar awal lainnya
    );
  }
}
