import 'dart:io';

class Tarefa {
  late int idTarefa;
  late String descTarefa;
  String statusTarefa = "Pendente";

  int get getIdTarefa => this.idTarefa;

  set setIdTarefa(int idTarefa) => this.idTarefa = idTarefa;

  String get getDescTarefa => this.descTarefa;

  set setDescTarefa(String descTarefa) => this.descTarefa = descTarefa;

  String get getStatusTarefa => this.statusTarefa;

  set setStatusTarefa(String statusTarefa) => this.statusTarefa = statusTarefa;

  List<Map<String,dynamic>> listaTarefa = [];
  
  void adicionarTarefa() {
    print("Digite o Id da Tarefa: ");
    String? inputId = stdin.readLineSync();
    idTarefa = int.parse(inputId!);

    print("Digite o nome da tarefa: ");
    String? inputTarefa = stdin.readLineSync();
    descTarefa = inputTarefa!;

    listaTarefa.add({
      "idTarefa": idTarefa,
      "descTarefa": descTarefa,
      "statusTarefa": statusTarefa,
    });
  }

  void listarTarefa() {
    print("Lista de tarefas:");
    for (var tarefa in listaTarefa) {
      print("[${tarefa['statusTarefa']}] ${tarefa['idTarefa']} - ${tarefa['descTarefa']}");
    }
  }

  void concluirTarefa() {
    print("Digite o Id da tarefa à ser concluída: ");
    String? inputId = stdin.readLineSync();
    int idConcluir = int.parse(inputId!);

    for(var tarefa in listaTarefa) {
      if(tarefa['idTarefa'] == idConcluir) {
        tarefa['statusTarefa'] = "Concluída";
      }
    }

  }

  void removerTarefa() {
    print("Digite o Id da tarefa à ser removida: ");
     String? inputId = stdin.readLineSync();
     int idRemover = int.parse(inputId!);
     if(idRemover > 0) {
        listaTarefa.removeAt(idRemover-1);
        print("A tarefa do Id: $idRemover foi removida com sucesso!");
     }
  }
}