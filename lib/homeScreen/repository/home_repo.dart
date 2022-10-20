import 'package:http/http.dart';
import 'dart:convert';

import 'package:tatware/homeScreen/models/expert_model.dart';



/*
abstract class HomeRepository{

  Future<Either<Failure,List<Book>>>getAllBooks();
}
*/


class ExpertRepository {
  String endpoint = 'https://reqres.in/api/users?page=2';

  Future<List<ExpertModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
       List result = jsonDecode(response.body)['data'];
      return result.map((e) => ExpertModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
