import 'package:firebase_auth/firebase_auth.dart';
import '../models/fb_response.dart';

class FbAuthController {
  ///Functions:
  /// 1) signInWithEmailAndPassword
  /// 2) createAccountWithEmailAndPassword
  /// 3) signOut
  /// 4) forgetPassword
  ///

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FbResponse> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      bool verified = userCredential.user!.emailVerified;
      if (!userCredential.user!.emailVerified) {
        await userCredential.user!.sendEmailVerification();
        await _auth.signOut();
      }

      return FbResponse(
        verified ? 'Logged in successfully' : 'Verify your email',
        userCredential.user!.emailVerified,
      );
    } on FirebaseAuthException catch (e) {
      print('Exception 1');
      return FbResponse(e.message ?? '', false);
    } catch (e) {
      print('Exception 2');
      return FbResponse('Something went wrong', false);
    }
  }

  Future<FbResponse> createAccount(String email, String password) async {
    try {
      print("After");
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      print("Before");

      await userCredential.user!.sendEmailVerification();
      await _auth.signOut();
      return FbResponse('Registered successfully, verify email', true);
    } on FirebaseAuthException catch (e) {
      return FbResponse(e.message ?? '', false);
    } catch (e) {
      return FbResponse('Something went wrong', false);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  User get currentUser => _auth.currentUser!;

  Future<FbResponse> forgetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return FbResponse('Reset email sent successfully', true);
    } on FirebaseAuthException catch (e) {
      return FbResponse(e.message ?? '', false);
    } catch (e) {
      return FbResponse('Something went wrong', false);
    }
  }

  bool get loggedIn => _auth.currentUser != null;
}
