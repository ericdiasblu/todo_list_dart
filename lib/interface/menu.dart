import 'dart:io'; // Importa a biblioteca para entrada de dados pelo terminal

import '../modelos/tarefa.dart'; // Importa a classe Tarefa do diretório de modelos

class Menu {
  late int opcao = 0; // Declaração da variável que armazenará a opção do usuário

  // Método responsável por exibir o menu e executar a opção selecionada
  void selecionarOpcao() {
    Tarefa tarefa = Tarefa(); // Cria uma instância da classe Tarefa

    while (opcao != 5) { // Loop que mantém o menu ativo até que o usuário escolha sair
      print("\n1 - Adicionar Tarefa\n2 - Listar Tarefas\n3 - Concluir Tarefas\n4 - Remover Tarefa\n5 - Sair\n");

      print("Opção: ");
      String? inputOpcao = stdin.readLineSync(); // Lê a entrada do usuário
      opcao = int.parse(inputOpcao!); // Converte a entrada para inteiro (pode gerar erro se for inválida)

      switch(opcao) {
        case 1: 
          tarefa.adicionarTarefa(); // Chama o método para adicionar uma tarefa
          break;
        case 2:
          tarefa.listarTarefa(); // Chama o método para listar as tarefas
          break;
        case 3:
          tarefa.concluirTarefa(); // Chama o método para marcar uma tarefa como concluída
          break;
        case 4:
          tarefa.removerTarefa(); // Chama o método para remover uma tarefa
          break;
        case 5:
          print("Programa finalizado!"); // Exibe mensagem de saída
          break;
        default:
          print("Opção inválida! Tente novamente."); // Trata opções inválidas
      }
    }
  }
}
