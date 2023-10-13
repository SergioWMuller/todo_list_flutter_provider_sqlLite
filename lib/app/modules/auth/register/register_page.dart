import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_field.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_logo.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Column(children: [
          Text(
            'Atividades Diárias',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            'Cadastro',
            style: TextStyle(fontSize: 16),
          ),
        ]),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: ClipOval(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.arrow_back_ios_new_outlined),
            ),
          ),
        ),
      ),
      body: ListView(children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * .5,
          child: const FittedBox(
            fit: BoxFit.fitHeight,
            child: TodoListLogo(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Form(
            child: Column(
              children: [
                TodoListField(
                  label: 'E-mail',
                ),
                const SizedBox(height: 20),
                TodoListField(
                  label: 'Senha',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                TodoListField(
                  label: 'Confirmar Senha',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Salvar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
