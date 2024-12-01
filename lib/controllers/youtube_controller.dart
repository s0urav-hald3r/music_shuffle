import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:music_shuffle/config/constants.dart';
import 'package:music_shuffle/config/navigator_key.dart';
import 'package:music_shuffle/utils/local_storage.dart';
import 'package:http/http.dart' as http;
import 'package:music_shuffle/utils/popup.dart';

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
  final RxBool _isFetching = false.obs;

  // Getters
  bool get isConnecting => _isConnecting.value;
  bool get isConnected => _isConnected.value;
  bool get isFetching => _isFetching.value;

  // Setters
  set isConnecting(value) => _isConnecting.value = value;
  set isConnected(value) => _isConnected.value = value;
  set isFetching(value) => _isFetching.value = value;

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

  Future<void> fetchPlaylist() async {
    isFetching = true;

    String accessToken = LocalStorage.getData(youtubeToken, KeyType.STR);
    if (accessToken.isEmpty) {
      isFetching = false;
      return;
    }

    try {
      const String url = 'https://www.googleapis.com/youtube/v3/playlists';
      final response = await http.get(
        Uri.parse('$url?part=snippet&mine=true&maxResults=20'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        log('response.statusCode: ${response.statusCode}');
        isFetching = false;
        final data = json.decode(response.body);
        log(data['items']);
      } else {
        isConnected = false;
        final error = json.decode(response.body);
        await LocalStorage.addData(isYoutubeAuthenticated, false);
        await LocalStorage.addData(youtubeToken, '');
        TPopup.errorSnackbar(message: error['status']);
        NavigatorKey.pop();
        throw Exception('Failed to fetch playlists: ${response.statusCode}');
      }
    } catch (e) {
      isFetching = false;
    }
  }
}
