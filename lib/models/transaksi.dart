import 'barang.dart';

class Transaksi {
  List<Barang> keranjang = [];

  void tambahBarang(Barang barang) {
    keranjang.add(barang);
  }

  double get totalBelanja => keranjang.fold(0, (sum, item) => sum + item.total);

  void checkout() {
    // Logic checkout, misal print struk atau simpan
    keranjang.clear();
  }
}