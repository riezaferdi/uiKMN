import '../models/myfamily_models.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

class UsersProvider extends ChangeNotifier {
  // Stream and Sink Process di sini !!!
  ListMyFamily? selectedFamily;

  void selectFamily(ListMyFamily data) {
    selectedFamily = data;
    notifyListeners();
  }
}

// class UsersProvider extends ChangeNotifier {
//   final repo = 'users';

//   Future<List<ListMyFamily>> getUsers({int? page = 0, int? limit = 20}) async {
//     final lst = await http.get('$repo/',
//         queryParameters: {'page':page, 'limit': limit});
//     return lst.map<ListMyFamily>((value) => ListMyFamily.fromJson(value)).toList();
//   }

//   Future<ListMyFamily> getByIdUser(int id) async {
//     final data = await http.get('$repo/$id');
//     return ListMyFamily.fromJson(data);
//   }

//   Future<ListMyFamily> createUser(ListMyFamily user) async {
//     final data = await http.post('$repo/', data: user.toJson());
//     return ListMyFamily.fromJson(data);
//   }

//   Future<ListMyFamily> updateUser(int id, ListMyFamily user) async {
//     final data = await http.put('$repo/$id', data: user.toJson());
//     return ListMyFamily.fromJson(data);
//   }

//   Future<ListMyFamily> deleteUser(int id) async {
//     final data = await http.delete('$repo/$id');
//     return ListMyFamily.fromJson(data);
//   }
// }