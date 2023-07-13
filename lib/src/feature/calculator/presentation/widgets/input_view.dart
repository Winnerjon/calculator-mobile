import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/services/calculator_service.dart';
import '../../../../common/styles/extentions/custom_button_color.dart';
import '../../bloc/calculator_bloc.dart';
import 'button.dart';

class InputView extends StatelessWidget {
  final bool isDark;
  const InputView({Key? key, required this.isDark}) : super(key: key);

  bool isOperator(String y) {
    if (y == "%" || y == "/" || y == "x" || y == "-" || y == "+" || y == "=") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    List<String> buttons = CalculatorService.buttons;
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: buttons.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemBuilder: (context, index) {
              final customButtonColor = Theme.of(context).extension<CustomButtonColor>()!;
              switch (index) {

              /// CLEAR BTN
                case 0:
                  return CustomButton(
                      buttonTapped: () {
                        context.read<CalculatorBloc>().add(CalculatorClear());
                      },
                      color: customButtonColor.backgroundColor!,
                      textColor: customButtonColor.textColor2!,
                      text: buttons[index]);

              /// DELETE BTN
                case 1:
                  return CustomButton(
                      buttonTapped: () {
                        context.read<CalculatorBloc>().add(CalculatorDelete());
                      },
                      color: customButtonColor.backgroundColor!,
                      textColor: customButtonColor.textColor2!,
                      text: buttons[index]);

              /// EQUAL BTN
                case 19:
                  return CustomButton(
                      buttonTapped: () {
                        context.read<CalculatorBloc>().add(CalculatorEqual());
                      },
                      color: customButtonColor.backgroundColor!,
                      textColor: customButtonColor.textColor2!,
                      text: buttons[index]);

                default:
                  return CustomButton(
                      buttonTapped: () {
                        context.read<CalculatorBloc>().add(CalculatorInput(item: buttons[index]));
                      },
                      color: customButtonColor.backgroundColor!,
                      textColor: isOperator(buttons[index])
                          ? customButtonColor.textColor3!
                          : customButtonColor.textColor1!,
                      text: buttons[index]);
              }
            }),
      ),
    );
  }
}
