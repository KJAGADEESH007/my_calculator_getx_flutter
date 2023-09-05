import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../contoller/intrest_contoller.dart';

class InterestCalculatorView extends StatelessWidget {
  final InterestController interestController = Get.put(InterestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interest Calculator'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Select Interest Mode:'),
                DropdownButtonFormField<String>(
                  value: interestController.selectedInterestMode.value,
                  onChanged: (String? newValue) {
                    interestController.selectedInterestMode.value = newValue!;
                  },
                  items: <String>['Percentage', 'Fixed Amount']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: interestController.selectedInterestMode.value == 'Percentage'
                        ? 'Interest Percentage'
                        : 'Interest Amount',
                  ),
                  onChanged: (value) {
                    if (interestController.selectedInterestMode.value == 'Percentage') {
                      interestController.interestAmount.value = double.tryParse(value) ?? 0.0;
                    } else {
                      interestController.interestAmount.value = double.tryParse(value) ?? 0.0;
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Number of Years',
                  ),
                  onChanged: (value) {
                    interestController.numberOfYears.value = int.tryParse(value) ?? 0;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Number of Months',
                  ),
                  onChanged: (value) {
                    interestController.numberOfMonths.value = int.tryParse(value) ?? 0;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Number of Days',
                  ),
                  onChanged: (value) {
                    interestController.numberOfDays.value = int.tryParse(value) ?? 0;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Amount Taken',
                  ),
                  onChanged: (value) {
                    interestController.amountTaken.value = double.tryParse(value) ?? 0.0;
                  },
                ),
                SizedBox(height: 5,),
                ElevatedButton(
                  onPressed: () {
                    interestController.calculateInterest();
                  },
                  child: const Text('Calculate Interest'),
                ),
                Obx(() {
                  final interestResult = interestController.interestResult.value;
                  return Text(
                    'Interest: ${double.tryParse(interestResult)?.toStringAsFixed(2) ?? interestResult}',
                    style: const TextStyle(fontSize: 24),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
