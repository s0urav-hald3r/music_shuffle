import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:get/get.dart';
import 'package:music_shuffle/config/constants.dart';
import 'package:music_shuffle/config/navigator_key.dart';
import 'package:music_shuffle/models/ypl_model.dart';
import 'package:music_shuffle/utils/local_storage.dart';
import 'package:http/http.dart' as http;
import 'package:music_shuffle/utils/popup.dart';

class SpotifyController extends GetxController {
  static SpotifyController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    isConnected = LocalStorage.getData(isSpotifyAuthenticated, KeyType.BOOL);
  }

  // Private variables
  final RxBool _isConnecting = false.obs;
  final RxBool _isConnected = false.obs;
  final RxBool _isFetching = false.obs;
  final RxList _playList = <YplModel>[].obs;

  // Getters
  bool get isConnecting => _isConnecting.value;
  bool get isConnected => _isConnected.value;
  bool get isFetching => _isFetching.value;
  List get playList => _playList;

  // Setters
  set isConnecting(value) => _isConnecting.value = value;
  set isConnected(value) => _isConnected.value = value;
  set isFetching(value) => _isFetching.value = value;
  set playList(value) => _playList.value = value;

  /// [Authentication]
  final String clientId = dotenv.env['SPOTIFY_ID'] ?? '';
  final String clientSecret = dotenv.env['SPOTIFY_SECRET'] ?? '';
  final String redirectUri = 'playlisttransfer://callback';
  final String scopes = 'playlist-read-private playlist-read-collaborative';

  Future<void> authentication() async {
    isConnecting = true;
    try {
      final authUrl = Uri.https('accounts.spotify.com', '/authorize', {
        'client_id': clientId,
        'response_type': 'code',
        'redirect_uri': redirectUri,
        'scope': scopes,
      });

      // Open the login page and get the authentication code
      final result = await FlutterWebAuth.authenticate(
        url: authUrl.toString(),
        callbackUrlScheme: 'playlisttransfer',
      );

      // Extract the authorization code
      String code = Uri.parse(result).queryParameters['code'] ?? '';
      if (code.isNotEmpty) {
        isConnected = true;
        await LocalStorage.addData(isSpotifyAuthenticated, true);
        await LocalStorage.addData(spotifyToken, code);
      }
      isConnecting = false;
    } catch (e) {
      log('Error during Spotify Sign-In: $e');
      isConnecting = false;
      return;
    }
  }

  Future<String?> getAccessToken(String code) async {
    final tokenUrl = Uri.parse('https://accounts.spotify.com/api/token');

    final response = await http.post(
      tokenUrl,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}',
      },
      body: {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': redirectUri,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data['access_token'];
    } else {
      log('Error fetching access token: ${response.body}');
      return null;
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
        _playList.clear();
        log('response.statusCode: ${response.statusCode}');
        isFetching = false;
        final data = json.decode(response.body);

        for (var pl in data['items']) {
          _playList.add(YplModel.fromJson(pl));
        }
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
