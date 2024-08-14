import 'package:flutter_template/util/environment/environment.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/provider/domain_providers.dart';
import 'package:flutter_template/util/constant/color_constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const flavorName = String.fromEnvironment('flavor');
  final flavor = Flavor.values.byName(flavorName);
  await Firebase.initializeApp(
    options: firebaseOptionsWithFlavor(flavor),
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  @override
  void initState() {
    Future(() async {
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   final router = ref.watch(routerProvider);
    return MaterialApp.router(
      theme: ThemeData(
        primaryColor: ColorConstant.black100,
        fontFamily: 'Kaisei_Decol',
        dividerColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
