import 'package:get/get.dart';

class HomePageController extends GetxController {
  final count = 0.obs;
  increment() => count.value++;
  decrement(){
    count.value--;
  }

  final hasilBmi = RxDouble(0.0);
  var bmiCategory = RxString('initial');
  calculateBMICategory(double weight, double height){
    double calculateBMICategory = weight / (height * height);
    hasilBmi.value = calculateBMICategory;
    print("hasil "+hasilBmi.value.toString());
    if (hasilBmi < 18.5) {
      bmiCategory.value = "Berat badan kurang proporsional";
    } else if (hasilBmi >= 18.5 && hasilBmi <= 24.9) {
      bmiCategory.value = "Berat badan ideal";
    } else if (hasilBmi >= 25 && hasilBmi <= 29.9) {
      bmiCategory.value = "Berat badan berlebih (berpotensi obesitas)";
    } else if (hasilBmi > 30) {
      bmiCategory.value = "Obesitas";
    }
  }
}

