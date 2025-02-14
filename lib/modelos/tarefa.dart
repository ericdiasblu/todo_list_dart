import 'dart:io'; // Importa a biblioteca para entrada de dados pelo terminal

class Tarefa {
  int _idTarefa = 0; // Identificador único para cada tarefa
  String _descTarefa = ""; // Descrição da tarefa
  String _statusTarefa = "Pendente"; // Status inicial da tarefa

  // Getters e Setters para acessar e modificar os atributos privados
  int get idTarefa => _idTarefa;
  set idTarefa(int id) => _idTarefa = id;

  String get descTarefa => _descTarefa;
  set descTarefa(String descricao) => _descTarefa = descricao;

  String get statusTarefa => _statusTarefa;
  set statusTarefa(String status) => _statusTarefa = status;

  List<Map<String, dynamic>> listaTarefa = []; // Lista que armazena todas as tarefas

  // Método para adicionar uma nova tarefa
  void adicionarTarefa() {
    _idTarefa++; // Incrementa o ID da tarefa para garantir unicidade

    print("Digite o nome da tarefa: ");
    String? inputTarefa = stdin.readLineSync(); // Lê a descrição da tarefa do usuário
    _descTarefa = inputTarefa!; // Atribui a descrição à variável correspondente

    // Adiciona a nova tarefa à lista
    listaTarefa.add({
      "idTarefa": _idTarefa,
      "descTarefa": _descTarefa,
      "statusTarefa": _statusTarefa,
    });
  }

  // Método para listar todas as tarefas cadastradas
  void listarTarefa() {
    print("Lista de tarefas:");
    for (var tarefa in listaTarefa) {
      // Exibe cada tarefa no formato [status] id - descrição
      print("[${tarefa['statusTarefa']}] ${tarefa['idTarefa']} - ${tarefa['descTarefa']}");
    }
  }

  // Método para marcar uma tarefa como concluída
  void concluirTarefa() {
    print("Digite o Id da tarefa a ser concluída: ");
    String? inputId = stdin.readLineSync(); // Lê o ID da tarefa a ser concluída
    int idConcluir = int.parse(inputId!); // Converte para inteiro

    for (var tarefa in listaTarefa) {
      if (tarefa['idTarefa'] == idConcluir) { // Encontra a tarefa pelo ID
        tarefa['statusTarefa'] = "Concluída"; // Atualiza o status para "Concluída"
        print("A tarefa \"${tarefa['descTarefa']}\" foi concluída com sucesso!");
      }
    }
  }

  // Método para remover uma tarefa pelo ID
  void removerTarefa() {
    print("Digite o Id da tarefa a ser removida: ");
    String? inputId = stdin.readLineSync(); // Lê o ID da tarefa a ser removida
    int idRemover = int.parse(inputId!); // Converte para inteiro

    // Remove a tarefa da lista caso o ID seja encontrado
    listaTarefa.removeWhere((tarefa) => tarefa['idTarefa'] == idRemover);
    print("A tarefa do Id: $idRemover foi removida com sucesso!");
  }
}
