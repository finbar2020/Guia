import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:guia_moteis/core/theme/global_themes_dev.dart';
import 'package:guia_moteis/core/theme/state_dark_light_dev.dart';
import 'package:guia_moteis/features/rooms_list/presentation/screen/rooms_list_screen.dart';
import 'package:guia_moteis/routes.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  //Widget? _initialScreen;

  @override
  Widget build(BuildContext context) {
    final isDevEnvironment = FlavorConfig.instance.name == "dev";
    final themeNotifier =
        isDevEnvironment ? Provider.of<ThemeNotifier>(context) : null;
    //_initialScreen = const RoomsListScreen();
    // if (_initialScreen == null) {
    //   return const Center(child: CircularProgressIndicator());
    // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDevEnvironment ? lightTheme : null,
      darkTheme: isDevEnvironment ? darkTheme : null,
      themeMode:
          isDevEnvironment ? themeNotifier!.currentThemeMode : ThemeMode.system,
      home: const RoomsListScreen(),
      routes: Routes.list,
    );
  }
}
