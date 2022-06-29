import 'dart:convert';

import 'package:fmayinnovatest/models/models.dart';
import 'package:http/http.dart' as http;

Future<List<Employee>> fetchEmployees() async {
  Uri employeesListAPIUrl = Uri.https(
      'dummy.restapiexample.com', '/api/v1/employees', {'q': '{http}'});
  final response = await http.get(employeesListAPIUrl);

  if (response.statusCode == 200) {
    Response jsonResponse = responseFromJson(response.body);
    return jsonResponse.data;
  } else {
    throw Exception('Failed to load data from API ${response.statusCode}');
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
