import 'package:budget_ui/models/transaksi.dart';
import 'package:budget_ui/pages/Root_App.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(transaksiNeedsAdapter());
  await Hive.openBox<transaksiNeeds>('TransaksiNeeds');

  Hive.registerAdapter(transaksiWantsAdapter());
  await Hive.openBox<transaksiWants>('TransaksiWants');

  Hive.registerAdapter(transaksiSavingsAdapter());
  await Hive.openBox<transaksiSavings>('TransaksiSavings');

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RootApp(),
  ));
}
