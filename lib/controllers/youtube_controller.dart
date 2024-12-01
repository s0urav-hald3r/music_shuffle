import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class YoutubeController extends GetxController {
  static YoutubeController get instance => Get.find();

  // Private variables
  final RxBool _isConnecting = false.obs;

  // Getters
  bool get isConnecting => _isConnecting.value;

  // Setters
  set isConnecting(value) => _isConnecting.value = value;

  /// [Authentication]
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'https://www.googleapis.com/auth/youtube.readonly',
    ],
  );

  Future<void> authentication() async {
    isConnecting = true;
    try {
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account == null) {
        isConnecting = false;
        // User canceled the sign-in
        return;
      }
      final GoogleSignInAuthentication auth = await account.authentication;
      // Use this token to call YouTube API
      log(auth.accessToken.toString());
      isConnecting = false;
    } catch (e) {
      log('Error during Google Sign-In: $e');
      isConnecting = false;
      return;
    }
  }
}
