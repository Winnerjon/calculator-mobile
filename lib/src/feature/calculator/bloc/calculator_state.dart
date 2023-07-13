part of 'calculator_bloc.dart';

abstract class CalculatorState extends Equatable {
  const CalculatorState();
}

class CalculatorInitial extends CalculatorState {
  @override
  List<Object> get props => [];
}

class CalculatorLoaded extends CalculatorState {
  final String userInput;
  final String userOutput;

  const CalculatorLoaded({required this.userInput, required this.userOutput});
  @override
  List<Object?> get props => [userInput, userOutput];

}
