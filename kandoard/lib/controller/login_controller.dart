bool validarEmail(String email) {
  String padraoEmail = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
  RegExp regExp = RegExp(padraoEmail);

  return regExp.hasMatch(email);
}

bool validarSenha(String senha) {
  bool temLetra = senha.contains(RegExp(r'[a-zA-Z]'));
  bool temNumero = senha.contains(RegExp(r'[0-9]'));

  return temLetra && temNumero;
}
