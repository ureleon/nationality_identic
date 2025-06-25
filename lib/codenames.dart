import 'dart:convert';

class CodeNames {
  Name name;
  List<String> tld;
  String cca2;
  String ccn3;
  String cca3;
  String cioc;
  bool independent;
  String status;
  bool unMember;
  Currencies currencies;
  Idd idd;
  List<String> capital;
  List<String> altSpellings;
  String region;
  String subregion;
  Languages languages;
  Map<String, Translation> translations;
  List<int> latlng;
  bool landlocked;
  List<String> borders;
  int area;
  Demonyms demonyms;
  String flag;
  Maps maps;
  int population;
  Gini gini;
  String fifa;
  Car car;
  List<String> timezones;
  List<String> continents;
  Flags flags;
  CoatOfArms coatOfArms;
  String startOfWeek;
  CapitalInfo capitalInfo;
  PostalCode postalCode;

  CodeNames({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    required this.borders,
    required this.area,
    required this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    required this.gini,
    required this.fifa,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    required this.postalCode,
  });

  factory CodeNames.fromRawJson(final String str) =>
      CodeNames.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CodeNames.fromJson(final Map<String, dynamic> json) => CodeNames(
    name: Name.fromJson(json['name']),
    tld: List<String>.from(json['tld'].map((final x) => x)),
    cca2: json['cca2'],
    ccn3: json['ccn3'],
    cca3: json['cca3'],
    cioc: json['cioc'],
    independent: json['independent'],
    status: json['status'],
    unMember: json['unMember'],
    currencies: Currencies.fromJson(json['currencies']),
    idd: Idd.fromJson(json['idd']),
    capital: List<String>.from(json['capital'].map((final x) => x)),
    altSpellings: List<String>.from(json['altSpellings'].map((final x) => x)),
    region: json['region'],
    subregion: json['subregion'],
    languages: Languages.fromJson(json['languages']),
    translations: Map.from(json['translations']).map(
      (final k, final v) =>
          MapEntry<String, Translation>(k, Translation.fromJson(v)),
    ),
    latlng: List<int>.from(json['latlng'].map((final x) => x)),
    landlocked: json['landlocked'],
    borders: List<String>.from(json['borders'].map((final x) => x)),
    area: json['area'],
    demonyms: Demonyms.fromJson(json['demonyms']),
    flag: json['flag'],
    maps: Maps.fromJson(json['maps']),
    population: json['population'],
    gini: Gini.fromJson(json['gini']),
    fifa: json['fifa'],
    car: Car.fromJson(json['car']),
    timezones: List<String>.from(json['timezones'].map((final x) => x)),
    continents: List<String>.from(json['continents'].map((final x) => x)),
    flags: Flags.fromJson(json['flags']),
    coatOfArms: CoatOfArms.fromJson(json['coatOfArms']),
    startOfWeek: json['startOfWeek'],
    capitalInfo: CapitalInfo.fromJson(json['capitalInfo']),
    postalCode: PostalCode.fromJson(json['postalCode']),
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'name': name.toJson(),
    'tld': List<dynamic>.from(tld.map((final String x) => x)),
    'cca2': cca2,
    'ccn3': ccn3,
    'cca3': cca3,
    'cioc': cioc,
    'independent': independent,
    'status': status,
    'unMember': unMember,
    'currencies': currencies.toJson(),
    'idd': idd.toJson(),
    'capital': List<dynamic>.from(capital.map((final String x) => x)),
    'altSpellings': List<dynamic>.from(altSpellings.map((final String x) => x)),
    'region': region,
    'subregion': subregion,
    'languages': languages.toJson(),
    'translations': Map.from(
      translations,
    ).map((final k, final v) => MapEntry<String, dynamic>(k, v.toJson())),
    'latlng': List<dynamic>.from(latlng.map((final int x) => x)),
    'landlocked': landlocked,
    'borders': List<dynamic>.from(borders.map((final String x) => x)),
    'area': area,
    'demonyms': demonyms.toJson(),
    'flag': flag,
    'maps': maps.toJson(),
    'population': population,
    'gini': gini.toJson(),
    'fifa': fifa,
    'car': car.toJson(),
    'timezones': List<dynamic>.from(timezones.map((final String x) => x)),
    'continents': List<dynamic>.from(continents.map((final String x) => x)),
    'flags': flags.toJson(),
    'coatOfArms': coatOfArms.toJson(),
    'startOfWeek': startOfWeek,
    'capitalInfo': capitalInfo.toJson(),
    'postalCode': postalCode.toJson(),
  };
}

class CapitalInfo {
  List<double> latlng;

  CapitalInfo({required this.latlng});

