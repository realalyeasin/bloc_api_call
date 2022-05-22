// To parse this JSON data, do
//
//     final feed = feedFromJson(jsonString);

import 'dart:convert';

Feed feedFromJson(String str) => Feed.fromJson(json.decode(str));

String feedToJson(Feed data) => json.encode(data.toJson());

class Feed {
  Feed({
    required this.meta,
    required this.response,
  });

  Meta? meta;
  Response? response;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
    meta: Meta.fromJson(json["meta"]),
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta?.toJson(),
    "response": response?.toJson(),
  };
}

class Meta {
  Meta({
    required this.code,
  });

  int? code;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
  };
}

class Response {
  Response({
    required this.geocoding,
    required this.type,
    required this.features,
    required this.bbox,
  });

  Geocoding? geocoding;
  String? type;
  List<Feature?> features;
  List<double?> bbox;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    geocoding: Geocoding.fromJson(json["geocoding"]),
    type: json["type"],
    features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
    bbox: List<double>.from(json["bbox"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "geocoding": geocoding?.toJson(),
    "type": type,
    "features": List<dynamic>.from(features.map((x) => x?.toJson())),
    "bbox": List<dynamic>.from(bbox.map((x) => x)),
  };
}

class Feature {
  Feature({
    required this.type,
    required this.geometry,
    required this.properties,
    required this.bbox,
  });

  FeatureType? type;
  Geometry? geometry;
  Properties? properties;
  List<double?> bbox;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    type: featureTypeValues.map[json["type"]],
    geometry: Geometry.fromJson(json["geometry"]),
    properties: Properties.fromJson(json["properties"]),
    bbox: List<double>.from(json["bbox"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": featureTypeValues.reverse[type],
    "geometry": geometry?.toJson(),
    "properties": properties?.toJson(),
    "bbox": List<dynamic>.from(bbox.map((x) => x)),
  };
}

class Geometry {
  Geometry({
    required this.type,
    required this.coordinates,
  });

  GeometryType? type;
  List<double?> coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    type: geometryTypeValues.map[json["type"]],
    coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": geometryTypeValues.reverse[type],
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

enum GeometryType { POINT }

final geometryTypeValues = EnumValues({
  "Point": GeometryType.POINT
});

class Properties {
  Properties({
    required this.id,
    required this.gid,
    required this.layer,
    required this.source,
    required this.sourceId,
    required this.name,
    required this.confidence,
    required this.matchType,
    required this.accuracy,
    required this.country,
    required this.countryGid,
    required this.countryA,
    required this.macroregion,
    required this.macroregionGid,
    required this.region,
    required this.regionGid,
    required this.locality,
    required this.localityGid,
    required this.continent,
    required this.continentGid,
    required this.label,
    required this.borough,
    required this.boroughGid,
    required this.regionA,
    required this.county,
    required this.countyGid,
    required this.countyA,
    required this.localadmin,
    required this.localadminGid,
  });

