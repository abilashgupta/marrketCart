import 'package:market_cart/app/app.locator.dart';
import 'package:market_cart/app/app.router.dart';
import 'package:market_cart/services/authentication.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends IndexTrackingViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _navigator = locator<NavigationService>();

  void signOut() async {
    await _authenticationService.signOut();
    _navigator.replaceWith(Routes.login);
  }
}
