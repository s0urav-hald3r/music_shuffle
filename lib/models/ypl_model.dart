class YplModel {
  YplModel({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  final String? kind;
  final String? etag;
  final String? id;
  final Snippet? snippet;

  factory YplModel.fromJson(Map<String, dynamic> json) {
    return YplModel(
      kind: json["kind"],
      etag: json["etag"],
      id: json["id"],
      snippet:
          json["snippet"] == null ? null : Snippet.fromJson(json["snippet"]),
    );
  }
}

class Snippet {
  Snippet({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.localized,
  });

  final DateTime? publishedAt;
  final String? channelId;
  final String? title;
  final String? description;
  final Thumbnails? thumbnails;
  final String? channelTitle;
  final Localized? localized;

  factory Snippet.fromJson(Map<String, dynamic> json) {
    return Snippet(
      publishedAt: DateTime.tryParse(json["publishedAt"] ?? ""),
      channelId: json["channelId"],
      title: json["title"],
      description: json["description"],
      thumbnails: json["thumbnails"] == null
          ? null
          : Thumbnails.fromJson(json["thumbnails"]),
      channelTitle: json["channelTitle"],
      localized: json["localized"] == null
          ? null
          : Localized.fromJson(json["localized"]),
    );
  }
}

class Localized {
  Localized({
    required this.title,
    required this.description,
  });

  final String? title;
  final String? description;

  factory Localized.fromJson(Map<String, dynamic> json) {
    return Localized(
      title: json["title"],
      description: json["description"],
    );
  }
}

class Thumbnails {
  Thumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
    required this.standard,
    required this.maxres,
  });

  final Default? thumbnailsDefault;
  final Default? medium;
  final Default? high;
  final Default? standard;
  final Default? maxres;

  factory Thumbnails.fromJson(Map<String, dynamic> json) {
    return Thumbnails(
      thumbnailsDefault:
          json["default"] == null ? null : Default.fromJson(json["default"]),
      medium: json["medium"] == null ? null : Default.fromJson(json["medium"]),
      high: json["high"] == null ? null : Default.fromJson(json["high"]),
      standard:
          json["standard"] == null ? null : Default.fromJson(json["standard"]),
      maxres: json["maxres"] == null ? null : Default.fromJson(json["maxres"]),
    );
  }
}

class Default {
  Default({
    required this.url,
    required this.width,
    required this.height,
  });

  final String? url;
  final int? width;
  final int? height;

  factory Default.fromJson(Map<String, dynamic> json) {
    return Default(
      url: json["url"],
      width: json["width"],
      height: json["height"],
    );
  }
}
