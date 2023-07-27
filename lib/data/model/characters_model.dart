import 'dart:convert';

import 'package:marvel_api/domain/entities/characters_entity.dart';

CharactersModel characterModelFromJson(String str) =>
    CharactersModel.fromJson(json.decode(str));

class CharactersModel extends Characters {
  CharactersModel({
    super.code,
    super.status,
    super.copyright,
    super.attributionText,
    super.attributionHtml,
    super.etag,
    super.data,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) =>
      CharactersModel(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
}

class Data extends DataCharacters {
  Data({
    super.offset,
    super.limit,
    super.total,
    super.count,
    super.results,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );
}

class Result extends ResultCharacters {
  Result({
    super.id,
    super.name,
    super.description,
    super.modified,
    super.thumbnail,
    super.resourceUri,
    super.comics,
    super.series,
    super.stories,
    super.events,
    super.urls,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromJson(json["thumbnail"]),
        resourceUri: json["resourceURI"],
        comics: json["comics"] == null ? null : Comics.fromJson(json["comics"]),
        series: json["series"] == null ? null : Comics.fromJson(json["series"]),
        stories:
            json["stories"] == null ? null : Stories.fromJson(json["stories"]),
        events: json["events"] == null ? null : Comics.fromJson(json["events"]),
        urls: json["urls"] == null
            ? []
            : List<Url>.from(json["urls"]!.map((x) => Url.fromJson(x))),
      );
}

class Comics extends ComicsCharacters {
  Comics({
    super.available,
    super.collectionUri,
    super.items,
    super.returned,
  });

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<ComicsItem>.from(
                json["items"]!.map((x) => ComicsItem.fromJson(x))),
        returned: json["returned"],
      );
}

class ComicsItem extends ComicsItemCharacters {
  ComicsItem({
    super.resourceUri,
    super.name,
  });

  factory ComicsItem.fromJson(Map<String, dynamic> json) => ComicsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );
}

class Stories extends StoriesCharacters {
  Stories({
    super.available,
    super.collectionUri,
    super.items,
    super.returned,
  });

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<StoriesItem>.from(
                json["items"]!.map((x) => StoriesItem.fromJson(x))),
        returned: json["returned"],
      );
}

class StoriesItem extends StoriesItemCharacters {
  StoriesItem({
    super.resourceUri,
    super.name,
    super.type,
  });

  factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: json["type"],
      );
}

class Thumbnail extends ThumbnailCharacters {
  Thumbnail({
    super.path,
    super.extension,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
      );
}



class Url extends UrlCharacters {
  Url({
    super.type,
    super.url,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json["type"],
        url: json["url"],
      );
}
