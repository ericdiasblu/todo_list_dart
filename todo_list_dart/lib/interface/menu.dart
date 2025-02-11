import 'dart:io';

import 'package:todo_list_dart/modelos/tarefa.dart';

class Menu {

late int opcao = 0;

void selecionarOpcao() {
  Tarefa tarefa = Tarefa();

  while (opcao != 5) {
    print("\n1 - Adicionar Tarefa\n2 - Listar Tarefas\n3 - Concluir Tarefas\n4 - Remover Tarefa\n5 - Sair\n");

  print("Opção: ");
  String? inputOpcao = stdin.readLineSync();
  opcao = int.parse(inputOpcao!);

  switch(opcao) {
  case 1: 
  tarefa.adicionarTarefa();
  break;
  case 2:
  print("Lista de tarefas:");
  tarefa.listarTarefa();
  break;
  case 3:
  print("Digite a tarefa à ser concluída: ");
  break;
  case 4:
  print("Digite a tarefa à ser removida: ");
  break;
  case 5:
  break;
  
    }
  }
  }
}