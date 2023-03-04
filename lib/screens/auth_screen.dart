import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/password_text_fild_widget.dart';
import '../server/auth_server.dart';
import '../screens/home_screen.dart';

class AuthScreen extends StatefulWidget {
  static const routName = '/auth';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  TextEditingController passwordController = TextEditingController();

  var _isLoading = false;

  final _userName = FocusNode();
  final _password = FocusNode();

  @override
  void dispose() {
    _userName;
    _password;
    super.dispose();
  }

  Map<String, String> _authData = {
    'UserName': '',
    'password': '',
  };

  final AuthServer _authServer = AuthServer();

  showToastMassage() {
    Fluttertoast.showToast(
        msg: 'The user name or the password is wrong',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.black54,
        fontSize: 15);
  }

  _submit() {
    if (_authData['UserName']!.isEmpty || _authData['password']!.isEmpty) {
      showToastMassage();
      return;
    } else {
      setState(() {
        _isLoading = true;
      });
      Navigator.of(context).pushReplacementNamed(homeScreen.routName);
    }
  }

  showTheDilog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Crate accout"),
        content: const Text(
            'If you don\'t have an account you must contact with the owner '),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("No"),
          ),
          TextButton(
            onPressed: () {
              launch('tel://+963988156955');
              Navigator.of(context).pop();
            },
            child: const Text('Contact'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    bool obscureText = true;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          //First_background layer
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(96, 140, 170, 0.808),
                  Color.fromRGBO(153, 161, 202, 1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(mediaQuery.height / 3)),
            ),
          ),
          //Second_background layer
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  width: mediaQuery.width,
                  height: mediaQuery.height,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(87, 101, 187, 1),
                        Color.fromRGBO(37, 48, 106, 1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(mediaQuery.height / 2.5),
                    ),
                  ),
                  child: const Image(
                    image: AssetImage(
                      'assets/images/sportsBackground.png',
                    ),
                    opacity: AlwaysStoppedAnimation(.02),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          //Email&Password&login button
          SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: mediaQuery.height / 5,
                      ),
                      Image(
                        image: const AssetImage('assets/images/champions1.png'),
                        fit: BoxFit.cover,
                        height: mediaQuery.height / 5,
                      ),
                      SizedBox(
                        height: mediaQuery.height / 15,
                      ),
                      //email
                      FadeInUp(
                        delay: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                  textInputAction: TextInputAction.next,
                                  onSubmitted: (value) {
                                    FocusScope.of(context)
                                        .requestFocus(_password);
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _authData['UserName'] = value;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'User name',
                                  )),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height / 40,
                      ),
                      //password
                      FadeInUp(
                        delay: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: PasswrdTextFild(
                                password: _password,
                                passwordController: passwordController,
                                newValue: _authData,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height / 20,
                      ),
                      //Login button
                      FadeInUp(
                        delay: const Duration(milliseconds: 500),
                        child: _isLoading
                            ? const CircularProgressIndicator()
                            : TextButton(
                                onPressed: () {
                                  print(_authData['UserName']);
                                  print(_authData['password']);
                                  _submit();
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(240, 249, 255, 0.808),
                                    fontSize: 26,
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: mediaQuery.height / 40,
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Don\'t have an accont?',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: mediaQuery.width / 50,
                            ),
                            GestureDetector(
                              onTap: () {
                                showTheDilog();
                              },
                              child: const Text(
                                'Rigester',
                                style: TextStyle(
                                    color: Color.fromRGBO(240, 249, 255, 0.808),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
