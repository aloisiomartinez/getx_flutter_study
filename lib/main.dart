import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_test/user_controller.dart';
import 'package:getx_app_test/value_controller.dart';

import 'dependency_injection.dart';

void main() {
  //Get.put<UserController>(UserController());

  Get.lazyPut<UserController>(() => UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DependencyInjection());
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final textController = TextEditingController();

  final valueController = ValueController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Valor
            Obx(
              () {
                return Text("Valor definido: ${valueController.definedValue}");
              },
            ),

            //Campo de Texto
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: TextField(
                controller: textController,
              ),
            ),

            //Botao
            //GetX usado junto com .obs
            //GetBuilder usado junto com Update
            // GetX<ValueController>(
            //     init: valueController,
            //     builder: (ctrl) {
            //       return ctrl.isLoading.value
            //           ? Container(
            //               margin: const EdgeInsets.only(top: 16),
            //               child: const CircularProgressIndicator())
            //           : ElevatedButton(
            //               onPressed: () {
            //                 String value = textController.text;

            //                 valueController.setValue(value);
            //               },
            //               child: const Text("Confirmar"));
            //     })

            //Obx
            Obx(() {
              return valueController.isLoading.value
                  ? Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: const CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () {
                        String value = textController.text;

                        valueController.setValue(value);
                      },
                      child: const Text("Confirmar"));
            })
          ],
        ),
      ),
    );
  }
}
