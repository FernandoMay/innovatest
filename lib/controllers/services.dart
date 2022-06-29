import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:fmayinnovatest/models/models.dart';
import 'package:http/http.dart' as http;

Future<List<Employee>> fetchEmployees() async {
  var isCacheExist =
      await APICacheManager().isAPICacheKeyExist("API_Employees");
  if (!isCacheExist) {
    Uri employeesListAPIUrl = Uri.https(
        'dummy.restapiexample.com', '/api/v1/employees', {'q': '{http}'});
    final response = await http.get(employeesListAPIUrl);

    if (response.statusCode == 200) {
      APICacheDBModel cacheDBModel =
          APICacheDBModel(key: "API_Employees", syncData: response.body);
      await APICacheManager().addCacheData(cacheDBModel);
      Response jsonResponse = responseFromJson(response.body);
      return jsonResponse.data;
    } else {
      throw Exception('Failed to load data from API ${response.statusCode}');
    }
  } else {
    var cacheData = await APICacheManager().getCacheData("API_Employees");
    Response jsonResponse = responseFromJson(cacheData.syncData);
    return jsonResponse.data;
  }
}

Future<List<Employee>> fetchEmployee(int id) async {
  Uri employeeListAPIUrl = Uri.https(
      'dummy.restapiexample.com', '/api/v1/employees/$id', {'q': '{http}'});
  final response = await http.get(employeeListAPIUrl);

  if (response.statusCode == 200) {
    print(response.body);
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((employee) => Employee.fromJson(employee)).toList();
  } else {
    throw Exception('Failed to load data from API');
  }
}
