import 'package:frontend/models/cuti.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String apiUrl = "http://localhost:8000/api/cuti";

  Future<List<Cuti>> getCutis() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => Cuti.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load cuti');
    }
  }
}
