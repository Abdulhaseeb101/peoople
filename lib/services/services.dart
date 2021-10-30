import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newflut_app/models/category.dart';
import 'package:newflut_app/models/customerInfo.dart';
import 'package:newflut_app/models/subCatDetails.dart';

int categoriesLength; //length of the JSON response

Future<List<Category>> fetchCategories() async {
  final response = await http
      .get(Uri.parse('https://peopplemockerserver.herokuapp.com/get_category'));

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

Future<List<Category>> fetchAppointmentsSubCat(String url) async {
  final response = await http
      .get(Uri.parse(url));

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

Future<List<SubCatInfo>> fetchAppointmentsSubCatDetails(String url) async {
  final response = await http
      .get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did respond
    // then parse JSON
    final jsonResponse = jsonDecode(response.body);

    List<SubCatInfo> details = [];

    for (var inf in jsonResponse) {
      SubCatInfo info = SubCatInfo(inf['imgUrl'], inf['name']);

      details.add(info);
    }

    return details;
  } else {
    // If the server did not respond
    // then throw an exception
    throw Exception('Failed to fetch categories');
  }
}

Future<CustomerInfo> fetchCustomerInfo() async {
  final response = await http
      .get(Uri.parse('https://peopplemockerserver.herokuapp.com/get_category'));

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
