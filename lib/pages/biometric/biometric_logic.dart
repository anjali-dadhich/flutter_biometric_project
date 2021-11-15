import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:ofa_flutter_biometric/pages/biometric/biometric_view.dart';

import 'biometric_state.dart';

class BiometricLogic extends GetxController {
  final LocalAuthentication _localAuth = LocalAuthentication();
  final Rx<BiometricAuthenticationState> _authenticationStateStream = const BiometricAuthenticationState().obs;
  final RxBool _isBiometricSupportedStream = false.obs;

  bool get isBiometricsSupported => _isBiometricSupportedStream.value;
  BiometricAuthenticationState get authState => _authenticationStateStream.value;

  @override
  void onInit() {
    _checkIfDeviceSupportBiometric();
    _authenticationStateStream.value = UnAuthenticated();
    super.onInit();
  }

  Future<void> signInWithBiometrics() async {
    try {
      var isAuthenticated = await _localAuth.authenticate(
          localizedReason: 'Authenticate with your biometrics',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);
      if (isAuthenticated) {
        _authenticationStateStream.value = Authenticated();
      } else {
        _authenticationStateStream.value = UnAuthenticated();
      }
    } on PlatformException catch (e) {
      // display this error if you want
      print(e.message);
    }
  }

  void signOut() {
    _authenticationStateStream.value = UnAuthenticated();
  }

  Future<void> _checkIfDeviceSupportBiometric() async {
    _isBiometricSupportedStream.value = await _localAuth.isDeviceSupported();
  }

}

