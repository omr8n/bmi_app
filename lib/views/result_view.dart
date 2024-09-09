// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({
    super.key,
    required this.age,
    required this.isMale,
    required this.result,
  });
  final int age;
  final bool isMale;
  final double result;

  String get resultPhrase {
    String resultText = '';
    if (result >= 30) {
      resultText = 'Obese';
    } else if (result > 25 && result < 30) {
      resultText = 'Overweight';
    } else if (result >= 18.5 && result <= 24.9) {
      resultText = 'Normal';
    } else {
      resultText = 'Thin';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Result',
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Gender: ${isMale ? 'Male' : 'Female'}',
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                'Result: ${result.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                'Healthiness: $resultPhrase',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              Text(
                'Age: $age',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
