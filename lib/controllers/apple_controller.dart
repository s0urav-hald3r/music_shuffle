import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:music_shuffle/config/constants.dart';
import 'package:music_shuffle/config/navigator_key.dart';
import 'package:music_shuffle/models/ypl_model.dart';
import 'package:music_shuffle/utils/local_storage.dart';
import 'package:http/http.dart' as http;
import 'package:music_shuffle/utils/popup.dart';

class AppleController extends GetxController {
  static AppleController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    isConnected = LocalStorage.getData(isAppleAuthenticated, KeyType.BOOL);
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

  Future<void> fetchPlaylist(String userToken) async {
    String devToken = dotenv.env['APPLE_DEV_TOKEN'] ?? '';
    if (devToken.isEmpty) return;

    isFetching = true;

    String accessToken = LocalStorage.getData(youtubeToken, KeyType.STR);
    if (accessToken.isEmpty) {
      isFetching = false;
      return;
    }

    try {
      final response = await http.get(
        Uri.parse('https://api.music.apple.com/v1/me/library/playlists'),
        headers: {
          'Authorization': 'Bearer $devToken',
          'Music-User-Token': userToken,
        },
      );

      if (response.statusCode == 200) {
        _playList.clear();
        log('response.statusCode: ${response.statusCode}');
        isFetching = false;
        // final data = json.decode(response.body);

        // for (var pl in data['items']) {
        // _playList.add(YplModel.fromJson(pl));
        // }
      } else {
        isConnected = false;
        final error = json.decode(response.body);
        await LocalStorage.addData(isAppleAuthenticated, false);
        await LocalStorage.addData(appleToken, '');
        TPopup.errorSnackbar(message: error['status']);
        NavigatorKey.pop();
        throw Exception('Failed to fetch playlists: ${response.statusCode}');
      }
    } catch (e) {
      isFetching = false;
    }
  }
}
