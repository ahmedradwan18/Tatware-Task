import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:tatware/core/error/exceptions.dart';
import 'package:tatware/core/error/failure.dart';
import 'dart:convert';

import 'package:tatware/homeScreen/models/expert_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<ExpertModel>>> getAllExperts();
}

class ExpertRepository extends HomeRepository {
  String endpoint = 'https://reqres.in/api/users?page=2';


  @override
  Future<Either<Failure, List<ExpertModel>>> getAllExperts() async {
    try {
      Response response = await get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        List result = jsonDecode(response.body)['data'];
        return Right(result.map((e) => ExpertModel.fromJson(e)).toList());
      } else {
        throw ServerException(errorMessage: response.reasonPhrase);
      }
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessage));
    }
  }
}
