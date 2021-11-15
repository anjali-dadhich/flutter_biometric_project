import 'package:equatable/equatable.dart';

class BiometricAuthenticationState extends Equatable{
  const BiometricAuthenticationState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UnAuthenticated extends BiometricAuthenticationState {}

class Authenticated extends BiometricAuthenticationState {
}