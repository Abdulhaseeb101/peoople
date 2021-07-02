import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newflut_app/models/category.dart';
import 'package:newflut_app/models/customerInfo.dart';

int categoriesLength; //length of the JSON response

Future<List<Category>> fetchCategories() async {
  final response = await http.get(Uri.parse('https://9ed8e8be-5dbc-47d8-a7c6-7c0eebe4df4c.mock.pstmn.io/get_category'));

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

Future<CustomerInfo> fetchCustomerInfo() async {
  final response = await http.get(Uri.parse('https://9ed8e8be-5dbc-47d8-a7c6-7c0eebe4df4c.mock.pstmn.io/get_custinfo'));

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
