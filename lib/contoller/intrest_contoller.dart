import 'package:get/get.dart';

class InterestController extends GetxController {
  var numberOfYears = 0.obs;
  var numberOfMonths = 0.obs;
  var numberOfDays = 0.obs;
  var amountTaken = 0.0.obs;
  var interestAmount = 0.0.obs;
  var interestResult = '0.0'.obs;
  var selectedInterestMode = 'Percentage'.obs;

  void calculateInterest() {
    try {
      final double amount = amountTaken.value;
      final double interest;

      if (selectedInterestMode.value == 'Percentage') {
        // Calculate interest as a percentage of the amount
        interest = (amount * 0.01 * interestAmount.value).toDouble();
      } else {
        // Calculate interest as a fixed amount
        interest = interestAmount.value.toDouble();
      }

      // Modify this part to calculate interest based on years, months, and days
      final double years = numberOfYears.value.toDouble();
      final double months = numberOfMonths.value.toDouble();
      final double days = numberOfDays.value.toDouble();
      final double totalMonths = years * 12 + months + (days / 30.0);
      interestResult.value = (amount * (interest / 100) * totalMonths / 12).toStringAsFixed(2);
    } catch (e) {
      interestResult.value = 'Error';
    }
  }
}
