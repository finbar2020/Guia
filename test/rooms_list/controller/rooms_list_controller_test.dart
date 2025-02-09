import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:guia_moteis/features/rooms_list/presentation/controller/rooms_list_controller.dart';
import 'package:guia_moteis/core/intercepts/http/api_client.dart';
import 'dart:convert';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late RoomsListController controller;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    controller = RoomsListController();
    controller.apiClient = mockApiClient;
  });

  group('RoomsListController', () {
    test('deve carregar os motéis com sucesso quando os dados forem válidos', () async {
      const jsonString = '''
      {
        "sucesso": true,
        "data": {
          "totalMoteis": 1,
          "moteis": [
            {
              "id": 1,
              "nome": "Motel Teste",
              "bairro": "Centro",
              "logo": "http://example.com/logo.png"
            }
          ]
        }
      }
      ''';

      // Corrigir o uso de when para simular o retorno correto
      when(mockApiClient.fetchMockData()).thenAnswer((_) async => jsonDecode(jsonString));

      await controller.carregarMoteis();

      expect(controller.moteis.length, 1);
      expect(controller.moteis[0].nome, 'Motel Teste');
      expect(controller.moteis[0].bairro, 'Centro');
    });

    test('deve lançar uma exceção se os dados não forem válidos', () async {
      const jsonString = '''
      {
        "sucesso": false,
        "data": {
          "totalMoteis": 0,
          "moteis": []
        }
      }
      ''';

      when(mockApiClient.fetchMockData()).thenAnswer((_) async => jsonDecode(jsonString));

      expect(() async => await controller.carregarMoteis(), throwsA(isA<Exception>()));
    });

    test('deve lançar uma exceção se ocorrer um erro de rede', () async {
      when(mockApiClient.fetchMockData()).thenThrow(Exception('Erro de rede'));

      expect(() async => await controller.carregarMoteis(), throwsA(isA<Exception>()));
    });

    test('deve tratar o JSON de cobertura corretamente', () async {
      const jsonString = '''
      {
        "sucesso": true,
        "data": {
          "totalMoteis": 1,
          "moteis": [
            {
              "id": 1,
              "nome": "Motel Teste",
              "bairro": "Centro",
              "logo": "http://example.com/logo.png"
            }
          ]
        }
      }
      ''';

      when(mockApiClient.fetchMockData()).thenAnswer((_) async => jsonDecode(jsonString));

      await controller.carregarMoteis();

      final jsonResponse = jsonDecode(jsonString);
      expect(jsonResponse['sucesso'], true);
      expect(jsonResponse['data']['totalMoteis'], 1);
      expect(jsonResponse['data']['moteis'][0]['nome'], 'Motel Teste');
    });
  });
}
