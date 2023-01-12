import 'package:get/get.dart';

class ValueController extends GetxController {
  RxString definedValue = "".obs; //GetX

  RxBool isLoading = false.obs;

  Future<void> setValue(String newValue) async {
    isLoading.value = true;
    //update() -> Usado sem variável observável e com o GetBuilder

    await Future.delayed(const Duration(seconds: 2));

    definedValue.value = newValue;
    isLoading.value = false;

    //update() -> Usado sem variável observável e com o GetBuilder
  }
}
