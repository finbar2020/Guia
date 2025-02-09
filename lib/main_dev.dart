import 'package:flutter/material.dart';
import 'package:guia_moteis/app.dart';
import 'package:guia_moteis/core/theme/state_dark_light_dev.dart';
import 'package:guia_moteis/features/rooms_list/presentation/controller/rooms_list_controller.dart';
import 'package:provider/provider.dart';

import 'package:flutter_flavor/flutter_flavor.dart';

void main() {
  FlavorConfig(
    name: "dev",
    color: Colors.green,
    location: BannerLocation.bottomEnd,
    variables: {
      "baseUrl": "",
    },
  );

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    FlavorBanner(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeNotifier()),
          ChangeNotifierProvider(create: (_) => RoomsListController()),
        ],
        child: const App(),
      ),
    ),
  );
}
