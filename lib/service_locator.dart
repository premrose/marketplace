import 'package:get_it/get_it.dart';

import 'network/repository/repository.dart';
import 'network/services/services.dart';

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Dashboard
  sl.registerSingleton<ServiceRepository>(ServicesImp());
  sl.registerSingleton<Repository>(RepositoryImp());
}
