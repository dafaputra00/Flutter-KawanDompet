import 'package:budget_ui/models/transaksi.dart';
import 'package:hive/hive.dart';

class NeedsBox {
  static Box<transaksiNeeds> getTransactions() =>
      Hive.box<transaksiNeeds>('TransaksiNeeds');
}
