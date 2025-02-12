import 'dart:io';

class Tarefa {
  late int idTarefa = 0;
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
    idTarefa++;

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
    int idConcluir = -1;
    do{
      print("Digite o Id da tarefa à ser concluída: ");
      String? inputId = stdin.readLineSync();
      idConcluir = int.parse(inputId!);
    }while(idConcluir < 0);

    for(var tarefa in listaTarefa) {
      if(tarefa['idTarefa'] == idConcluir) {
        tarefa['statusTarefa'] = "Concluída";
      }
    }
  }

  void removerTarefa() {
    int idRemover = -1;
    do {
     print("Digite o Id da tarefa à ser removida: ");
     String? inputId = stdin.readLineSync();
     idRemover = int.parse(inputId!);
    } while(idRemover < 0);
    
     listaTarefa.removeAt(idRemover-1);
     print("A tarefa do Id: $idRemover foi removida com sucesso!");
     
  }
}