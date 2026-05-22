import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//para esse exemplo, considerar o projeto graconlima/biblioteca branch aut_jwt
class ArmazenadorSeguro {
  // Inicializa o armazenamento seguro
  final _armazenador = const FlutterSecureStorage();

  // 1. Gravar dados
  Future<void> salvarToken(String token) async {
    await _armazenador.write(key: 'jwt_token', value: token);
  }

  // 2. Ler dados
  Future<String?> obterToken() async {
    return await _armazenador.read(key: 'jwt_token');
  }

  // 3. Deletar um dado específico
  Future<void> deletarToken() async {
    await _armazenador.delete(key: 'jwt_token');
  }

  // 4. Limpar tudo
  Future<void> limparTudo() async {
    await _armazenador.deleteAll();
  }
}

class Autenticador {
  ArmazenadorSeguro as = ArmazenadorSeguro();
  final String _baseUrl = "http://localhost:8000/api";

  // Realiza o login e salva o token JWT
  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/token/"),
      body: {"username": email, "password": password},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      print(data['access']);

      final String token = data['access']; // Supondo que a API retorne {"token": "..."}

      // Salva o token de forma segura
      await as.salvarToken(token);
      return true;
    }
    return false;
  }
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final as = ArmazenadorSeguro();

  final a = Autenticador();

  if(await a.login("gracon", "123")){
    final token = await as.obterToken();

    if (token != null) {
      final resposta = await http.get(
        Uri.parse("http://localhost:8000/api/livros"),
        headers: {
          "Authorization": "Bearer $token", // Formato padrão Bearer Token
        },
      );

      print(resposta.body);
    }
  }

}