  String? id;
  String? gid;
  Layer? layer;
  Source? source;
  String? sourceId;
  Locality? name;
  int? confidence;
  MatchType? matchType;
  Accuracy? accuracy;
  String? country;
  String? countryGid;
  String? countryA;
  String? macroregion;
  String? macroregionGid;
  String? region;
  String? regionGid;
  Locality? locality;
  String? localityGid;
  Continent? continent;
  ContinentGid? continentGid;
  String? label;
  Locality? borough;
  String? boroughGid;
  String? regionA;
  String? county;
  String? countyGid;
  String? countyA;
  String? localadmin;
  String? localadminGid;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    id: json["id"],
    gid: json["gid"],
    layer: layerValues.map[json["layer"]],
    source: sourceValues.map[json["source"]],
    sourceId: json["source_id"],
    name: localityValues.map[json["name"]],
    confidence: json["confidence"],
    matchType: matchTypeValues.map[json["match_type"]],
    accuracy: accuracyValues.map[json["accuracy"]],
    country: json["country"],
    countryGid: json["country_gid"],
    countryA: json["country_a"],
    macroregion: json["macroregion"] == null ? null : json["macroregion"],
    macroregionGid: json["macroregion_gid"] == null ? null : json["macroregion_gid"],
    region: json["region"],
    regionGid: json["region_gid"],
    locality: localityValues.map[json["locality"]],
    localityGid: json["locality_gid"],
    continent: continentValues.map[json["continent"]],
    continentGid: continentGidValues.map[json["continent_gid"]],
    label: json["label"],
    borough: json["borough"] == null ? null : localityValues.map[json["borough"]],
    boroughGid: json["borough_gid"] == null ? null : json["borough_gid"],
    regionA: json["region_a"] == null ? null : json["region_a"],
    county: json["county"] == null ? null : json["county"],
    countyGid: json["county_gid"] == null ? null : json["county_gid"],
    countyA: json["county_a"] == null ? null : json["county_a"],
    localadmin: json["localadmin"] == null ? null : json["localadmin"],
    localadminGid: json["localadmin_gid"] == null ? null : json["localadmin_gid"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "gid": gid,
    "layer": layerValues.reverse[layer],
    "source": sourceValues.reverse[source],
    "source_id": sourceId,
    "name": localityValues.reverse[name],
    "confidence": confidence,
    "match_type": matchTypeValues.reverse[matchType],
    "accuracy": accuracyValues.reverse[accuracy],
    "country": country,
    "country_gid": countryGid,
    "country_a": countryA,
    "macroregion": macroregion == null ? null : macroregion,
    "macroregion_gid": macroregionGid == null ? null : macroregionGid,
    "region": region,
    "region_gid": regionGid,
    "locality": localityValues.reverse[locality],
    "locality_gid": localityGid,
    "continent": continentValues.reverse[continent],
    "continent_gid": continentGidValues.reverse[continentGid],
    "label": label,
    "borough": borough == null ? null : localityValues.reverse[borough],
    "borough_gid": boroughGid == null ? null : boroughGid,
    "region_a": regionA == null ? null : regionA,
    "county": county == null ? null : county,
    "county_gid": countyGid == null ? null : countyGid,
    "county_a": countyA == null ? null : countyA,
    "localadmin": localadmin == null ? null : localadmin,
    "localadmin_gid": localadminGid == null ? null : localadminGid,
  };
}

enum Accuracy { CENTROID }

final accuracyValues = EnumValues({
  "centroid": Accuracy.CENTROID
});

enum Locality { LONDON, CITY_OF_LONDON }

final localityValues = EnumValues({
  "City of London": Locality.CITY_OF_LONDON,
  "London": Locality.LONDON
});

enum Continent { EUROPE, NORTH_AMERICA, AFRICA }

final continentValues = EnumValues({
  "Africa": Continent.AFRICA,
  "Europe": Continent.EUROPE,
  "North America": Continent.NORTH_AMERICA
});

enum ContinentGid { WHOSONFIRST_CONTINENT_102191581, WHOSONFIRST_CONTINENT_102191575, WHOSONFIRST_CONTINENT_102191573 }

final continentGidValues = EnumValues({
  "whosonfirst:continent:102191573": ContinentGid.WHOSONFIRST_CONTINENT_102191573,
  "whosonfirst:continent:102191575": ContinentGid.WHOSONFIRST_CONTINENT_102191575,
  "whosonfirst:continent:102191581": ContinentGid.WHOSONFIRST_CONTINENT_102191581
});

enum Layer { LOCALITY, BOROUGH }

final layerValues = EnumValues({
  "borough": Layer.BOROUGH,
  "locality": Layer.LOCALITY
});

enum MatchType { EXACT }

final matchTypeValues = EnumValues({
  "exact": MatchType.EXACT
});

enum Source { WHOSONFIRST }

final sourceValues = EnumValues({
  "whosonfirst": Source.WHOSONFIRST
});

enum FeatureType { FEATURE }

final featureTypeValues = EnumValues({
  "Feature": FeatureType.FEATURE
});

class Geocoding {
  Geocoding({
    required this.version,
    required this.attribution,
    required this.query,
    required this.warnings,
    required this.timestamp,
    required this.terms,
  });

  String? version;
  String? attribution;
  Query? query;
  List<String?> warnings;
  int? timestamp;
  String? terms;

  factory Geocoding.fromJson(Map<String, dynamic> json) => Geocoding(
    version: json["version"],
    attribution: json["attribution"],
    query: Query.fromJson(json["query"]),
    warnings: List<String>.from(json["warnings"].map((x) => x)),
    timestamp: json["timestamp"],
    terms: json["terms"],
  );

  Map<String, dynamic> toJson() => {
    "version": version,
    "attribution": attribution,
    "query": query?.toJson(),
    "warnings": List<dynamic>.from(warnings.map((x) => x)),
    "timestamp": timestamp,
    "terms": terms,
  };
}

class Query {
  Query({
    required this.text,
    required this.size,
    required this.layers,
    required this.private,
    required this.lang,
    required this.querySize,
    required this.parser,
    required this.parsedText,
  });

  String? text;
  int? size;
  List<String?> layers;
  bool private;
  Lang? lang;
  int? querySize;
  String? parser;
  ParsedText? parsedText;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
    text: json["text"],
    size: json["size"],
    layers: List<String>.from(json["layers"].map((x) => x)),
    private: json["private"],
    lang: Lang.fromJson(json["lang"]),
    querySize: json["querySize"],
    parser: json["parser"],
    parsedText: ParsedText.fromJson(json["parsed_text"]),
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "size": size,
    "layers": List<dynamic>.from(layers.map((x) => x)),
    "private": private,
    "lang": lang?.toJson(),
    "querySize": querySize,
    "parser": parser,
    "parsed_text": parsedText?.toJson(),
  };
}

class Lang {
  Lang({
    required this.name,
    required this.iso6391,
    required this.iso6393,
    required this.defaulted,
  });

  String? name;
  String? iso6391;
  String? iso6393;
  bool defaulted;

  factory Lang.fromJson(Map<String, dynamic> json) => Lang(
    name: json["name"],
    iso6391: json["iso6391"],
    iso6393: json["iso6393"],
    defaulted: json["defaulted"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "iso6391": iso6391,
    "iso6393": iso6393,
    "defaulted": defaulted,
  };
}

class ParsedText {
  ParsedText({
    required this.city,
  });

  String? city;

  factory ParsedText.fromJson(Map<String, dynamic> json) => ParsedText(
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
  };
}

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
