import 'dart:io';

import 'package:flutter/material.dart';
import 'package:githubmate/auth/infrastructure/github_authenticator.dart';
import 'package:githubmate/core/shared/log.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage(
      {Key? key,
      required this.authorizationUrl,
      required this.onAuthorizationRedirectAttempt})
      : super(key: key);
  final Uri authorizationUrl;
  final Function(Uri redirectUrl) onAuthorizationRedirectAttempt;

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: WebView(
        initialUrl: widget.authorizationUrl.toString(),
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          controller.clearCache();
          CookieManager().clearCookies();
        },
        navigationDelegate: (navRequest) {
          Log.setLog('navRequest to => ${navRequest.url}');
          if (navRequest.url
              .startsWith(GithubAuthenticator.redirectUri.toString())) {
            widget.onAuthorizationRedirectAttempt(Uri.parse(navRequest.url));
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      )),
    );
  }
}
