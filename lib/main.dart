import 'package:ceiba_users/src/config/config.dart';
import 'package:ceiba_users/src/config/setup_providers/factory_setup_providers.dart';
import 'package:ceiba_users/src/features/feature_on_boarding/presentation/providers/on_boarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await Environment.initEnvironment();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
        ChangeNotifierProvider(create: (_) => FactorySetupProviders.createUserProvider()),
        ChangeNotifierProvider(create: (_) => FactorySetupProviders.createPostProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: routesApp,
        title: 'Usuarios Ceiba',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
        ),
      ),
    );
  }
}

