import 'package:flutter/material.dart';
import 'user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage());
  }
}

Map<String, user> users = {
  "hsassan4434@gmail.com":
      user(email: 'hsassan4434@gmail.com', password: '12345')
};
bool isSecured = true;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 86, 134, 174),
        centerTitle: true,
        title: const Text(
          "login",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 25,
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 25,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.message,
            color: Colors.white,
            size: 25,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/OIP.jpg',
              width: 350,
              height: 350,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        label: Text('Enter Email'),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.blueGrey,
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide())),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isSecured,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        label: Text('Enter password'),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.blueGrey,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState() {
                              isSecured = !isSecured;
                            }

                            ;
                          },
                          icon: Icon(Icons.remove_red_eye_sharp),
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide())),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    obscureText: isSecured,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        label: Text('Conform password'),
                        prefixIcon: Icon(
                          Icons.lock_clock_sharp,
                          color: Colors.blueGrey,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState() {
                              isSecured = !isSecured;
                            }

                            ;
                          },
                          icon: Icon(Icons.remove_red_eye_sharp),
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide())),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      user User = users[emailController.text]!;

                      if (User.email == emailController.text &&
                        User.password == passwordController.text) {
                        print('loged');
                      } else {
                        print('email and password is not correct');
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.login_sharp, color: Colors.white),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
