import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtscan/features/home/home.dart';
import 'package:vtscan/features/overlay_loader/overlay_loader_wrapper.dart';
import 'package:vtscan/l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Domain.init(
    apiKey: '75430c577bcc071cb67f8253643cdcab7dd4468803793b4a7ad4de1885106b2e',
  ); // TODO: Add api key from virus total
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF007351)),
      ),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: OverlayLoaderWrapper(child: Home()),
    );
  }
}
