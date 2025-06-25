//import 'package:meta/meta.dart';
import 'dart:convert';

class Nationality {
  int count;
  String name;
  List<Country> country;

  Nationality({required this.count, required this.name, required this.country});

  factory Nationality.fromRawJson(final String str) =>
      Nationality.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Nationality.fromJson(final Map<String, dynamic> json) => Nationality(
    count: json['count'],
    name: json['name'],
    country: List<Country>.from(
      json['country'].map((final x) => Country.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    'count': count,
    'name': name,
    'country': List<dynamic>.from(country.map((final x) => x.toJson())),
  };
}

class Country {
  String countryId;
  double probability;

  Country({required this.countryId, required this.probability});

  factory Country.fromRawJson(final String str) =>
      Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(final Map<String, dynamic> json) => Country(
    countryId: json['country_id'],
    probability: json['probability']?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'country_id': countryId,
    'probability': probability,
  };
}
