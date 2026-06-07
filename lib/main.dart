import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

void main() => runApp(const TasbihApp());

@pragma('vm:entry-point')
void overlayMain() => runApp(const MaterialApp(home: OverlayWidget()));

const kGold = Color(0xFFD4AF37);
const kBg = Color(0xFF080808);

class OverlayWidget extends StatefulWidget {
  const OverlayWidget({super.key});
  @override
  State<OverlayWidget> createState() => _OverlayState();
}

class _OverlayState extends State<OverlayWidget> {
  int n = 0;
  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: GestureDetector(
      onTap: () => setState(() => n++),
      child: Container(
        width: 90, height: 90,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kBg,
          border: Border.all(color: kGold, width: 2),
        ),
        child: Center(child: Text('$n',
          style: const TextStyle(color: kGold, fontSize: 28))),
      ),
    ),
  );
}

class TasbihApp extends StatelessWidget {
  const TasbihApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(home: TasbihHome());
}

class TasbihHome extends StatefulWidget {
  const TasbihHome({super.key});
  @override
  State<TasbihHome> createState() => _HomeState();
}

class _HomeState extends State<TasbihHome> {
  int n = 0;
  bool active = false;

  Future<void> _toggle() async {
    final ok = await FlutterOverlayWindow.isPermissionGranted();
    if (!ok) { await FlutterOverlayWindow.requestPermission(); return; }
    if (active) {
      await FlutterOverlayWindow.closeOverlay();
    } else {
      await FlutterOverlayWindow.showOverlay(
        enableDrag: true, overlayTitle: 'مسبحة',
        flag: OverlayFlag.defaultFlag,
        positionGravity: PositionGravity.auto,
        width: 90, height: 90);
    }
    setState(() => active = !active);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: kBg,
    body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$n', style: const TextStyle(
          fontSize: 100, color: kGold, fontWeight: FontWeight.bold)),
        const SizedBox(height: 40),
        GestureDetector(
          onTap: () => setState(() => n++),
          child: Container(
            width: 200, height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: kGold, width: 3)),
            child: const Center(child: Text('اضغط',
              style: TextStyle(color: kGold, fontSize: 24))),
          ),
        ),
        const SizedBox(height: 30),
        TextButton(onPressed: () => setState(() => n = 0),
          child: const Text('إعادة', style: TextStyle(color: kGold, fontSize: 18))),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _toggle,
          style: ElevatedButton.styleFrom(
            backgroundColor: active ? kGold : Colors.transparent,
            side: const BorderSide(color: kGold)),
          child: Text(active ? 'إخفاء العائم' : 'تفعيل العائم',
            style: TextStyle(color: active ? kBg : kGold)),
        ),
      ],
    )),
  );
}
