import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'presentation/providers/music_providers.dart';
import 'presentation/screens/home/home_screen.dart';
import 'presentation/screens/loading/loading_screen.dart';
import 'presentation/screens/onboarding/onboarding_screen.dart';
import 'presentation/screens/permission/permission_screen.dart';
import 'presentation/screens/splash/splash_screen.dart';

class SpotyFaApp extends ConsumerStatefulWidget {
  const SpotyFaApp({super.key});

  @override
  ConsumerState<SpotyFaApp> createState() => _SpotyFaAppState();
}

class _SpotyFaAppState extends ConsumerState<SpotyFaApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // =============================================
  // وقتی اپ از background برمیگرده
  // =============================================
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      debugPrint('🔄 App resumed - rescanning music...');
      _rescanMusic();
    }
  }

  Future<void> _rescanMusic() async {
    try {
      await ref.read(rescanMusicProvider.future);
      debugPrint('✅ Music rescan completed');
    } catch (e) {
      debugPrint('❌ Error rescanning: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpotyFa',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      locale: const Locale('fa', 'IR'),
      supportedLocales: const [
        Locale('fa', 'IR'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const SplashScreen(),
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/permission': (context) => const PermissionScreen(),
        '/loading': (context) => const LoadingScreen(),
        '/home': (context) => const HomeScreen(),
      },
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child!,
        );
      },
    );
  }
}