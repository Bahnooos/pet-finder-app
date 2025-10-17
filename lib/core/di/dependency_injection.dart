import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/home/presentation/logic/cubit/home_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // setup dio and api service
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));


  // Home
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(getIt()),
  );
  getIt.registerLazySingleton<HomeCubit>(
    () => HomeCubit(getIt<HomeRepo>()),
  );
}