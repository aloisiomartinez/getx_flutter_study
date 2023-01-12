import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_test/value_controller.dart';

void main() {
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
        home: HomePage());
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
            GetX<ValueController>(
              init: valueController,
              builder: (ctrl) {
                return Text("Valor definido: ${ctrl.definedValue}");
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
            GetX<ValueController>(
                init: valueController,
                builder: (ctrl) {
                  return ctrl.isLoading.value
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