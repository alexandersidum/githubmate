import 'package:auto_route/annotations.dart';
import 'package:githubmate/auth/presentation/authorization_page.dart';
import 'package:githubmate/auth/presentation/sign_in_page.dart';
import 'package:githubmate/github/repos/starred_repo/presentation/starred_repository_page.dart';
import 'package:githubmate/splash/presentation/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage, path: '/login'),
    MaterialRoute(page: StarredRepositoryPage, path: '/starred'),
    MaterialRoute(page: AuthorizationPage, path: '/authorization'),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
