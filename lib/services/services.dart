import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newflut_app/models/category.dart';


fetchCategories() async {
  final response = await http.get(Uri.parse('https://fakestoreapi.com/products/categories?limit=5'));

  if (response.statusCode == 200) {
    // If the server did respond
    //then parse JSON
    final parsedJson = json.decode(response.body);
    List _data = parsedJson;
    return _data;

  } else {
    // If the server did not respond
    // the throw an Exception
    throw Exception('Failed to fetch categories');
  }

}