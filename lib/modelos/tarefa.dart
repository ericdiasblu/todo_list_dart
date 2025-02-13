import 'dart:io';

class Tarefa {
  int _idTarefa = 0;
  String _descTarefa = "";
  String _statusTarefa = "Pendente";

  // Getters e Setters
  int get idTarefa => _idTarefa;
  set idTarefa(int id) => _idTarefa = id;

  String get descTarefa => _descTarefa;
  set descTarefa(String descricao) => _descTarefa = descricao;

  String get statusTarefa => _statusTarefa;
  set statusTarefa(String status) => _statusTarefa = status;

  List<Map<String, dynamic>> listaTarefa = [];

  void adicionarTarefa() {
    _idTarefa++; 

    print("Digite o nome da tarefa: ");
    String? inputTarefa = stdin.readLineSync();
    _descTarefa = inputTarefa!;

    listaTarefa.add({
      "idTarefa": _idTarefa,
      "descTarefa": _descTarefa,
      "statusTarefa": _statusTarefa,
    });
  }

  void listarTarefa() {
    print("Lista de tarefas:");
    for (var tarefa in listaTarefa) {
      print("[${tarefa['statusTarefa']}] ${tarefa['idTarefa']} - ${tarefa['descTarefa']}");
    }
  }

  void concluirTarefa() {
    print("Digite o Id da tarefa a ser concluída: ");
    String? inputId = stdin.readLineSync();
    int idConcluir = int.parse(inputId!);

    for (var tarefa in listaTarefa) {
      if (tarefa['idTarefa'] == idConcluir) {
        tarefa['statusTarefa'] = "Concluída";
        print("A tarefa \"${tarefa['descTarefa']}\" foi concluída com sucesso!");
      }
    }
  }

  void removerTarefa() {
    print("Digite o Id da tarefa a ser removida: ");
    String? inputId = stdin.readLineSync();
    int idRemover = int.parse(inputId!);

    listaTarefa.removeWhere((tarefa) => tarefa['idTarefa'] == idRemover);
    print("A tarefa do Id: $idRemover foi removida com sucesso!");
  }
}
