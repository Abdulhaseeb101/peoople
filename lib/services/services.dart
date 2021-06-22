import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newflut_app/models/category.dart';

Future<Category> fetchCategories() async {
  final response = await http.get(Uri.parse('https://9ed8e8be-5dbc-47d8-a7c6-7c0eebe4df4c.mock.pstmn.io/get_category'));

  if (response.statusCode == 200) {
    // If the server did respond
    // then parse JSON
    final jsonResponse = jsonDecode(response.body);
    return Category.fromJson(jsonResponse[0]);
  } else {
    // If the server did not respond
    // then throw an exception
    throw Exception('Failed to fetch categories');
  }
}