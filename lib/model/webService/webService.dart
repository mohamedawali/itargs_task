import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../constant/constant.dart';

class DioHelper {
  Dio? dio;
  DioHelper() {
    dio = Dio(
      BaseOptions(
        baseUrl: url,
        receiveDataWhenStatusError: true,
      ),
    );
  }
  //Get Audio from Api
  Future<Map<String, dynamic>> getAudio() async {
    Response response = await dio!.get('v4/chapter_recitations/1/1');
    return response.data;
  }
// Download Audio   and store in local
  downloadAudioFile(String audioUrl, String localFilePath) async {
    try {
      await dio!.download(audioUrl, localFilePath);
    } catch (e) {
      print('Error downloading audio: $e');
      return null;
    }

    return localFilePath;
  }
}
