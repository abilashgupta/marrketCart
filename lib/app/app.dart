import 'package:market_cart/register/reg_view.dart';
import 'package:market_cart/services/authentication.dart';
import 'package:market_cart/ui/dashboard/dashboard_view.dart';
import 'package:market_cart/ui/login/login_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute<dynamic>(page: Login, initial: true),
  MaterialRoute<dynamic>(page: Dashboard),
  MaterialRoute<dynamic>(page: Register),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: AuthenticationService),
])
class AppSetup {}
