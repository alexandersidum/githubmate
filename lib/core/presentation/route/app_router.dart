import 'package:auto_route/annotations.dart';
import 'package:githubmate/auth/presentation/sign_in_page.dart';
import 'package:githubmate/github/presentation/starred_repository_page.dart';
import 'package:githubmate/splash/presentation/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage, path: '/login'),
    MaterialRoute(page: StarredRepository, path: '/starred'),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
