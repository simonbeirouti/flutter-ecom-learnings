import 'package:ecom_admin/app/providers.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthWidget extends ConsumerWidget {
  const AuthWidget({
    Key? key,
    required this.signedInBuilder,
    required this.nonSignedInBuilder,
    required this.adminSignedInBuilder,
  }) : super(key: key);

  final WidgetBuilder nonSignedInBuilder;
  final WidgetBuilder signedInBuilder;
  final WidgetBuilder adminSignedInBuilder;

  // final adminEmail = "admin@admin.com";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChange = ref.watch(authStateChangeProvider);
    const adminEmail = "admin@admin.com";
    return authStateChange.when(
      data: (user) => user != null
          ? user.email == adminEmail
              ? adminSignedInBuilder(context)
              : signedInBuilder(context)
          : nonSignedInBuilder(context),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (_, __) => const Scaffold(
        body: Center(
          child: Text("Something went wrong!"),
        ),
      ),
    );
  }
}
