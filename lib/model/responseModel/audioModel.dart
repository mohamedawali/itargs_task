class AudioResponse {
  AudioFile? audioFile;

  AudioResponse({this.audioFile});

  AudioResponse.fromJson(Map<String, dynamic> json) {
    audioFile = json['audio_file'] != null
        ? new AudioFile.fromJson(json['audio_file'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.audioFile != null) {
      data['audio_file'] = this.audioFile!.toJson();
    }
    return data;
  }
}

class AudioFile {
  int? id;
  int? chapterId;
  double? fileSize;
  String? format;
  String? audioUrl;

  AudioFile(
      {this.id, this.chapterId, this.fileSize, this.format, this.audioUrl});

  AudioFile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chapterId = json['chapter_id'];
    fileSize = json['file_size'];
    format = json['format'];
    audioUrl = json['audio_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chapter_id'] = this.chapterId;
    data['file_size'] = this.fileSize;
    data['format'] = this.format;
    data['audio_url'] = this.audioUrl;
    return data;
  }
}
