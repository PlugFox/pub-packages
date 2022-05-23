import 'package:flutter/material.dart';
import 'package:pub_packages/src/feature/authentication/widget/authentication_scope.dart';

/// {@template logout_button}
/// LogoutButton widget
/// {@endtemplate}
class LogoutButton extends StatelessWidget {
  /// {@macro logout_button}
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () => AuthenticationScope.of(context).logout(),
        icon: const Icon(
          Icons.logout,
        ),
      );
} // LogoutButton
