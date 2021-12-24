import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'biometric_logic.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class BiometricPage extends StatelessWidget {

  final biometricLogicController = Get.put(BiometricLogic());

   BiometricPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Biometric Login!!!!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
          Obx(() {
            if (biometricLogicController.isBiometricsSupported) {
              return ElevatedButton(
                onPressed: () {
                  biometricLogicController.signInWithBiometrics();
                },
                child: const Text('Login with biometrics'),
              );
            } else {
              return Text(
                'Oops, device does not support biometrics',
                style: Get.textTheme.bodyText1!.copyWith(color: Get.theme.errorColor),
              );
            }
          })
            ],
          ),
        ),
      )
    );
  }
}
