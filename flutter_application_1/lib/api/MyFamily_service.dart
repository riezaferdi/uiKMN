//import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../models/myfamily_models.dart';

Future<List<ListData>> getFamilyData(int index) async {
  try {
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=$index'),
    );

    final list = json.decode(response.body)['data'] as List<dynamic>;
    //print(list);
    return list.map((index) => ListData.fromJson(index)).toList();
  } catch (error) {
    throw Exception('Failed to load album');
  }
}
