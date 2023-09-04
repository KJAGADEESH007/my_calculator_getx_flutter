import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../contoller/calculator_controller.dart';

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
              buildButton('=', isEquals: true),
              buildOperatorButton('/'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton(String text, {bool isClear = false, bool isEquals = false}) {
    return ElevatedButton(
      onPressed: () {
        if (isClear) {
          controller.onClearPress();
        } else if (isEquals) {
          controller.onCalculatePress();
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
