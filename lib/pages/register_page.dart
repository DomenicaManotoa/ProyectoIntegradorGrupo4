// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lbp/components/my_button.dart';
import 'package:lbp/components/my_text_field.dart';
import 'package:lbp/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Regular expressions for validation
  final RegExp nameRegExp = RegExp(r"^[a-zA-ZÀ-ÿÑñ\s]+$");
  final RegExp phoneRegExp = RegExp(r"^\d{10}$");

  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Las contraseñas no coinciden")),
      );
      return;
    }

    if (!nameRegExp.hasMatch(nameController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nombre inválido. Solo se permiten letras.")),
      );
      return;
    }

    if (!nameRegExp.hasMatch(lastNameController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Apellido inválido. Solo se permiten letras.")),
      );
      return;
    }

    if (!phoneRegExp.hasMatch(phoneController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Celular inválido. Debe contener 10 dígitos numéricos.")),
      );
      return;
    }

    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailAndPassword(
        emailController.text,
        passwordController.text,
        nameController.text,
        lastNameController.text,
        phoneController.text,
        addressController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 99),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  // Logo
                  Icon(
                    Icons.pets,
                    size: 150,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 50),

                  // Welcome
                  const Text(
                    "Registrarse",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  const SizedBox(height: 25),

                  // Nombre
                  MyTextField(
                    controller: nameController,
                    hintText: 'Nombre',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  // Apellido
                  MyTextField(
                    controller: lastNameController,
                    hintText: 'Apellido',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  // Email
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  // Celular
                  MyTextField(
                    controller: phoneController,
                    hintText: 'Celular',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  // Dirección
                  MyTextField(
                    controller: addressController,
                    hintText: 'Dirección',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  // Contraseña
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Contraseña',
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),

                  // Confirmar Contraseña
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirma tu contraseña',
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),

                  // Registrarse
                  MyButton(onTap: signUp, text: "Sign up"),

                  const SizedBox(height: 50),

                  // Iniciar sesión
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('¿Ya tienes cuenta?'),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Iniciar sesión',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


