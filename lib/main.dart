import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';
import 'dart:math';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const TasbihApp());
}

const kGold      = Color(0xFFD4AF37);
const kGoldLight = Color(0xFFF5E07A);
const kGoldDark  = Color(0xFF9A7D0A);
const kBg        = Color(0xFF080808);

class TasbihApp extends StatelessWidget {
  const TasbihApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'مسبحة',
    theme: ThemeData(
      scaffoldBackgroundColor: kBg,
      colorScheme: const ColorScheme.dark(primary: kGold),
    ),
    home: const TasbihHome(),
  );
}

class TasbihHome extends StatefulWidget {
  const TasbihHome({super.key});
  @override
  State<TasbihHome> createState() => _TasbihHomeState();
}

class _TasbihHomeState extends State<TasbihHome>
    with SingleTickerProviderStateMixin {
  int count = 0, total = 0, round = 1;
  static const target = 100;
  bool vibOn = true;
