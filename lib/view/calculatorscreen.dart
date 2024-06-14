import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contoller/calculator_controller.dart';
import 'intrest_calculator_view.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      initialRoute: '/',
      routes: {
        '/': (context) => CalculatorView(),
        '/interestCalculator': (context) => InterestCalculatorView(),
      },
    );
  }
}

class CalculatorView extends StatelessWidget {
  final CalculatorController controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text(
            controller.result.value,
            style: TextStyle(fontSize: 36),
          )),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildOperatorButton('+'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildOperatorButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildOperatorButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton('0'),
              buildButton('C', isClear: true),
              buildOperatorButton('/'),
              buildButton('='),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(()=>InterestCalculatorView());
            },
            child: Text('Calculate Interest'),
          ),
        ],

      ),
    );
  }

  Widget buildButton(String text, {bool isClear = false}) {
    return ElevatedButton(
      onPressed: () {
        if (isClear) {
          controller.onClearPress();
        } else {
          controller.onDigitPress(text);
        }
      },
      child: Text(text),
    );
  }

  Widget buildOperatorButton(String text) {
    return ElevatedButton(
      onPressed: () {
        controller.onOperatorPress(text);
      },
      child: Text(text),
    );
  }
}
