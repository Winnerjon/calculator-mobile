import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../common/animations/theme_animation.dart';
import '../../../../common/services/rewarded_add.dart';
import '../widgets/input_view.dart';
import '../widgets/output_view.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  bool isDark = false;
  final CustomRewardedAdd rewarded = CustomRewardedAdd();
  Timer? timer;
  bool shown = false;

  void open() {
    if (timer != null) {
      if (shown) return;
      rewarded.showYandexRewarded();
      Future.delayed(const Duration(seconds: 1), () {
        shown = true;
      });
    } else {
      rewarded.show();
      timer = Timer(const Duration(minutes: 10), () {
        timer = null;
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeAnimation(
      isDark: isDark,
      offset: Offset(MediaQuery.of(context).size.width - 40, 40),
      childBuilder: (context, index) {
        return Scaffold(
          appBar: AppBar(
            // title: const TimerView(),
            actions: [
              IconButton(
                splashRadius: 22.5,
                icon: isDark
                    ? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode),
                onPressed: () {
                  isDark = !isDark;
                  open();
                  setState(() {});
                },
              ),
            ],
          ),
          body: Column(
            children: [
              OutputView(
                isDark: isDark,
              ),
              InputView(
                isDark: isDark,
              ),
            ],
          ),
        );
      },
    );
  }
}
