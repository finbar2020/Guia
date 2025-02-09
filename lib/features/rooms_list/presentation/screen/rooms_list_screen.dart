// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:guia_moteis/features/rooms_list/presentation/controller/rooms_list_controller.dart';
import 'package:provider/provider.dart';

class RoomsListScreen extends StatefulWidget {
  const RoomsListScreen({super.key});

  @override
  _RoomsListScreenState createState() => _RoomsListScreenState();
}

class _RoomsListScreenState extends State<RoomsListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final roomsListController =
          Provider.of<RoomsListController>(context, listen: false);
      roomsListController.carregarMoteis();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Moteis')),
      body: Consumer<RoomsListController>(
        builder: (context, roomsListController, child) {
          final moteis = roomsListController.moteis;

          return moteis.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: moteis.length,
                  itemBuilder: (context, index) {
                    final motel = moteis[index];
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        leading:
                            Image.network(motel.logo, width: 50, height: 50),
                        title: Text(motel.nome),
                        subtitle: Text(motel.bairro),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/item_list',
                            arguments: motel,
                          );
                        },
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
