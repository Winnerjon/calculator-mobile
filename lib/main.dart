import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_yandex_ads/yandex.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'src/common/styles/theme.dart';
import 'src/feature/calculator/bloc/calculator_bloc.dart';
import 'src/feature/calculator/presentation/screens/calculator_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  FlutterYandexAds.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CalculatorBloc>(
          create: (BuildContext context) => CalculatorBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Calculator',
        theme: AppThemes.dark,
        debugShowCheckedModeBanner: false,
        home: const CalculatorScreen(),
      ),
    );
  }
}
