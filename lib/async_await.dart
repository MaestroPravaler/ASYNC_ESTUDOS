Future<void> run() async {
  print('inicio do P1');

  var msg = await processo3();
  print('Mensagem Recebida: $msg');

  // Tratar erro com Async Await use try catch
  try {
    await processo4();
  } catch (e) {
    print('Erro ao executar $e');
  }

  print('Final do P1');
}

Future<String> processo3() {
  print('Inicio do Processo 03');
  return Future<String>.value(
      Future.delayed(Duration(seconds: 3), () => 'Esta é a resposta do P3'));
}

// Simulando um erro
Future<String> processo4() {
  print('Inicio do Processo 04');
  return Future<String>.value(Future.delayed(Duration(seconds: 3),
      () => throw Exception('Erro ao buscar o processo P4')));
}
