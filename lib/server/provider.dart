import 'package:flutter/foundation.dart';
import 'package:interview/server/backend_methods.dart';

class ProvidersMethods extends ChangeNotifier {
  final BackendMethods _backendMethods = BackendMethods();

  void loginWithEmailAndPasswordProvider(
      {required String email, required password}) async {
    _backendMethods.loginWithEmailAndPassword(email: email, password: password);
    notifyListeners();
  }

  void registerWithEmailAndPasswordProvider(
      {required String email, required password}) async {
    _backendMethods.registerWithEmailAndPassword(email: email, password: password);
    notifyListeners();
  }
}
