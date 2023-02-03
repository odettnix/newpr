import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'common/app_env.dart';

final sl = GetIt.instance;

Future<void> init() async{
  sl.registerLazySingleton(() => Dio(
    BaseOptions(
      sendTimeout: 1500,
      connectTimeout: 1500,
      receiveTimeout: 1500,
      baseUrl: '${AppEnv.protocol}:///${AppEnv.ip}',
    )
  ));
}