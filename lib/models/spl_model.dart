class SplModel {
  SplModel({
    required this.collaborative,
    required this.description,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.owner,
    required this.primaryColor,
    required this.public,
    required this.snapshotId,
    required this.tracks,
    required this.type,
    required this.uri,
  });

  final bool? collaborative;
  final String? description;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final List<Image> images;
  final String? name;
  final Owner? owner;
  final dynamic primaryColor;
  final bool? public;
  final String? snapshotId;
  final Tracks? tracks;
  final String? type;
  final String? uri;

  factory SplModel.fromJson(Map<String, dynamic> json) {
    return SplModel(
      collaborative: json["collaborative"],
      description: json["description"],
      externalUrls: json["external_urls"] == null
          ? null
          : ExternalUrls.fromJson(json["external_urls"]),
      href: json["href"],
      id: json["id"],
      images: json["images"] == null
          ? []
          : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      name: json["name"],
      owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
      primaryColor: json["primary_color"],
      public: json["public"],
      snapshotId: json["snapshot_id"],
      tracks: json["tracks"] == null ? null : Tracks.fromJson(json["tracks"]),
      type: json["type"],
      uri: json["uri"],
    );
  }
}

class ExternalUrls {
  ExternalUrls({
    required this.spotify,
  });

  final String? spotify;

  factory ExternalUrls.fromJson(Map<String, dynamic> json) {
    return ExternalUrls(
      spotify: json["spotify"],
    );
  }
}

class Image {
  Image({
    required this.height,
    required this.url,
    required this.width,
  });

  final dynamic height;
  final String? url;
  final dynamic width;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      height: json["height"],
      url: json["url"],
      width: json["width"],
    );
  }
}

class Owner {
  Owner({
    required this.displayName,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.type,
    required this.uri,
  });

  final String? displayName;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final String? type;
  final String? uri;

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      displayName: json["display_name"],
      externalUrls: json["external_urls"] == null
          ? null
          : ExternalUrls.fromJson(json["external_urls"]),
      href: json["href"],
      id: json["id"],
      type: json["type"],
      uri: json["uri"],
    );
  }
}

class Tracks {
  Tracks({
    required this.href,
    required this.total,
  });

  final String? href;
  final int? total;

  factory Tracks.fromJson(Map<String, dynamic> json) {
    return Tracks(
      href: json["href"],
      total: json["total"],
    );
  }
}
