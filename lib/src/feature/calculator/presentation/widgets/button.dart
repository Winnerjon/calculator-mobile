import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../common/services/rewarded_add.dart';

class CustomButton extends StatefulWidget {
  final Color color;
  final Color textColor;
  final String text;
  final VoidCallback buttonTapped;

  const CustomButton({Key? key,
    required this.color,
    required this.textColor,
    required this.text,
    required this.buttonTapped,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final CustomRewardedAdd rewarded = CustomRewardedAdd();
  Timer? timer;
  bool shown = false;

  void open() {
    if (timer != null) {
      if (shown) return;
      rewarded.showYandexRewarded();
      Future.delayed(Duration(seconds: 1), () {
        shown = true;
      });
    } else {
      rewarded.show();
      timer = Timer(Duration(minutes: 1), () {
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
    return GestureDetector(
      onTap: () {
        widget.buttonTapped();
        open();
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(color: widget.textColor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}