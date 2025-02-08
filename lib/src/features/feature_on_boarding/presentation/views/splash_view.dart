import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../config/config.dart';
import '../providers/on_boarding_provider.dart';

class SplashView extends StatefulWidget {
  static const routeName = '/';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final onBoardingProvider = context.read<OnBoardingProvider>();
      onBoardingProvider.initialize(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<OnBoardingProvider>(builder: (_, auth, child) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ZoomIn(
                  duration: const Duration(seconds: 1),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/png/logo.png',
                          width: 200,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Version:${auth.versionApp}",
                      style: TextStyles.regular()),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}