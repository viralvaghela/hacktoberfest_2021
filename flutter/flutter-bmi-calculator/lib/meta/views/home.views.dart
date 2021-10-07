import 'dart:io';

import 'package:bmicalculator/core/notifiers/bmi_calculate.notifiers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    heightController = TextEditingController();
    weightController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BmiNotifier bmiNotifier =
        Provider.of<BmiNotifier>(context, listen: false);

    return WillPopScope(
      onWillPop: () => exit(0),
      child: Scaffold(
          appBar: AppBar(
            title: Text("BMI Calculator"),
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center(
              child: SizedBox(
                height: 350,
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: heightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Enter Height",
                            border: OutlineInputBorder(),
                            labelText: "Height",
                            suffixText: 'Meters',
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextField(
                          controller: weightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Enter Weight",
                            border: OutlineInputBorder(),
                            labelText: "Weight",
                            suffixText: 'Kg',
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 45,
                          width: 200,
                          child: ElevatedButton(
                              onPressed: () async {
                                if (heightController.text.isEmpty &&
                                    weightController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Enter you correct height and weight")));
                                }

                                var height =
                                    double.parse(heightController.text);
                                var weight =
                                    double.parse(weightController.text);
                                var bmiValue = await bmiNotifier.bmiCalculate(
                                    height, weight);
                                var healthStatus;
                                setState(() {
                                  bmiValue = double.parse(
                                      (bmiValue).toStringAsFixed(2));
                                  if (bmiValue <= 18.5) {
                                    healthStatus = 'Oops! You are underweight.';
                                  }
                                  if (18.5 <= bmiValue && bmiValue <= 24.9) {
                                    healthStatus = 'Awesome! You are healthy.';
                                  }
                                  if (25 <= bmiValue && bmiValue <= 29.9) {
                                    healthStatus = 'Eee!You are over weight.';
                                  }
                                  if (30 <= bmiValue) {
                                    healthStatus = 'Seesh! You are obese.';
                                  }
                                });

                                displayModalBottomSheet(
                                    context, bmiValue.toString(), healthStatus);
                              },
                              child: Text("Calculate BMI")),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

void displayModalBottomSheet(context, String bmiValue, healthStatus) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
            height: 300,
            color: Color(0xFF737373),
            child: Container(
                height: 250,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Container(
                        height: 5,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                      SizedBox(height: 50),
                      Text(
                        "Your BMI is",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 33),
                      Text(bmiValue,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      SizedBox(height: 25),
                      Text(healthStatus,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )));
      });
}
