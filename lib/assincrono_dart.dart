void run() {
  print('inicio do P1');

  processo2();

  processo3()
      .then((mensagem) => 'Mensagem Recebida: $mensagem')
      .then((mensagem) => print(mensagem))
      .whenComplete(() => print('P3 Finalizado'));

  // Uma forma de tratar o erro
  processo4()
      .then((mensagem) => print(mensagem),
          onError: (err) => print('Mensagem de erro tratada: $err'))
      .whenComplete(() => print('P4 Finalizado utilizando o onError'));

  // Outra forma de tratar o erro
  processo4()
      .then((mensagem) => print(mensagem))
      .catchError((err) => print('Mensagem de erro tratada: $err'))
      .whenComplete(() => print('P4 Finalizado utilizando o catchError'));

  print('Final do P1');
}

void processo2() {
  print('Inicio do P2');

  Future.delayed(Duration(seconds: 2), () {
    for (int i = 0; i < 5; i++) {
      print(i);
    }
    print('Final do P2');
  });
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
