import 'package:flutter/material.dart';
import 'package:guia_moteis/features/rooms_list/domain/models/motel_model.dart';

class ItemListSceen extends StatelessWidget {
  final MotelModel? motel;

  const ItemListSceen({super.key, required this.motel});

  @override
  Widget build(BuildContext context) {
    if (motel == null || motel!.suites.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Motel não encontrado')),
        body: const Center(
          child: Text(
            'Não há informações sobre este motel.',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(motel!.nome)), 
      body: ListView.builder(
        itemCount: motel!.suites.length,
        itemBuilder: (context, index) {
          final suite = motel!.suites[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Image.network(suite.fotos[0], height: 150, fit: BoxFit.cover),
                ListTile(
                  title: Text(suite.nome),
                  subtitle: Text('Itens: ${suite.itens.join(', ')}'),
                ),
                const Text('Preços:'),
                Column(
                  children: suite.periodos
                      .map((p) =>
                          Text('${p['tempoFormatado']}: R\$${p['valor']}'))
                      .toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
