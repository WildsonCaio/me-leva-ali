import 'package:flutter/material.dart';
import 'package:me_leva_ali/main.dart';
import 'package:me_leva_ali/services/firebase_service.dart';
import 'package:me_leva_ali/views/home_page.dart';
import 'package:me_leva_ali/views/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAuthentication();
  }

  checkAuthentication() async {
    var user = await isAuthenticated();
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  message() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Email ou Senha incorretos.'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: double.infinity,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Usuário',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Senha',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                var authenticaded =
                    await login(emailController.text, passwordController.text);
                if (authenticaded == true) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                } else {
                  message();
                }
              },
              child: const Text('Entrar'),
            ),
            TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          title: Text(
                            'Você é:',
                            textAlign: TextAlign.center,
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ButtonStyle(),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterPage(
                                          userType: 'User',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text('Email'),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterPage(
                                          userType: 'Driver',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text('Motorista'),
                                ),
                              ),
                            ],
                          ));
                    },
                  );
                },
                child: const Text('Cadastre-se'))
          ],
        ),
      ),
    );
  }
}
