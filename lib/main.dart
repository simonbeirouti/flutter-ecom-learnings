import 'package:ecom_admin/app/auth_widget.dart';
import 'package:ecom_admin/app/pages/admin/admin_home.dart';
import 'package:ecom_admin/app/pages/auth/sign_in_page.dart';
import 'package:ecom_admin/app/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutterfire_ui/database.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eCommerce Admin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.orange,
          seedColor: Colors.orange,
        ),
      ),
      home: AuthWidget(
        adminSignedInBuilder: (context) => const AdminHome(),
        signedInBuilder: (context) => Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Signed in"),
                ElevatedButton(
                  onPressed: () {
                    ref.read(firebaseAuthProvider).signOut();
                  },
                  child: const Text("Sign out"),
                ),
              ],
            ),
          ),
        ),
        nonSignedInBuilder: (_) => const SignInPage(),
      ),
    );
  }
}
