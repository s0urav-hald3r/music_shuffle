import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:music_shuffle/config/constants.dart';
import 'package:music_shuffle/utils/local_storage.dart';

class YoutubeController extends GetxController {
  static YoutubeController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    isConnected = LocalStorage.getData(isYoutubeAuthenticated, KeyType.BOOL);
  }

  // Private variables
  final RxBool _isConnecting = false.obs;
  final RxBool _isConnected = false.obs;

  // Getters
  bool get isConnecting => _isConnecting.value;
  bool get isConnected => _isConnected.value;

  // Setters
  set isConnecting(value) => _isConnecting.value = value;
  set isConnected(value) => _isConnected.value = value;

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
      final token = auth.accessToken ?? '';
      if (token.isNotEmpty) {
        isConnected = true;
        await LocalStorage.addData(isYoutubeAuthenticated, true);
        await LocalStorage.addData(youtubeToken, token);
      }

      isConnecting = false;
    } catch (e) {
      log('Error during Google Sign-In: $e');
      isConnecting = false;
      return;
    }
  }
}
