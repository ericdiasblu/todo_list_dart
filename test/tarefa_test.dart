import 'package:test/test.dart';
import 'package:todo_list_dart/modelos/tarefa.dart';

void main() {
  group('Tarefa', () {
    late Tarefa tarefa;

    setUp(() {
      tarefa = Tarefa();
    });

    test('Adicionar uma tarefa', () {
      tarefa.descTarefa = 'Estudar Dart';
      tarefa.listaTarefa.add({
        "idTarefa": 1,
        "descTarefa": tarefa.descTarefa,
        "statusTarefa": tarefa.statusTarefa,
      });

      expect(tarefa.listaTarefa.length, equals(1));
      expect(tarefa.listaTarefa[0]['descTarefa'], equals('Estudar Dart'));
      expect(tarefa.listaTarefa[0]['statusTarefa'], equals('Pendente'));
    });

    test('Listar tarefas adicionadas', () {
      tarefa.listaTarefa.add({"idTarefa": 1, "descTarefa": "Fazer compras", "statusTarefa": "Pendente"});
      tarefa.listaTarefa.add({"idTarefa": 2, "descTarefa": "Ir à academia", "statusTarefa": "Pendente"});

      expect(tarefa.listaTarefa.length, equals(2));
      expect(tarefa.listaTarefa[1]['descTarefa'], equals("Ir à academia"));
    });

    test('Concluir uma tarefa', () {
      tarefa.listaTarefa.add({"idTarefa": 1, "descTarefa": "Fazer compras", "statusTarefa": "Pendente"});

      for (var t in tarefa.listaTarefa) {
        if (t["idTarefa"] == 1) {
          t["statusTarefa"] = "Concluída";
        }
      }

      expect(tarefa.listaTarefa[0]["statusTarefa"], equals("Concluída"));
    });

    test('Remover uma tarefa', () {
      tarefa.listaTarefa.add({"idTarefa": 1, "descTarefa": "Fazer compras", "statusTarefa": "Pendente"});
      tarefa.listaTarefa.add({"idTarefa": 2, "descTarefa": "Ler um livro", "statusTarefa": "Pendente"});

      tarefa.listaTarefa.removeAt(0);

      expect(tarefa.listaTarefa.length, equals(1));
      expect(tarefa.listaTarefa[0]["descTarefa"], equals("Ler um livro"));
    });
  });
}
