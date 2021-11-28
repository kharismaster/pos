import 'package:flutter/material.dart';
import 'package:pos/providers/auth_provider.dart';
import 'package:pos/utils/validator.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  // String? _email, _username, _password;
  var _isLogin = true;
  bool _isLoading = false;

  final _email = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // HEAD
                  Text(_isLogin ? 'Login' : 'Daftar',
                      style: const TextStyle(fontSize: 35)),
                  const SizedBox(height: 30),

                  // USERNAME INPUT
                  TextFormField(
                    key: const ValueKey('username'),
                    autofocus: false,
                    controller: _username,
                    // onSaved: (value) => _username.text = value.toString(),
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      suffixIcon: const Icon(Icons.account_circle),
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 5) {
                        return 'Minimal 5 karakter';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // EMAIL INPUT
                  if (!_isLogin)
                    TextFormField(
                      key: const ValueKey('email'),
                      autofocus: false,
                      controller: _email,
                      validator: (value) => validateEmail(value.toString()),
                      // onSaved: (value) => _email.text = value.toString(),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        suffixIcon: const Icon(Icons.email),
                      ),
                    ),
                  if (!_isLogin) const SizedBox(height: 20),

                  // PASSWORD INPUT
                  TextFormField(
                    key: const ValueKey('password'),
                    autofocus: false,
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      suffixIcon: const Icon(Icons.lock),
                    ),
                    // onSaved: (value) => _password.text = value.toString(),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 5) {
                        return 'Password minimal 5 karakter.';
                      }
                      return null;
                    },
                  ),

                  // PASSWORD CONFIRM INPUT
                  if (!_isLogin) const SizedBox(height: 20),
                  if (!_isLogin)
                    TextFormField(
                      key: const ValueKey('password_confirm'),
                      autofocus: false,
                      controller: _confirmPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        suffixIcon: const Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 5) {
                          return 'Password minimal 5 karakter.';
                        } else if (_password.text != value) {
                          return 'Password tidak sama';
                        }
                        return null;
                      },
                    ),

                  // BUTTON LOGIN
                  const SizedBox(height: 20),
                  _isLoading? const CircularProgressIndicator() :
                  ElevatedButton.icon(
                    onPressed: _isLogin ? login : register,
                    icon: Icon(_isLogin
                        ? Icons.login_rounded
                        : Icons.app_registration),
                    label: Text(
                      _isLogin ? 'Masuk' : 'Daftar',
                      style: const TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),

                  // Forgot Password
                  if (_isLogin)
                    TextButton(
                      onPressed: () {},
                      child: const Text('Lupa Password?'),
                    ),

                  // Button Sign Up
                  TextButton(
                    child: Text(_isLogin
                        ? 'Daftar Akun Baru'
                        : 'Saya sudah punya akun'),
                    // textColor: Theme.of(context).primaryColor, //use at FlatButton // deprecated
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isValid) {
      setState(() {
        _isLoading = true;
      });
      return;
    }
    final Future<Map<String, dynamic>> response =
        AuthProvider().login(_username.text, _password.text);

    response.then((res) {
      setState(() {
        _isLoading = false;
      });
      if (res['status'] == true) {
        Navigator.of(context).pushReplacementNamed('dashboard');
      } else {
        // var message = jsonDecode(res) as Map<String, dynamic>;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(res['message']),
          ),
        );
      }
    });
  }

  void register() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Maaf Sementara Pendaftaran ditutup!', textAlign: TextAlign.center,)),
    );
    // ignore: avoid_print
    print('Register....');
  }
}//end class