  factory CapitalInfo.fromRawJson(final String str) =>
      CapitalInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CapitalInfo.fromJson(final Map<String, dynamic> json) => CapitalInfo(
    latlng: List<double>.from(json['latlng'].map((final x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'latlng': List<dynamic>.from(latlng.map((final double x) => x)),
  };
}

class Car {
  List<String> signs;
  String side;

  Car({required this.signs, required this.side});

  factory Car.fromRawJson(final String str) => Car.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Car.fromJson(final Map<String, dynamic> json) => Car(
    signs: List<String>.from(json['signs'].map((final x) => x)),
    side: json['side'],
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'signs': List<dynamic>.from(signs.map((final String x) => x)),
    'side': side,
  };
}

class CoatOfArms {
  String png;
  String svg;

  CoatOfArms({required this.png, required this.svg});

  factory CoatOfArms.fromRawJson(final String str) =>
      CoatOfArms.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CoatOfArms.fromJson(final Map<String, dynamic> json) =>
      CoatOfArms(png: json['png'], svg: json['svg']);

  Map<String, dynamic> toJson() => <String, dynamic>{'png': png, 'svg': svg};
}

class Currencies {
  Rub rub;

  Currencies({required this.rub});

  factory Currencies.fromRawJson(final String str) =>
      Currencies.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Currencies.fromJson(final Map<String, dynamic> json) =>
      Currencies(rub: Rub.fromJson(json['RUB']));

  Map<String, dynamic> toJson() => <String, dynamic>{'RUB': rub.toJson()};
}

class Rub {
  String name;
  String symbol;

  Rub({required this.name, required this.symbol});

  factory Rub.fromRawJson(final String str) => Rub.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rub.fromJson(final Map<String, dynamic> json) =>
      Rub(name: json['name'], symbol: json['symbol']);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'name': name,
    'symbol': symbol,
  };
}

class Demonyms {
  Eng eng;
  Eng fra;

  Demonyms({required this.eng, required this.fra});

  factory Demonyms.fromRawJson(final String str) =>
      Demonyms.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Demonyms.fromJson(final Map<String, dynamic> json) =>
      Demonyms(eng: Eng.fromJson(json['eng']), fra: Eng.fromJson(json['fra']));

  Map<String, dynamic> toJson() => <String, dynamic>{
    'eng': eng.toJson(),
    'fra': fra.toJson(),
  };
}

class Eng {
  String f;
  String m;

  Eng({required this.f, required this.m});

  factory Eng.fromRawJson(final String str) => Eng.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Eng.fromJson(final Map<String, dynamic> json) =>
      Eng(f: json['f'], m: json['m']);

  Map<String, dynamic> toJson() => <String, dynamic>{'f': f, 'm': m};
}

class Flags {
  String png;
  String svg;
  String alt;

  Flags({required this.png, required this.svg, required this.alt});

  factory Flags.fromRawJson(final String str) =>
      Flags.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Flags.fromJson(final Map<String, dynamic> json) =>
      Flags(png: json['png'], svg: json['svg'], alt: json['alt']);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'png': png,
    'svg': svg,
    'alt': alt,
  };
}

class Gini {
  double the2018;

  Gini({required this.the2018});

  factory Gini.fromRawJson(final String str) => Gini.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gini.fromJson(final Map<String, dynamic> json) =>
      Gini(the2018: json['2018']?.toDouble());

  Map<String, dynamic> toJson() => <String, dynamic>{'2018': the2018};
}

class Idd {
  String root;
  List<String> suffixes;

  Idd({required this.root, required this.suffixes});

  factory Idd.fromRawJson(final String str) => Idd.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Idd.fromJson(final Map<String, dynamic> json) => Idd(
    root: json['root'],
    suffixes: List<String>.from(json['suffixes'].map((final x) => x)),
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'root': root,
    'suffixes': List<dynamic>.from(suffixes.map((final String x) => x)),
  };
}

class Languages {
  String rus;

  Languages({required this.rus});

  factory Languages.fromRawJson(final String str) =>
      Languages.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Languages.fromJson(final Map<String, dynamic> json) =>
      Languages(rus: json['rus']);

  Map<String, dynamic> toJson() => <String, dynamic>{'rus': rus};
}

class Maps {
  String googleMaps;
  String openStreetMaps;

  Maps({required this.googleMaps, required this.openStreetMaps});

  factory Maps.fromRawJson(final String str) => Maps.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Maps.fromJson(final Map<String, dynamic> json) => Maps(
    googleMaps: json['googleMaps'],
    openStreetMaps: json['openStreetMaps'],
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'googleMaps': googleMaps,
    'openStreetMaps': openStreetMaps,
  };
}

class Name {
  String common;
  String official;
  NativeName nativeName;

  Name({
    required this.common,
    required this.official,
    required this.nativeName,
  });

  factory Name.fromRawJson(final String str) => Name.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Name.fromJson(final Map<String, dynamic> json) => Name(
    common: json['common'],
    official: json['official'],
    nativeName: NativeName.fromJson(json['nativeName']),
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'common': common,
    'official': official,
    'nativeName': nativeName.toJson(),
  };
}

class NativeName {
  Translation rus;

  NativeName({required this.rus});

  factory NativeName.fromRawJson(final String str) =>
      NativeName.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NativeName.fromJson(final Map<String, dynamic> json) =>
      NativeName(rus: Translation.fromJson(json['rus']));

  Map<String, dynamic> toJson() => <String, dynamic>{'rus': rus.toJson()};
}

class Translation {
  String official;
  String common;

  Translation({required this.official, required this.common});

  factory Translation.fromRawJson(final String str) =>
      Translation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Translation.fromJson(final Map<String, dynamic> json) =>
      Translation(official: json['official'], common: json['common']);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'official': official,
    'common': common,
  };
}

class PostalCode {
  String format;
  String regex;

  PostalCode({required this.format, required this.regex});

  factory PostalCode.fromRawJson(final String str) =>
      PostalCode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostalCode.fromJson(final Map<String, dynamic> json) =>
      PostalCode(format: json['format'], regex: json['regex']);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'format': format,
    'regex': regex,
  };
}
