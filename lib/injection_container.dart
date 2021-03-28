import 'package:get_it/get_it.dart';
import 'package:data/data_injection_container.dart' as dataInjectionContainer;
import 'package:domain/domain_injection_container.dart'
    as domainInjectionContainer;

final GetIt locator = GetIt.instance;

void init() {
  dataInjectionContainer.init();
  domainInjectionContainer.init();
}
