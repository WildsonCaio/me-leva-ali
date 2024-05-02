import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:me_leva_ali/components/driver_options.dart';
import 'package:me_leva_ali/services/firebase_service.dart';
import 'package:me_leva_ali/views/login_page.dart';

class RegisterPage extends StatefulWidget {
  String userType;

  RegisterPage({super.key, required this.userType});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String vehicleController = '';
  String vehiclemodelController = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatpasswordController = TextEditingController();
  dynamic imageUser;
  dynamic imageVehicle;
  bool isLoading = false;

  message() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Usuário cadastrado com sucesso.'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 4),
      ),
    );
  }

  userImage() async {
    ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        imageUser = File(image.path);
      }
    });
  }

  vehicleImage() async {
    ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        imageVehicle = File(image.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: imageUser == null ? userImage : null,
                    onLongPress: () {
                      setState(() {
                        imageUser = null;
                      });
                    },
                    child: Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 10),
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          image: imageUser != null
                              ? DecorationImage(
                                  image: FileImage(File(imageUser.path)),
                                  fit: BoxFit.cover)
                              : null,
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(136, 158, 158, 158),
                        ),
                        child: imageUser == null
                            ? const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Foto de perfil')
                                ],
                              )
                            : null),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  widget.userType == 'Driver'
                      ? GestureDetector(
                          onTap: imageVehicle == null ? vehicleImage : null,
                          onLongPress: () {
                            setState(() {
                              imageVehicle = null;
                            });
                          },
                          child: Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 10),
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                image: imageVehicle != null
                                    ? DecorationImage(
                                        image: FileImage(imageVehicle),
                                        fit: BoxFit.cover)
                                    : null,
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(136, 158, 158, 158),
                              ),
                              child: imageVehicle == null
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.person,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        const Text('Foto do Veículo')
                                      ],
                                    )
                                  : null),
                        )
                      : SizedBox()
                ],
              ),
              widget.userType == 'Driver'
                  ? DriverOptions(
                      vehiclemodel: (value) => vehiclemodelController = value,
                      vehicletype: (value) => vehicleController = value,
                    )
                  : const SizedBox(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome*',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Contato*',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha*',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  controller: repeatpasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Repita sua Senha*',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = !isLoading;
                    });
                    await registerUser(
                      imageUser,
                      imageVehicle,
                      vehicleController,
                      vehiclemodelController,
                      nameController.text,
                      phoneController.text,
                      emailController.text,
                      passwordController.text,
                    );
                    isLoading = !isLoading;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                    message();
                  },
                  child: isLoading == false
                      ? Text('Cadastrar')
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
