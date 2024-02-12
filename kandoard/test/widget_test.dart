// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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
    expect(validarEmail('usuario@example.com'), true);
    expect(validarEmail('email_invalido'), false);
  });
  test('Validação de Senha no Login', () {
  expect(validarSenha('senha123'), true);
  expect(validarSenha('abc'), false);
});
test('Confirmação de Senha no Cadastro', () {
  expect(confirmarSenha('senha123', 'senha123'), true);
  expect(confirmarSenha('senha123', 'outrasenha'), false);
});
}
