import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorInitial()) {
    on<CalculatorInput>(onBtnTapped);
    on<CalculatorDelete>(deleteBtnAction);
    on<CalculatorClear>(clearInputAndOutput);
    on<CalculatorEqual>(equalPressed);
  }

  var userInput = "";
  var userOutput = "";

  /// Equal Button Pressed Func
  equalPressed(CalculatorEqual event, Emitter<CalculatorState> emit) {
    String userInputFC = userInput;
    userInputFC = userInputFC.replaceAll("x", "*");
    Parser p = Parser();
    Expression exp = p.parse(userInputFC);
    ContextModel ctx = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, ctx);

    userOutput = eval.toString();
    emit(CalculatorLoaded(userInput: userInput, userOutput: userOutput));
  }

  /// on Number Button Tapped
  onBtnTapped(CalculatorInput event, Emitter<CalculatorState> emit) {
    userInput += event.item;
    emit(CalculatorLoaded(userInput: userInput, userOutput: userOutput));
  }

  /// Delete Button Pressed Func
  deleteBtnAction(CalculatorDelete event, Emitter<CalculatorState> emit) {
    userInput = userInput.substring(0, userInput.length - 1);
    userOutput = "";
    emit(CalculatorLoaded(userInput: userInput, userOutput: userOutput));
  }

  /// Clear Button Pressed Func
  clearInputAndOutput(CalculatorClear event, Emitter<CalculatorState> emit) {
    userInput = "";
    userOutput = "";
    emit(CalculatorLoaded(userInput: userInput, userOutput: userOutput));
  }
}
