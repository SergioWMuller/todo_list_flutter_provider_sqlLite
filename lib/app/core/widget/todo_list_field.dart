import 'package:flutter/material.dart';

class TodoListField extends StatelessWidget {
  final String label;
  final IconButton? suffixIconButton;
  final bool obscureText;
  final ValueNotifier<bool> obscureTextValueNotifier;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  TodoListField({
    Key? key,
    required this.label,
    this.suffixIconButton,
    this.obscureText = false,
    this.controller,
    this.validator,
  })  : assert(obscureText == true ? suffixIconButton == null : true, 'obscureText não pode ser enviado em conjunto com suffixIconButton !'),
        obscureTextValueNotifier = ValueNotifier(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: obscureTextValueNotifier,
        builder: (context, obscureTextValue, child) {
          return TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.red),
              ),
              isDense: true,
              suffixIcon: suffixIconButton ??
                  (obscureText == true
                      ? IconButton(
                          onPressed: () {
                            obscureTextValueNotifier.value = !obscureTextValue;
                          },
                          icon: Icon(!obscureTextValue ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                        )
                      : null),
            ),
            obscureText: obscureTextValue,
          );
        });
  }
}
