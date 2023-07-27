import 'dart:convert';

import 'package:marvel_api/domain/entities/comics_entity.dart';

ComicsModel comicsModelFromJson(String str) => ComicsModel.fromJson(json.decode(str));


class ComicsModel extends Comics {


    ComicsModel({
        super.code,
        super.status,
        super.copyright,
        super.attributionText,
        super.attributionHtml,
        super.etag,
        super.data,
    });

    factory ComicsModel.fromJson(Map<String, dynamic> json) => ComicsModel(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );


}

class Data extends DataComics {

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
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );


}
class Result extends ResultComics {
  

    Result({
        super.id,
        super.digitalId,
        super.title,
        super.issueNumber,
        super.variantDescription,
        super.description,
        super.modified,
        super.isbn,
        super.upc,
        super.diamondCode,
        super.ean,
        super.issn,
        super.format,
        super.pageCount,
        super.resourceUri,
        super.urls,
        super.series,
        super.variants,
        super.collectedIssues,
        super.dates,
        super.prices,
        super.thumbnail,
        super.images,
        super.creators,
        super.characters,
        super.stories,
        super.events,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        digitalId: json["digitalId"],
        title: json["title"],
        issueNumber: json["issueNumber"],
        variantDescription: json["variantDescription"],
        description: json["description"],
        modified: json["modified"],
        isbn: json["isbn"],
        upc: json["upc"],
        diamondCode: json["diamondCode"],
        ean: json["ean"],
        issn: json["issn"],
        format: json["format"],
        pageCount: json["pageCount"],
      
        resourceUri: json["resourceURI"],
        urls: json["urls"] == null ? [] : List<Url>.from(json["urls"]!.map((x) => Url.fromJson(x))),
        series: json["series"] == null ? null : Series.fromJson(json["series"]),
        variants: json["variants"] == null ? [] : List<Series>.from(json["variants"]!.map((x) => Series.fromJson(x))),
      
        collectedIssues: json["collectedIssues"] == null ? [] : List<Series>.from(json["collectedIssues"]!.map((x) => Series.fromJson(x))),
        dates: json["dates"] == null ? [] : List<Date>.from(json["dates"]!.map((x) => Date.fromJson(x))),
        prices: json["prices"] == null ? [] : List<Price>.from(json["prices"]!.map((x) => Price.fromJson(x))),
        thumbnail: json["thumbnail"] == null ? null : Thumbnail.fromJson(json["thumbnail"]),
        images: json["images"] == null ? [] : List<Thumbnail>.from(json["images"]!.map((x) => Thumbnail.fromJson(x))),
        creators: json["creators"] == null ? null : Creators.fromJson(json["creators"]),
        characters: json["characters"] == null ? null : Characters.fromJson(json["characters"]),
        stories: json["stories"] == null ? null : Stories.fromJson(json["stories"]),
        events: json["events"] == null ? null : Characters.fromJson(json["events"]),
    );

}

class Characters extends CharactersComics {
 

    Characters({
        super.available,
        super.collectionUri,
        super.items,
        super.returned,
    });

    factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null ? [] : List<Series>.from(json["items"]!.map((x) => Series.fromJson(x))),
        returned: json["returned"],
    );


}

class Series  extends SeriesComics{


    Series({
        super.resourceUri,
        super.name,
    });

    factory Series.fromJson(Map<String, dynamic> json) => Series(
        resourceUri: json["resourceURI"],
        name: json["name"],
    );


}

class Creators extends CreatorsComics {
 

    Creators({
        super.available,
        super.collectionUri,
        super.items,
        super.returned,
    });

    factory Creators.fromJson(Map<String, dynamic> json) => Creators(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null ? [] : List<CreatorsItem>.from(json["items"]!.map((x) => CreatorsItem.fromJson(x))),
        returned: json["returned"],
    );

 
}

class CreatorsItem extends CreatorsItemComics{


    CreatorsItem({
        super.resourceUri,
        super.name,
        super.role,
    });

    factory CreatorsItem.fromJson(Map<String, dynamic> json) => CreatorsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
    );

   
}

class Date  extends DateComics{


    Date({
        super.type,
        super.date,
    });

    factory Date.fromJson(Map<String, dynamic> json) => Date(
        type: json["type"],
        date: json["date"],
    );

}

class Thumbnail extends ThumbnailComics {
 

    Thumbnail({
        super.path,
        super.extension,
    });

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
    );

}

class Price extends PriceComics {


    Price({
        super.type,
        super.price,
    });

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        type: json["type"],
        price: json["price"]?.toDouble(),
    );


}

class Stories extends StoriesComics {


    Stories({
        super.available,
        super.collectionUri,
        super.items,
        super.returned,
    });

    factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null ? [] : List<StoriesItem>.from(json["items"]!.map((x) => StoriesItem.fromJson(x))),
        returned: json["returned"],
    );


}

class StoriesItem extends StoriesItemComics {


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

class TextObject extends TextObjectComics {


    TextObject({
        super.type,
        super.language,
        super.text,
    });

    factory TextObject.fromJson(Map<String, dynamic> json) => TextObject(
        type: json["type"],
        language: json["language"],
        text: json["text"],
    );


}

class Url extends UrlComics{
 

    Url({
        super.type,
        super.url,
    });

    factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json["type"],
        url: json["url"],
    );


}




