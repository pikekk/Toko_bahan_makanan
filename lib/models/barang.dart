class Barang {
  String nama;
  double harga;
  int qty;
  String? imagePath;
  int stok; // Stok tersedia

  Barang({required this.nama, required this.harga, required this.qty, this.imagePath, this.stok = 0}) {
    if (harga < 0) throw ArgumentError('Harga tidak boleh negatif');
    if (qty <= 0) throw ArgumentError('Qty harus lebih dari 0');
  }

  double get total => harga * qty;
}