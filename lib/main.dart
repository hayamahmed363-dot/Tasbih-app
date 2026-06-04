import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const TasbihApp());
}

const kGold = Color(0xFFD4AF37);
const kBg = Color(0xFF080808);

class TasbihApp extends StatelessWidget {
  const TasbihApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const TasbihHome(),
  );
}

class TasbihHome extends StatefulWidget {
  const TasbihHome({super.key});
  @override
  State<TasbihHome> createState() => _TasbihHomeState();
}

class _TasbihHomeState extends State<TasbihHome> {
  int count = 0;

  void _tap() => setState(() => count++);
  void _reset() => setState(() => count = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$count',
              style: const TextStyle(
                fontSize: 100,
                color: kGold,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: _tap,
              child: Container(
                width: 200, height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: kGold, width: 3),
                  color: kBg,
                ),
                child: const Center(
                  child: Text('اضغط',
                    style: TextStyle(color: kGold, fontSize: 24)),
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: _reset,
              child: const Text('إعادة',
                style: TextStyle(color: kGold, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
