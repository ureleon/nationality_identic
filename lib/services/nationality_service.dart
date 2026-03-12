import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:national_identic/models/nationality.dart';

Future<Nationality> fetchNationality(String firstName) async {
  if (firstName != '') {
    final http.Response responseNat = await http.get(
      Uri.parse('https://api.nationalize.io/?name=$firstName'),
    );
    if (responseNat.statusCode >= 200 && responseNat.statusCode < 300) {
      return Nationality.fromJson(
        json.decode(responseNat.body) as Map<String, Object?>,
      );
    } else {
      throw Exception(responseNat.statusCode);
    }
  }
  throw Exception('Name must not be empty');
}
