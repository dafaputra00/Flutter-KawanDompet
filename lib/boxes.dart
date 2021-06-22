import 'package:budget_ui/models/transaksi.dart';
import 'package:hive/hive.dart';

class NeedsBox {
  static Box<transaksiNeeds> getTransactions() =>
      Hive.box<transaksiNeeds>('TransaksiNeeds');
}

class WantsBox {
  static Box<transaksiWants> getTransactions() =>
      Hive.box<transaksiWants>('TransaksiWants');
}

class SavingsBox {
  static Box<transaksiSavings> getTransactions() =>
      Hive.box<transaksiSavings>('TransaksiSavings');
}
