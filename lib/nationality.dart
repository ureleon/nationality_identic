// ignore_for_file: sort_constructors_first, inference_failure_on_untyped_parameter, avoid_dynamic_calls, always_specify_types, argument_type_not_assignable TODO(vanyasem): Replace with JsonSerializable
import 'dart:convert';

class Nationality {
  final int count;
  final String name;
  final List<Country> country;

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
  final String countryId;
  final double probability;

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
