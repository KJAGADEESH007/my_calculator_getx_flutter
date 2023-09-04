import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  var result = '0'.obs;

  void onDigitPress(String digit) {
    if (result.value == '0' || result.value == 'Error') {
      result.value = digit;
    } else {
      result.value += digit;
    }
  }

  void onOperatorPress(String operator) {
    if (!result.value.endsWith('+') &&
        !result.value.endsWith('-') &&
        !result.value.endsWith('*') &&
        !result.value.endsWith('/')) {
      result.value += operator;
    }
  }

  void onClearPress() {
    result.value = '0';
  }

  void onCalculatePress() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(result.value);
      ContextModel cm = ContextModel();
      result.value = exp.evaluate(EvaluationType.REAL, cm).toString();
    } catch (e) {
      result.value = 'Error';
    }
  }
}
