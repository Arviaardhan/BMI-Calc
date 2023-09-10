import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'MyHomePageController.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomePageController controller = Get.put(HomePageController());
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String bmiCategory = '';
  double bmiValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weightController = new TextEditingController();
    heightController = new TextEditingController();
  }

  @override
  Widget myText(String label, bool isObsecure, TextEditingController controller) {

    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)),
          hintText: "Weight",
          hintStyle: TextStyle(color: Colors.grey),
          labelText: label,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myText("Weight", false, weightController),
            myText("Height", true, heightController),
            // elevated button login
            ElevatedButton(onPressed: () => controller.calculateBMICategory(
                double.parse(weightController.text),
                double.parse(heightController.text)),
                child: Text("Hitung")),
            SizedBox(height: 20,), // Spacing between buttons
            Obx(
                  () => Text(
                "BMI Result : " + controller.hasilBmi.value.toStringAsFixed(2),
              ),
            ),
            Obx(
                  () => Text(
                "BMI Category : " + controller.bmiCategory.value.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
