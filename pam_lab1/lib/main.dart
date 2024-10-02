import 'package:flutter/material.dart';
import 'components/custom_slider.dart';
import 'components/custom_text_field.dart';

void main() => runApp(LoanApp());

class LoanApp extends StatelessWidget {
  const LoanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'CeraPro'),
      home: FinancialCalculatorHome(),
    );
  }
}

class FinancialCalculatorHome extends StatefulWidget {
  @override
  _FinancialCalculatorHomeState createState() =>
      _FinancialCalculatorHomeState();
}

class _FinancialCalculatorHomeState extends State<FinancialCalculatorHome> {
  final TextEditingController loanAmountController = TextEditingController();
  final TextEditingController interestInputController = TextEditingController();

  double loanAmount = 0;
  int durationMonths = 1;
  double interestPercentage = 0;
  double monthlyInstallment = 0;

  String? loanAmountError;
  String? interestInputError;

  void computeInstallment() {
    setState(() {
      if (loanAmount > 0 && durationMonths > 0 && interestPercentage > 0) {
        monthlyInstallment = (loanAmount + (loanAmount / 100 * interestPercentage)) / durationMonths;
      }
    });
  }

  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    }
    final parsedValue = double.tryParse(value);
    if (parsedValue == null) {
      return 'Enter a valid number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Center(
              child: Text(
                "Loan calculator",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(height: 60),
            Text(
              "Enter amount",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 6),
            CustomTextField(
              controller: loanAmountController,
              hintText: "Amount",
              errorText: loanAmountError,
              onChanged: (value) {
                setState(() {
                  loanAmount = double.tryParse(value) ?? 0;
                  loanAmountError = validateInput(value);
                });
              },
            ),
            SizedBox(height: 36),
            Text(
              "Enter number of months",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 36),
            CustomSlider(
              durationMonths: durationMonths,
              onChanged: (value) {
                setState(() {
                  durationMonths = value.toInt();
                });
              },
            ),
            SizedBox(height: 30),
            Text(
              "Enter % per month",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 6),
            CustomTextField(
              controller: interestInputController,
              hintText: "Percent",
              errorText: interestInputError,
              onChanged: (value) {
                setState(() {
                  interestPercentage = double.tryParse(value) ?? 0;
                  interestInputError = validateInput(value);
                });
              },
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFF1F2F6),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F2F6),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "You will pay the approximate amount monthly:",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5,
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "${monthlyInstallment.toStringAsFixed(2)}€",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.5,
                          color: Color(0xFF1427C5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: computeInstallment,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Color(0xFF1427C5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
