import 'package:complete_ecommerce/src/views/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController extends GetxController {
  var isGoogleSignInLoading = false.obs;

  Future<void> signInWithGoogle() async {
    try {
      // Set the loading state to true while the sign-in process is ongoing
      isGoogleSignInLoading(true);

      final GoogleSignIn googleSignIn = GoogleSignIn();
      // Trigger the Google Authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      // Obtain the Google Authentication credentials
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new Firebase Auth credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google Auth credential
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Set the loading state back to false after the sign-in process is complete
      isGoogleSignInLoading(false);

      // Navigate to the home screen
      Get.offAll(homescreen());
    } catch (error) {
      print('Error signing in with Google: $error');
      // Handle error as needed
      isGoogleSignInLoading(false);
    }
  }
}
