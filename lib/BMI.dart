import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({Key? key}) : super(key: key);

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String result = "";

  double calculateBMI(double weight, double height) {
    return weight / (height * height);
  }

  void calculateButtonPressed() {
    double weight = double.tryParse(weightController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0;

    double bmi = calculateBMI(weight, height);

    setState(() {
      if (bmi < 18.5) {
        result = "Kurus";
      } else if (bmi >= 18.5 && bmi < 24.9) {
        result = "Normal Broo";
      } else if (bmi >= 25 && bmi < 29.9) {
        result = "Gemuk";
      } else {
        result = "Obesitas";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
    TextField(
      decoration: InputDecoration(
        labelText: "Masukkan berat",
        border: OutlineInputBorder(),
      ),
    ),
    SizedBox(height: 10,),
    TextField(
      decoration: InputDecoration(
        labelText: "Masukkan tinggi",
        border: OutlineInputBorder(),
      ),
    ),
    SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateButtonPressed,
         
              child: Text("hitung"),
            ),
             SizedBox(height: 20),
        Text(
          "BMI Result: $result",
          style: TextStyle(fontSize: 18),
        ),
      ],
    ); 
  }
}