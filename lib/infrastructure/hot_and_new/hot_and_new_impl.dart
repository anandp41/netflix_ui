import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/hot_and_new_response/hot_and_new_service.dart';
import 'package:netflix/domain/hot_and_new_response/model/hot_and_new_response.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplements implements HotAndNewService {
  @override
  Future<Either<MainFailure, HotAndNewResponse>> getHotAndNewMovieData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotaAndNewMovie,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResponse.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNewResponse>> getHotAndNewTvData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotaAndNewTv,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResponse.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
