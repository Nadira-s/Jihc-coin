import 'package:flutter/material.dart';
import 'package:jihc_coin/providers/user_provider.dart';
import 'package:jihc_coin/screens/first_page.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
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
