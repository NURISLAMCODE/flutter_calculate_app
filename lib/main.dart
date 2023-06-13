import 'package:calculator_app/custom_text_field.dart';
import 'package:calculator_app/operator_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String? oparetor;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController valueOneController = TextEditingController();
  TextEditingController valueTowController = TextEditingController();

  double? result;
  String? error;
  bool isEmptyController() {
    return valueOneController.text.isEmpty || valueTowController.text.isEmpty;
  }

  calculate() {
    if (isEmptyController()) {
      error = "Enter both value";
      setState(() {});
      return;
    }
    double valueOne = double.parse(valueOneController.text);
    double valueTow = double.parse(valueTowController.text);

    switch (oparetor) {
      case "+":
        result = valueOne + valueTow;
        error = "";
        break;
      case "-":
        result = valueOne - valueTow;
        error = "";
        break;
      case "*":
        result = valueOne * valueTow;
        error = "";
        break;
      case "/":
        result = valueOne / valueTow;
        error = "";
        break;
      default:
        error = "Please select one operator";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My Calculator"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomTextField(
                hintext: "value number 1",
                controller: valueOneController,
                onTap: () {
                  setState(
                    () {},
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintext: "value number 2",
                controller: valueTowController,
                onTap: () {
                  setState(
                    () {},
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ["+", "-", "*", "/"]
                    .map(
                      (e) => OperatorButton(
                        value: e,
                        ontap: () {
                          setState(() {});
                        },
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  calculate();
                },
                child: Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                      color: isEmptyController() ? Colors.grey : Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              if (result != null)
                Text(
                  result.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              if (error != null)
                Text(
                  error.toString(),
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
            ],
          ),
        ),
      ),
    );
  }
}
