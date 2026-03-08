import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:national_identic/json_serializable.dart';
import 'package:national_identic/serializers.dart';

part 'country.g.dart';

abstract class Country
    implements Built<Country, CountryBuilder>, JsonSerializable {
  factory Country([final void Function(CountryBuilder) updates]) = _$Country;

  Country._();

  static Serializer<Country> get serializer => _$countrySerializer;

  @BuiltValueField(wireName: 'country_id')
  String get countryId;

  @BuiltValueField(wireName: 'probability')
  double get probability;

  static Country fromJson(final Map<String, Object?> jsonMap) =>
      serializers.deserializeWith(Country.serializer, jsonMap)!;

  @override
  String toJson() =>
      json.encode(serializers.serializeWith(Country.serializer, this));
}
