import 'package:firebase_core/firebase_core.dart';
import 'package:flutix/config/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';
import 'config/route_name.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<RegistrationCubit>(
          create: (context) => RegistrationCubit(),
        ),
        BlocProvider<SelectGenreCubit>(
          create: (context) => SelectGenreCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
        BlocProvider<TicketsCubit>(
          create: (context) => TicketsCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: RouteName.genre,
        routes: pages,
      ),
    );
  }
}
