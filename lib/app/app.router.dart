// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../register/reg_view.dart';
import '../ui/dashboard/dashboard_view.dart';
import '../ui/login/login_view.dart';

class Routes {
  static const String login = '/';
  static const String dashboard = '/Dashboard';
  static const String register = '/Register';
  static const all = <String>{
    login,
    dashboard,
    register,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.login, page: Login),
    RouteDef(Routes.dashboard, page: Dashboard),
    RouteDef(Routes.register, page: Register),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    Login: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const Login(),
        settings: data,
      );
    },
    Dashboard: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const Dashboard(),
        settings: data,
      );
    },
    Register: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const Register(),
        settings: data,
      );
    },
  };
}
