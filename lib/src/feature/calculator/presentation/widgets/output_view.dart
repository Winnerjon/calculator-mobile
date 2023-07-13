import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/styles/colors.dart';
import '../../bloc/calculator_bloc.dart';

class OutputView extends StatelessWidget {
  final bool isDark;

  const OutputView({Key? key, required this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 20, top: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    (state is CalculatorLoaded) ? state.userInput : "",
                    style: TextStyle(
                        // color: isDark ? Colors.white : Colors.black,
                        fontSize: 25),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    (state is CalculatorLoaded) ? state.userOutput : "",
                    style: TextStyle(
                        // color: isDark ? Colors.white : Colors.black,
                        fontSize: 32),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
