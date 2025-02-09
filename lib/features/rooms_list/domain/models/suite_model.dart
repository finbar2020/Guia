class SuiteModel {
  final String nome;
  final List<String> fotos;
  final List<String> itens;
  final List<Map<String, dynamic>> categoriaItens;
  final List<Map<String, dynamic>> periodos;

  SuiteModel({
    required this.nome,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });

  factory SuiteModel.fromJson(Map<String, dynamic> json) {
    return SuiteModel(
      nome: json['nome'],
      fotos: List<String>.from(json['fotos']),
      itens: List<String>.from(json['itens'].map((i) => i['nome'])),
      categoriaItens: List<Map<String, dynamic>>.from(json['categoriaItens']),
      periodos: List<Map<String, dynamic>>.from(json['periodos']),
    );
  }
}
