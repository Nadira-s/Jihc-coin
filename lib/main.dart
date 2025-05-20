import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jihc_coin/firebase_options.dart';
import 'package:jihc_coin/providers/user_provider.dart';
import 'package:jihc_coin/screens/first_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: const JIHCCoin(),
    ),
  );
}

class JIHCCoin extends StatelessWidget {
  const JIHCCoin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FirstPage());
  }
}
