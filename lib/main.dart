import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:rtm/di/dependetcy_injection.dart';
import 'package:rtm/rtm_trivial/presitation/bloc/login_bloc.dart';
import 'package:rtm/rtm_trivial/presitation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initS();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => diPost<LoginBloc>(),
      child: GetMaterialApp(
        home: HomePage(),
      ),
    );
  }
}
