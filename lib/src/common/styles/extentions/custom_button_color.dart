import 'package:flutter/material.dart';

import '../colors.dart';

@immutable
class CustomButtonColor extends ThemeExtension<CustomButtonColor> {
  //
  const CustomButtonColor({
    required this.backgroundColor,
    required this.textColor1,
    required this.textColor2,
    required this.textColor3,
  });

  final Color? backgroundColor;
  final Color? textColor1;
  final Color? textColor2;
  final Color? textColor3;

  @override
  ThemeExtension<CustomButtonColor> copyWith(
      {Color? backgroundColor,
      Color? textColor1,
      Color? textColor2,
      Color? textColor3}) {
    return CustomButtonColor(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor1: textColor1 ?? this.textColor1,
      textColor2: textColor2 ?? this.textColor2,
      textColor3: textColor3 ?? this.textColor3,
    );
  }

  @override
  ThemeExtension<CustomButtonColor> lerp(
      ThemeExtension<CustomButtonColor>? other, double t) {
    if (other is! CustomButtonColor) {
      return this;
    }
    return CustomButtonColor(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      textColor1: Color.lerp(textColor1, other.textColor1, t),
      textColor2: Color.lerp(textColor2, other.textColor2, t),
      textColor3: Color.lerp(textColor3, other.textColor3, t),
    );
  }

  @override
  String toString() {
    return 'CustomButtonColor(backgroundColor: $backgroundColor, textColor1: $textColor1, textColor2: $textColor2, textColor3: $textColor3)';
  }

  static const light = CustomButtonColor(
    backgroundColor: LightColors.btnBgColor,
    textColor1: Colors.black,
    textColor2: LightColors.leftOperatorColor,
    textColor3: LightColors.operatorColor,
  );

  static const dark = CustomButtonColor(
    backgroundColor: DarkColors.btnBgColor,
    textColor1: Colors.white,
    textColor2: LightColors.leftOperatorColor,
    textColor3: LightColors.operatorColor,
  );
}
