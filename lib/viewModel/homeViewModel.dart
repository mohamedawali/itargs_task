import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:itargs_task/model/webService/webService.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

import '../model/likesModel.dart';
import '../model/responseModel/audioModel.dart';


class HomeViewModel {
  DioHelper dioHelper = DioHelper();
  String? audioUrl;
  String? localFilePath;
  HomeModel? model;
  HomeViewModel() {
    model = HomeModel([
      ListItem('List Item 0', false),
      ListItem('List Item 1', false),
      ListItem('List Item 2', false),
    ]);
  }
//parse json and get audio url and set url in audioPlayer
Future <void> getAudio(AudioPlayer? audioPlayer) async {
    var audioResponse = await dioHelper.getAudio();
    audioUrl = AudioResponse.fromJson(audioResponse).audioFile!.audioUrl;
    audioPlayer!.setUrl(audioUrl!);
  }
//check if localFilePath exist or no
  Future<bool> checkAudioFile() async {
    final directory = await getApplicationDocumentsDirectory();
    localFilePath = '${directory.path}/audio.mp3';

    if (await File(localFilePath!).exists()) {
      return true;
    } else {
      return false;
    }
  }
//download audio in local
  Future downloadAudioFile(String audioUrl) async {
    final directory = await getApplicationDocumentsDirectory();
    final localFilePath = '${directory.path}/audio.mp3';

    await dioHelper.downloadAudioFile(audioUrl, localFilePath);
  }
//check internet
  Future<bool> checkInternet() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }


//return  all item
  List<ListItem> get items => model!.items;
// select item favorite
  void toggleLike(int index) {
    model!.items[index].isLiked = !model!.items[index].isLiked;
  }
}

