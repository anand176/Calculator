import 'package:flutter/material.dart';
import 'package:calculator_project/calculator_key.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '0';

  void _onKeyPressed(String value) {
    setState(() {
      if (value == 'C') {
        _output = '0';
      } else if (value == '=') {
        try {
          _output = eval(_output).toString();
        } catch (e) {
          _output = 'Error';
        }
      } else {
        if (_output == '0') {
          _output = value;
        } else {
          _output += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    _output,
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              CalculatorKey(
                label: '7',
                onPressed: _onKeyPressed,
              ),
              CalculatorKey(
                label: '8',
                onPressed: _onKeyPressed,
              ),
              CalculatorKey(
                label: '9',
                onPressed: _onKeyPressed,
              ),
              CalculatorKey(
                label: '/',
                onPressed: _onKeyPressed,
              ),
            ],
          ),
          Row(
            children: [
              CalculatorKey(
                label: '4',
                onPressed: _onKeyPressed,
              ),
              CalculatorKey(
                label: '5',
                onPressed: _onKeyPressed,
              ),
              CalculatorKey(
                label: '6',
                onPressed: _onKeyPressed,
              ),
              CalculatorKey(
                label: '*',
                onPressed: _onKeyPressed,
              ),
            ],
          ),
          Row(
            children: [
              CalculatorKey(
                label: '1',
                onPressed: _onKeyPressed,
              ),
              CalculatorKey(
                label: '2',
                onPressed: _onKeyPressed,
              ),
              CalculatorKey(
                label: '3',
                onPressed: _onKeyPressed,
              ),
              CalculatorKey(
                label: '-',
                onPressed: _onKeyPressed,
              ),
            ],
          ),
          Row(
            children: [
              CalculatorKey(
                label: '0',
                flex: 2,
                onPressed: _onKeyPressed,
              ),
              CalculatorKey(
                label: '.',
                onPressed: _onKeyPressed,
              ),
              CalculatorKey(
                label: '+',
                onPressed: _onKeyPressed,
              ),
            ],
          ),
          Row(
            children: [
              CalculatorKey(
                label: 'C',
                onPressed: _onKeyPressed,
              ),
              CalculatorKey(
                label: '=',
                onPressed: _onKeyPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }

  double eval(String expression) {
    // Split the expression into operands and operators
    final List<String> parts = expression.split(RegExp(r"([\+\-\*\/])"));

    // Convert the operands to doubles
    var operands2 = operands;
    final List<double> operands = operands2.whereType<double>().toList();
    // Convert the operators to functions
    final List<Function(double, double)> operators = [];
    for (int i = 1; i < parts.length; i += 2) {
      switch (parts[i]) {
        case '+':
          operators.add((a, b) => a + b);
          break;
        case '-':
          operators.add((a, b) => a - b);
          break;
        case '*':
          operators.add((a, b) => a * b);
          break;
        case '/':
          operators.add((a, b) => a / b);
          break;
      }
    }

    // Perform the calculations
    var result = operands.first;
    for (int i = 0; i < operators.length; i++) {
      result = operators[i](result, operands[i + 1]);
    }

    return result;
  }
}
