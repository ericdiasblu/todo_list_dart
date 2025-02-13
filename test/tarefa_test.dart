import 'package:test/test.dart';
import 'package:todo_list_dart/modelos/tarefa.dart';

void main() {
  group('Teste da classe Tarefa', () {
    late Tarefa tarefa;

    setUp(() {
      tarefa = Tarefa(); 
    });

    test('Adicionar uma tarefa', () {
      tarefa.idTarefa = 1;
      tarefa.descTarefa = "Estudar Dart";
      tarefa.statusTarefa = "Pendente";

      tarefa.listaTarefa.add({
        "idTarefa": tarefa.idTarefa,
        "descTarefa": tarefa.descTarefa,
        "statusTarefa": tarefa.statusTarefa,
      });

      expect(tarefa.listaTarefa.length, equals(1));
      expect(tarefa.listaTarefa[0]['descTarefa'], equals("Estudar Dart"));
      expect(tarefa.listaTarefa[0]['statusTarefa'], equals("Pendente"));
    });

    test('Concluir uma tarefa', () {
      tarefa.listaTarefa.add({
        "idTarefa": 1,
        "descTarefa": "Fazer compras",
        "statusTarefa": "Pendente",
      });

      tarefa.listaTarefa.firstWhere((t) => t['idTarefa'] == 1)['statusTarefa'] = "Concluída";

      expect(tarefa.listaTarefa[0]['statusTarefa'], equals("Concluída"));
    });

    test('Remover uma tarefa', () {
      tarefa.listaTarefa.add({"idTarefa": 1, "descTarefa": "Ler um livro", "statusTarefa": "Pendente"});
      tarefa.listaTarefa.add({"idTarefa": 2, "descTarefa": "Ir à academia", "statusTarefa": "Pendente"});

      tarefa.listaTarefa.removeWhere((t) => t['idTarefa'] == 1);

      expect(tarefa.listaTarefa.length, equals(1));
      expect(tarefa.listaTarefa[0]['descTarefa'], equals("Ir à academia"));
    });

    test('Verificar ID único ao adicionar tarefas', () {
      tarefa.idTarefa = 1;
      tarefa.descTarefa = "Lavar o carro";
      tarefa.statusTarefa = "Pendente";

      tarefa.listaTarefa.add({
        "idTarefa": tarefa.idTarefa,
        "descTarefa": tarefa.descTarefa,
        "statusTarefa": tarefa.statusTarefa,
      });

      tarefa.idTarefa = 2;
      tarefa.descTarefa = "Fazer exercícios";

      tarefa.listaTarefa.add({
        "idTarefa": tarefa.idTarefa,
        "descTarefa": tarefa.descTarefa,
        "statusTarefa": tarefa.statusTarefa,
      });

      expect(tarefa.listaTarefa.length, equals(2));
      expect(tarefa.listaTarefa[1]['idTarefa'], equals(2));
    });
  });
}
