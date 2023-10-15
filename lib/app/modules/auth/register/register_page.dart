import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_field.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_logo.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    super.dispose();
  }

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
      body: ListView(
        children: [
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
              key: _formkey,
              child: Column(
                children: [
                  TodoListField(
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail obrigatório'),
                      Validatorless.email('E-mail inválido.'),
                    ]),
                    label: 'E-mail',
                  ),
                  const SizedBox(height: 20),
                  TodoListField(
                    controller: _passwordEC,
                    label: 'Senha',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha Obrigatória'),
                      Validatorless.min(6, 'Crie Senha com no mínimo de 6 caracteres.'),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  TodoListField(
                    controller: _confirmPasswordEC,
                    label: 'Confirmar Senha',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo Confirmar Senha é Obrigatório.'),
                      Validatorless.compare(_passwordEC, 'Senhas diferentes, favor conferir as duas senhas.'),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        final formValid = _formkey.currentState?.validate() ?? '';
                      },
                      child: const Text('Salvar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
