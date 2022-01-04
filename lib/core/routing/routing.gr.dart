// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:mobil_programlama_odev/ui/pages/add_new_product/add_new_product.dart'
    as _i7;
import 'package:mobil_programlama_odev/ui/pages/add_product.page/add_product.dart'
    as _i11;
import 'package:mobil_programlama_odev/ui/pages/introduction_page/introduction_page.dart'
    as _i9;
import 'package:mobil_programlama_odev/ui/pages/login_page/login_page.dart'
    as _i2;
import 'package:mobil_programlama_odev/ui/pages/main_page/tabs/home_tab_pages/home_tab_main_page.dart'
    as _i5;
import 'package:mobil_programlama_odev/ui/pages/old_informations/old_informations.dart'
    as _i6;
import 'package:mobil_programlama_odev/ui/pages/profile_page/profile_page.dart'
    as _i10;
import 'package:mobil_programlama_odev/ui/pages/search_page/search_page.dart'
    as _i8;
import 'package:mobil_programlama_odev/ui/pages/sign_up_landing_page/sign_up_landing_page.dart'
    as _i3;
import 'package:mobil_programlama_odev/ui/pages/sign_up_with_email/sign_up_with_email.dart'
    as _i4;
import 'package:mobil_programlama_odev/ui/pages/splash_page/splash_page.dart'
    as _i1;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.SplashPage());
    },
    LogInRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: _i2.LogInPage());
    },
    SignUpLandingRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.SignUpLandingPage());
    },
    SignUpWithEmailRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: _i4.SignUpWithEmailPage());
    },
    HomeTabMainRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: _i5.HomeTabMainPage());
    },
    OldInformationsRoute.name: (routeData) {
      final args = routeData.argsAs<OldInformationsRouteArgs>();
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i6.OldInformationsPage(scanResult: args.scanResult));
    },
    AddNewProductRoute.name: (routeData) {
      final args = routeData.argsAs<AddNewProductRouteArgs>();
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i7.AddNewProductPage(
              key: args.key, scanResult: args.scanResult));
    },
    SearchRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.SearchPage());
    },
    IntroductionRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.IntroductionPage());
    },
    ProfileRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i10.ProfilePage());
    },
    AddProductRoute.name: (routeData) {
      final args = routeData.argsAs<AddProductRouteArgs>();
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData,
          child:
              _i11.AddProductPage(key: args.key, scanResult: args.scanResult));
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(SplashRoute.name, path: '/'),
        _i12.RouteConfig(LogInRoute.name, path: '/log-in-page'),
        _i12.RouteConfig(SignUpLandingRoute.name,
            path: '/sign-up-landing-page'),
        _i12.RouteConfig(SignUpWithEmailRoute.name,
            path: '/sign-up-with-email-page'),
        _i12.RouteConfig(HomeTabMainRoute.name, path: '/home-tab-main-page'),
        _i12.RouteConfig(OldInformationsRoute.name,
            path: '/old-informations-page'),
        _i12.RouteConfig(AddNewProductRoute.name,
            path: '/add-new-product-page'),
        _i12.RouteConfig(SearchRoute.name, path: '/search-page'),
        _i12.RouteConfig(IntroductionRoute.name, path: '/introduction-page'),
        _i12.RouteConfig(ProfileRoute.name, path: '/profile-page'),
        _i12.RouteConfig(AddProductRoute.name, path: '/add-product-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LogInPage]
class LogInRoute extends _i12.PageRouteInfo<void> {
  const LogInRoute() : super(LogInRoute.name, path: '/log-in-page');

  static const String name = 'LogInRoute';
}

/// generated route for
/// [_i3.SignUpLandingPage]
class SignUpLandingRoute extends _i12.PageRouteInfo<void> {
  const SignUpLandingRoute()
      : super(SignUpLandingRoute.name, path: '/sign-up-landing-page');

  static const String name = 'SignUpLandingRoute';
}

/// generated route for
/// [_i4.SignUpWithEmailPage]
class SignUpWithEmailRoute extends _i12.PageRouteInfo<void> {
  const SignUpWithEmailRoute()
      : super(SignUpWithEmailRoute.name, path: '/sign-up-with-email-page');

  static const String name = 'SignUpWithEmailRoute';
}

/// generated route for
/// [_i5.HomeTabMainPage]
class HomeTabMainRoute extends _i12.PageRouteInfo<void> {
  const HomeTabMainRoute()
      : super(HomeTabMainRoute.name, path: '/home-tab-main-page');

  static const String name = 'HomeTabMainRoute';
}

/// generated route for
/// [_i6.OldInformationsPage]
class OldInformationsRoute
    extends _i12.PageRouteInfo<OldInformationsRouteArgs> {
  OldInformationsRoute({required String scanResult})
      : super(OldInformationsRoute.name,
            path: '/old-informations-page',
            args: OldInformationsRouteArgs(scanResult: scanResult));

  static const String name = 'OldInformationsRoute';
}

class OldInformationsRouteArgs {
  const OldInformationsRouteArgs({required this.scanResult});

  final String scanResult;

  @override
  String toString() {
    return 'OldInformationsRouteArgs{scanResult: $scanResult}';
  }
}

/// generated route for
/// [_i7.AddNewProductPage]
class AddNewProductRoute extends _i12.PageRouteInfo<AddNewProductRouteArgs> {
  AddNewProductRoute({_i13.Key? key, required String scanResult})
      : super(AddNewProductRoute.name,
            path: '/add-new-product-page',
            args: AddNewProductRouteArgs(key: key, scanResult: scanResult));

  static const String name = 'AddNewProductRoute';
}

class AddNewProductRouteArgs {
  const AddNewProductRouteArgs({this.key, required this.scanResult});

  final _i13.Key? key;

  final String scanResult;

  @override
  String toString() {
    return 'AddNewProductRouteArgs{key: $key, scanResult: $scanResult}';
  }
}

/// generated route for
/// [_i8.SearchPage]
class SearchRoute extends _i12.PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: '/search-page');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i9.IntroductionPage]
class IntroductionRoute extends _i12.PageRouteInfo<void> {
  const IntroductionRoute()
      : super(IntroductionRoute.name, path: '/introduction-page');

  static const String name = 'IntroductionRoute';
}

/// generated route for
/// [_i10.ProfilePage]
class ProfileRoute extends _i12.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '/profile-page');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i11.AddProductPage]
class AddProductRoute extends _i12.PageRouteInfo<AddProductRouteArgs> {
  AddProductRoute({_i13.Key? key, required String scanResult})
      : super(AddProductRoute.name,
            path: '/add-product-page',
            args: AddProductRouteArgs(key: key, scanResult: scanResult));

  static const String name = 'AddProductRoute';
}

class AddProductRouteArgs {
  const AddProductRouteArgs({this.key, required this.scanResult});

  final _i13.Key? key;

  final String scanResult;

  @override
  String toString() {
    return 'AddProductRouteArgs{key: $key, scanResult: $scanResult}';
  }
}
