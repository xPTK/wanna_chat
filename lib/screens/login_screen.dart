import 'package:flutter/material.dart';
import 'package:wanna_chat/screens/home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bubbles_background.jpg'),
              fit: BoxFit.cover,
              opacity: 0.1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Wanna',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 64,
                              fontFamily: 'Boogaloo',
                            ),
                          ),
                          TextSpan(
                            text: 'Chat?',
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 64,
                              fontFamily: 'Boogaloo',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        width: 1.5,
                        height: 24.0,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.chat_outlined,
                      size: 48,
                    ),
                  ],
                ),
                Center(
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Chat with everyone. ",
                          style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 22,
                            fontFamily: 'Boogaloo',
                          ),
                        ),
                        TextSpan(
                          text: "Anywhere in the world.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontFamily: 'Boogaloo',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outlined),
                    labelText: 'Enter your email address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock_outlined),
                    labelText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 55),
                    backgroundColor: Colors.cyan,
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.white),
                    elevation: 5.0,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
