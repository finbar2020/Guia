import 'package:flutter/material.dart';
import 'package:guia_moteis/features/rooms_list/domain/models/motel_model.dart';
import 'package:guia_moteis/features/rooms_list/presentation/screen/items_list_screen.dart';
import 'package:guia_moteis/features/rooms_list/presentation/screen/rooms_list_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> get list {
    return <String, WidgetBuilder>{
      '/list_rooms': (context) => const RoomsListScreen(),
      '/item_list': (context) => ItemListSceen(
          motel: ModalRoute.of(context)!.settings.arguments as MotelModel?)
    };
  }
}
