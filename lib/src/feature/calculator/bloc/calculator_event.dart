part of 'calculator_bloc.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();
}

class CalculatorInput extends CalculatorEvent {
  final String item;

  const CalculatorInput({required this.item});
  @override
  List<Object?> get props => [item];
}

class CalculatorDelete extends CalculatorEvent {
  @override
  List<Object?> get props => [];
}

class CalculatorClear extends CalculatorEvent {
  @override
  List<Object?> get props => [];
}

class CalculatorEqual extends CalculatorEvent {
  @override
  List<Object?> get props => [];
}
