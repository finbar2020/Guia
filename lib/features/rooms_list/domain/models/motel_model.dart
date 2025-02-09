import 'package:guia_moteis/features/rooms_list/domain/models/suite_model.dart';

class MotelModel {
  final String nome;
  final String logo;
  final String bairro;
  final List<SuiteModel> suites;

  MotelModel({
    required this.nome,
    required this.logo,
    required this.bairro,
    required this.suites,
  });

  factory MotelModel.fromJson(Map<String, dynamic> json) {
    return MotelModel(
      nome: json['fantasia'],
      logo: json['logo'],
      bairro: json['bairro'],
      suites: (json['suites'] as List)
          .map((suite) => SuiteModel.fromJson(suite))
          .toList(),
    );
  }
}
