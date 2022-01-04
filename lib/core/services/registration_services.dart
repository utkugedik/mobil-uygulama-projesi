import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class IRegistrationServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<UserCredential> signInWithMail(String mail, String password);
}

class RegistrationServices extends IRegistrationServices {
  FirebaseAuth get _firebaseAuth => super.firebaseAuth;

  @override
  Future<UserCredential> signInWithMail(String mail, String password) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(email: mail, password: password);
    } catch (e) {
      rethrow;
    }
  }
}

final registrationServicesProvider = Provider((_) => RegistrationServices());
