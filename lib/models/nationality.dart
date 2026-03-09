import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:national_identic/models/country.dart';
import 'package:national_identic/models/json_serializable.dart';
import 'package:national_identic/models/serializers.dart';

part 'nationality.g.dart';

abstract class Nationality
    implements Built<Nationality, NationalityBuilder>, JsonSerializable {
  factory Nationality([final void Function(NationalityBuilder) updates]) =
      _$Nationality;

  Nationality._();

  static Serializer<Nationality> get serializer => _$nationalitySerializer;

  @BuiltValueField(wireName: 'count')
  int get count;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'country')
  BuiltList<Country> get country;

  static Nationality fromJson(final Map<String, Object?> jsonMap) =>
      serializers.deserializeWith(Nationality.serializer, jsonMap)!;

  @override
  String toJson() =>
      json.encode(serializers.serializeWith(Nationality.serializer, this));
}
