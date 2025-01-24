import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missing/views/Navigation_sreen.dart';
import 'package:missing/views/User_profile_page.dart';
import 'package:missing/views/login_screen.dart';
import 'package:missing/views/main_screen.dart';
import 'package:missing/views/registration.dart';
import 'package:missing/views/search_page.dart';
import 'package:missing/views/splash_screen.dart';
import 'package:missing/views/upload_post_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'cubit/auth/auth_cubit.dart';
import 'cubit/credential/credential_cubit.dart';
import 'cubit/user/get_single_other_user/get_single_other_user_cubit.dart';
import 'cubit/user/get_single_user/get_single_user_cubit.dart';
import 'cubit/user/user_cubit.dart';
import 'package:missing/cubit/auth/auth_cubit.dart' as missing_auth;
import 'injection_container.dart' as di;

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Supabase.initialize(
    url: 'https://svdvmzwjyfjerhiqycar.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN2ZHZtendqeWZqZXJoaXF5Y2FyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc2NjYxNDYsImV4cCI6MjA1MzI0MjE0Nn0.jQTodaee7VcNCFbEIZcYAzoaa_z3L--9FgMUhC6FL-g',
  );
  await di.init(); // Dependency injection setup
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<AuthCubit>()..appStarted(context)),
        BlocProvider(create: (_) => di.sl<CredentialCubit>()),
        BlocProvider(create: (_) => di.sl<UserCubit>()),
        BlocProvider(create: (_) => di.sl<GetSingleUserCubit>()),
        BlocProvider(create: (_) => di.sl<GetSingleOtherUserCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Missing",
        darkTheme: ThemeData.dark(),
        initialRoute: "/",
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthStates>(builder: (context, authState) {
              // Check if user is authenticated using Supabase
              final user = Supabase.instance.client.auth.currentUser;

              // If the user is authenticated, navigate to the main screen
              if (user != null) {
                return LoginScreen();
              } else {
                // If not authenticated, show the login screen
                return LoginScreen();
              }
            });
          },
        },
      ),
    );
  }
}
