import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

void main() {
  runApp(const TasbihApp());
}

@pragma('vm:entry-point')
void overlayMain() {
  runApp(const OverlayApp());
}

const kGold = Color(0xFFD4AF37);
const kBg = Color(0xFF080808);

class OverlayApp extends StatelessWidget {
  const OverlayApp({super.key});
  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OverlayWidget(),
  );
}

class OverlayWidget extends StatefulWidget {
  const OverlayWidget({super.key});
  @override
  State<OverlayWidget> createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colo
