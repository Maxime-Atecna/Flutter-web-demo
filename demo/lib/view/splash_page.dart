
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    onStartUp();
    super.initState();
  }

  Future<void> onStartUp() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
