class Comics {
    int? code;
    String? status;
    String? copyright;
    String? attributionText;
    String? attributionHtml;
    String? etag;
    DataComics? data;

    Comics({
        this.code,
        this.status,
        this.copyright,
        this.attributionText,
        this.attributionHtml,
        this.etag,
        this.data,
    });

}

class DataComics {
    int? offset;
    int? limit;
    int? total;
    int? count;
    List<ResultComics>? results;

    DataComics({
        this.offset,
        this.limit,
        this.total,
        this.count,
        this.results,
    });

}

class ResultComics {
    int? id;
    int? digitalId;
    String? title;
    int? issueNumber;
    String? variantDescription;
    String? description;
    String? modified;
    String? isbn;
    String? upc;
    String? diamondCode;
    String? ean;
    String? issn;
    String? format;
    int? pageCount;
    String? resourceUri;
    List<UrlComics>? urls;
    SeriesComics? series;
    List<SeriesComics>? variants;
    List<SeriesComics>? collectedIssues;
    List<DateComics>? dates;
    List<PriceComics>? prices;
    ThumbnailComics? thumbnail;
    List<ThumbnailComics>? images;
    CreatorsComics? creators;
    CharactersComics? characters;
    StoriesComics? stories;
    CharactersComics? events;

    ResultComics({
        this.id,
        this.digitalId,
        this.title,
        this.issueNumber,
        this.variantDescription,
        this.description,
        this.modified,
        this.isbn,
        this.upc,
        this.diamondCode,
        this.ean,
        this.issn,
        this.format,
        this.pageCount,
        this.resourceUri,
        this.urls,
        this.series,
        this.variants,
        this.collectedIssues,
        this.dates,
        this.prices,
        this.thumbnail,
        this.images,
        this.creators,
        this.characters,
        this.stories,
        this.events,
    });

}

class CharactersComics {
    int? available;
    String? collectionUri;
    List<SeriesComics>? items;
    int? returned;

    CharactersComics({
        this.available,
        this.collectionUri,
        this.items,
        this.returned,
    });

}

class SeriesComics {
    String? resourceUri;
    String? name;

    SeriesComics({
        this.resourceUri,
        this.name,
    });

}

class CreatorsComics {
    int? available;
    String? collectionUri;
    List<CreatorsItemComics>? items;
    int? returned;

    CreatorsComics({
        this.available,
        this.collectionUri,
        this.items,
        this.returned,
    });

}

class CreatorsItemComics {
    String? resourceUri;
    String? name;
    String? role;

    CreatorsItemComics({
        this.resourceUri,
        this.name,
        this.role,
    });

}

class DateComics {
    String? type;
    String? date;

    DateComics({
        this.type,
        this.date,
    });

}

class ThumbnailComics {
    String? path;
    String? extension;

    ThumbnailComics({
        this.path,
        this.extension,
    });

}

class PriceComics {
    String? type;
    double? price;

    PriceComics({
        this.type,
        this.price,
    });

}

class StoriesComics {
    int? available;
    String? collectionUri;
    List<StoriesItemComics>? items;
    int? returned;

    StoriesComics({
        this.available,
        this.collectionUri,
        this.items,
        this.returned,
    });

}

class StoriesItemComics {
    String? resourceUri;
    String? name;
    String? type;

    StoriesItemComics({
        this.resourceUri,
        this.name,
        this.type,
    });

}

class TextObjectComics {
    String? type;
    String? language;
    String? text;

    TextObjectComics({
        this.type,
        this.language,
        this.text,
    });

}

class UrlComics {
    String? type;
    String? url;

    UrlComics({
        this.type,
        this.url,
    });

}
