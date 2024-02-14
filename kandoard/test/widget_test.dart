import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kandoard/controller/login_controller.dart' as login_controller;
import 'package:kandoard/controller/register_controller.dart' as register_controller;
import 'package:kandoard/main.dart';

void main() {
  testWidgets('Redirecionamento para Tela de Cadastro',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(const MyApp()); // Substitua MeuApp pelo nome do seu app
    await tester.tap(find.byKey(const Key('botaoCadastro')));
    await tester.pump();
    expect(find.text('Cadastro no KanBoard'), findsOneWidget);
  });
  testWidgets('Teste de navegação da Tela de cadastro para a tela de Login',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(const MyApp()); // Substitua MeuApp pelo nome do seu app
    await tester.tap(find.byKey(const Key('botaoCadastro')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('botaoLogin')));
    await tester.pump();
    expect(find.text('Login no KanBoard'), findsOneWidget);
  });
  test('Validação de Email no Login', () {
    expect(login_controller.validarEmail('usuario@example.com'), true);
    expect(login_controller.validarEmail('email_invalido'), false);
  });
  test('Validação de Senha no Login', () {
    expect(login_controller.validarSenha('senha123'), true);
    expect(login_controller.validarSenha('abc'), false);
  });
  test('Confirmação de Senha no Cadastro', () {
    expect(register_controller.confirmarSenha('senha123', 'senha123'), true);
    expect(register_controller.confirmarSenha('senha123', 'outrasenha'), false);
  });
}
