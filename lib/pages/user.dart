// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lbp/components/my_button.dart';
import 'package:lbp/components/my_text_field.dart';
import 'package:lbp/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late TextEditingController nameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;

  bool isEditing = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance.collection('users').doc(user.uid).get().then((snapshot) {
        if (snapshot.exists) {
          setState(() {
            nameController.text = snapshot['name'];
            lastNameController.text = snapshot['lastName'];
            emailController.text = snapshot['email'];
            phoneController.text = snapshot['phone'];
            addressController.text = snapshot['address'];
          });
        }
      });
    }
  }

  void updateProfile() async {
    if (_formKey.currentState!.validate()) {
      try {
        final authService = Provider.of<AuthService>(context, listen: false);
        await authService.updateUser(
          uid: FirebaseAuth.instance.currentUser!.uid,
          name: nameController.text,
          lastName: lastNameController.text,
          phone: phoneController.text,
          address: addressController.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Perfil actualizado')),
        );
        setState(() {
          isEditing = false;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al actualizar el perfil: $e')),
        );
      }
    }
  }

  void deleteUser() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).delete();
        await user.delete();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cuenta eliminada')),
        );

        Navigator.of(context).pushReplacementNamed('/login');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar la cuenta: $e')),
      );
    }
  }

  void showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar eliminación'),
          content: Text('¿Estás seguro de que deseas eliminar tu cuenta? Esta acción no se puede deshacer.'),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Eliminar', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
                deleteUser();
              },
            ),
          ],
        );
      },
    );
  }

  String? validateName(String value) {
    final nameRegExp = RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$');
    if (value.isEmpty) {
      return 'El nombre es requerido';
    } else if (!nameRegExp.hasMatch(value)) {
      return 'Solo se permiten letras, tildes y ñ';
    }
    return null;
  }

  String? validateLastName(String value) {
    final lastNameRegExp = RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$');
    if (value.isEmpty) {
      return 'El apellido es requerido';
    } else if (!lastNameRegExp.hasMatch(value)) {
      return 'Solo se permiten letras, tildes y ñ';
    }
    return null;
  }

  String? validatePhone(String value) {
    final phoneRegExp = RegExp(r'^\d{10}$');
    if (value.isEmpty) {
      return 'El celular es requerido';
    } else if (!phoneRegExp.hasMatch(value)) {
      return 'El celular debe tener exactamente 10 números';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 99),
      appBar: AppBar(
        title: Text('Perfil de Usuario'),
        actions: [
          if (!isEditing)
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  isEditing = true;
                });
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyTextField(
                  controller: nameController,
                  hintText: 'Nombre',
                  obscureText: false,
                  enabled: isEditing,
                  validator: (value) => validateName(value!),
                  icon: Icon(Icons.person),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: lastNameController,
                  hintText: 'Apellido',
                  obscureText: false,
                  enabled: isEditing,
                  validator: (value) => validateLastName(value!),
                  icon: Icon(Icons.person_outline),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  enabled: false,
                  icon: Icon(Icons.email),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: phoneController,
                  hintText: 'Celular',
                  obscureText: false,
                  enabled: isEditing,
                  validator: (value) => validatePhone(value!),
                  icon: Icon(Icons.phone),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: addressController,
                  hintText: 'Dirección',
                  obscureText: false,
                  enabled: isEditing,
                  icon: Icon(Icons.home),
                ),
                const SizedBox(height: 20),
                if (isEditing)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: MyButton(
                              onTap: updateProfile,
                              text: 'Guardar cambios',
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: MyButton(
                              onTap: () {
                                setState(() {
                                  isEditing = false;
                                });
                              },
                              text: 'Cancelar',
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      MyButton(
                        onTap: showDeleteConfirmationDialog,
                        text: 'Eliminar cuenta',
                        color: Colors.red,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
