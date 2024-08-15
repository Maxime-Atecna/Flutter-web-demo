
import 'package:demo/view/connexion_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../view/admin_page.dart';
import '../../view/home_page.dart';
import '../../view/skill_page.dart';
import '../../view/splash_page.dart';
import '../error_page.dart';


final _nestedKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
/// Caches and Exposes a [GoRouter]
final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);


  return GoRouter(
      navigatorKey: navigationKey,
      // For demo purposes
      debugLogDiagnostics: kDebugMode,
      // This notifiies `GoRouter` for refresh events
      refreshListenable: router,
      // All the logic is centralized here
      redirect: router._redirectLogic,

      // All the routes can be found there
      routes: [
        ShellRoute(
            navigatorKey: _nestedKey,
            builder: (context, state, child) {
              return HeroControllerScope(
                  controller: MaterialApp.createMaterialHeroController(),
                  child: LayoutBuilder(
                    builder: (context, constraints) => child,
                  ));
            },
            routes: router._routes)
      ],

      // for remove base /# on url
      initialLocation: "/",
      errorBuilder: (context, state) => ErrorPage(
        error: state.error.toString(),
      ));
});

class RouterNotifier extends ChangeNotifier {
  /// This implementaxploits `ref.listen()` to add a simple callback that
  /// calls `notifyListeners()` whenever there's change onto a desider provider.
  RouterNotifier(this._ref) {
    // If router need to listen provider

  }

  final Ref _ref;

  /// IMPORTANT: conceptually, we want to use `ref.read` to read providers, here.
  /// GoRouter is already aware of state changes through `refreshListenable`
  /// We don't want to trigger a rebuild of the surrounding provider.
  Future<String?> _redirectLogic(BuildContext context, GoRouterState state) async {
    //Logical logic for redirection
    return null;
  }

  List<GoRoute> get _routes => [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const SplashPage()),
      routes: [
        GoRoute(
          name: "login",
          path: 'login',
          pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: ConnexionPage()),
        ),
      ],
    ),
    GoRoute(
        path: '/home',
        pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: HomePage()),
        // builder: (context, _) => HomePage(),
        name: "home",
        routes: [
          GoRoute(
            path: "skills",
            pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: SkillPage()),
          ),
        ]),
    GoRoute(
        path: Routes.admin,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const AdminPage(),
        ),
    ),
    GoRoute(
      path: "/error",
      name: "error",
      builder: (context, state) => ErrorPage(error: state.extra.toString()),
    ),
    GoRoute(
      path: "/splash",
      name: "splash",
      builder: (context, state) => const SplashPage(),
    ),
  ];
}

class Routes {
  static const String home = "/";
  static const String homeConnected = "/home";
  static const String authentication = "/login";
  static const String splash = "/splash";
  static const String admin = "/admin";
  static const String skill = "/skill";

}
