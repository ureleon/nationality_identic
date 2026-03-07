import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:national_identic/entity/country.dart';
import 'package:national_identic/entity/nationality.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[Nationality, Country])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
