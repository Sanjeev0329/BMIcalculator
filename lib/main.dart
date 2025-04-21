import 'package:flutter/material.dart';
import 'package:my_flutterapp/Screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  var weight = TextEditingController();
  var height = TextEditingController();
  var result = "";
  var msg = "";
  Color resultCardColor = Colors.blue.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        title: Text('BMI Calculator', style: TextStyle(fontWeight: FontWeight.w500)),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade100, Colors.blue.shade300],
          ),
        ),
        child: Center(
          child: Container(
            color: Colors.blue.shade200,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 30),
                  Text(
                    'Enter your details',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  _buildTextField('Weight (kg)', weight, Icons.line_weight),
                  SizedBox(height: 20),
                  _buildTextField('Height (cm)', height, Icons.height),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade500,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () {
                      var w = double.parse(weight.text);
                      var h = double.parse(height.text);
                      var bmi = w / ((h / 100) * (h / 100));

                      if (w != 0 && h != 0) {
                        if (bmi < 18.5) {
                          msg = "Underweight! Do diet and Exercise";
                          resultCardColor = Colors.red.shade100;
                        } else if (bmi >= 18.5 && bmi < 25) {
                          msg = "Normal & Healthy";
                          resultCardColor = Colors.green.shade300;
                        } else {
                          msg = "Overweight! Consult to Doctor";
                          resultCardColor = Colors.red.shade400;

                        }

                        setState(() {
                          result = " ${bmi.toStringAsFixed(2)} kg/m² \n$msg";
                        });
                      } else {
                        setState(() {
                          result = "Please enter valid values";
                        });
                      }
                    },
                    child: Text('Calculate BMI', style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 30),
                  Card(
                    elevation: 12,
                    shadowColor: Colors.green.shade200,
                    color:resultCardColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "Calculated BMI is:$result \n\n Normal BMI should be between 18.5 to 25",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Custom text field widget to reduce code duplication
  Widget _buildTextField(String hintText, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: Icon(icon, color: Colors.blue.shade700),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
