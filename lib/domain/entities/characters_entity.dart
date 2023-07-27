class Characters {
    int? code;
    String? status;
    String? copyright;
    String? attributionText;
    String? attributionHtml;
    String? etag;
    DataCharacters? data;

    Characters({
        this.code,
        this.status,
        this.copyright,
        this.attributionText,
        this.attributionHtml,
        this.etag,
        this.data,
    });

}

class DataCharacters {
    int? offset;
    int? limit;
    int? total;
    int? count;
    List<ResultCharacters>? results;

    DataCharacters({
        this.offset,
        this.limit,
        this.total,
        this.count,
        this.results,
    });

}

class ResultCharacters {
    int? id;
    String? name;
    String? description;
    String? modified;
    ThumbnailCharacters? thumbnail;
    String? resourceUri;
    ComicsCharacters? comics;
    ComicsCharacters? series;
    StoriesCharacters? stories;
    ComicsCharacters? events;
    List<UrlCharacters>? urls;

    ResultCharacters({
        this.id,
        this.name,
        this.description,
        this.modified,
        this.thumbnail,
        this.resourceUri,
        this.comics,
        this.series,
        this.stories,
        this.events,
        this.urls,
    });

}

class ComicsCharacters {
    int? available;
    String? collectionUri;
    List<ComicsItemCharacters>? items;
    int? returned;

    ComicsCharacters({
        this.available,
        this.collectionUri,
        this.items,
        this.returned,
    });

}

class ComicsItemCharacters {
    String? resourceUri;
    String? name;

    ComicsItemCharacters({
        this.resourceUri,
        this.name,
    });

}

class StoriesCharacters {
    int? available;
    String? collectionUri;
    List<StoriesItemCharacters>? items;
    int? returned;

    StoriesCharacters({
        this.available,
        this.collectionUri,
        this.items,
        this.returned,
    });

}

class StoriesItemCharacters {
    String? resourceUri;
    String? name;
    String? type;

    StoriesItemCharacters({
        this.resourceUri,
        this.name,
        this.type,
    });

}

class ThumbnailCharacters {
    String? path;
    String? extension;

    ThumbnailCharacters({
        this.path,
        this.extension,
    });

}

class UrlCharacters {
    String? type;
    String? url;

    UrlCharacters({
        this.type,
        this.url,
    });

}
