import 'package:get_it/get_it.dart';
import 'package:market_check/config/injection_dependencies/injection_records.dart';

final GetIt sl = GetIt.instance;

init() async {
  registerServices();
  registerDataSources();
  registerRepositories();
  registerUseCases();
  registerProviders();
}
