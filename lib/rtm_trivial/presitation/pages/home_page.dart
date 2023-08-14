import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rtm/rtm_trivial/presitation/bloc/login_bloc.dart';
import 'package:rtm/rtm_trivial/presitation/widegt/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late LoginBloc loginBloc;
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
    print(GetPostEvent("", ""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          print("ishladi");
          if (state is LoginSuccessState) {
            print("Succes state");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => LoginPage()),
            );
          }
        },
        builder: (context, state) {
          if (state is LoginInitial) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: txt1,
                    decoration: const InputDecoration(
                      hintText: "Login",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: txt2,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    String name = txt1.text;
                    String password = txt2.text;
                    loginBloc.add(
                      GetPostEvent(
                        name,
                        password,
                      ),
                    );
                    print(
                      GetPostEvent(
                        name,
                        password,
                      ),
                    );
                    print(state);
                  },
                  child: const Text(
                    "Ok",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blueAccent,
                )
              ],
            );
          } else if (state is LoginLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoginFailureState) {
            return const Center(child: Text("Failed to log in"));
          } else {
            return const Center(child: Text("HomePage"));
          }
        },
      ),
    );
  }
}
