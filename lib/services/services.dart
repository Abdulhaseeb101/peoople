import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:newflut_app/constants.dart';
import 'package:newflut_app/models/category.dart';
import 'package:newflut_app/models/customerInfo.dart';
import 'dart:developer';

Future<List<Category>> fetchCategories(String uri) async {
  try {
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      // If the server did respond
      // then parse JSON
      final jsonResponse = jsonDecode(response.body);

      List<Category> categories = [];

      for (var cat in jsonResponse) {
        Category category = Category(cat['label'], cat['value']);
        categories.add(category);
      }

      return categories;
    } else {
      // If the server did not respond
      // then throw an exception
      throw Exception('Failed to fetch categories');
    }
  }
  on SocketException {
    List<Category> categories = [];
    return categories;
  }
}

Future<Map> fetchProductsByCategory(String uri) async {
  try {
    final response = await http.get(Uri.parse(uri));  // get response from the url

    if (response.statusCode == 200) {
      // If the server did respond
      // then parse JSON
      final Map jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      // If the server did not respond
      // then throw an exception
      throw Exception('Failed to fetch categories');
    }
  }
  on SocketException {
    Map jsonResponse = {};
    return jsonResponse;
  }
}

Future<CustomerInfo> fetchCustomerInfo() async {
  final response = await http.get(Uri.parse('$SERVER_URL/get_custinfo'));

  if (response.statusCode == 200) {
    // If the server did respond the
    // then parse JSON
    final jsonResponse = jsonDecode(response.body);

    CustomerInfo custInfo = CustomerInfo.fromJson(jsonResponse);

    return custInfo;
  } else {
    // If the server did not respond
    // then throw an exception
    throw Exception('Failed to fetch customer information');
  }
}
