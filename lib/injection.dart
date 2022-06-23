import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:metrics_viewer/injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection() {
  $initGetIt(getIt);
}
