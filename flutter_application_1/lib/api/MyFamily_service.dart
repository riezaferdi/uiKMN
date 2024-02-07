//import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../models/myfamily_models.dart';

Future<List<ListPosts>> getPostsData() async {
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/'),
    );

    final list = json.decode(response.body) as List<dynamic>;
    //print(list);
    return list.map((index) => ListPosts.fromJson(index)).toList();
  } catch (error) {
    throw Exception('Failed to load album');
  }
}