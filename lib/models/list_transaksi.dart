class TransaksiModel {
  String nama;
  String icon;
  String total;

  TransaksiModel(this.nama, this.icon, this.total);
}

List<TransaksiModel> transaksiNeeds = dataTransaksiNeeds
    .map((item) => TransaksiModel(item['nama'], item['icon'], item['total']))
    .toList();

var dataTransaksiNeeds = [
  {
    "nama": "Listrik",
    "icon": "assets/images/listrik.png",
    "total": "Rp 150.000",
  },
  {
    "nama": "Air",
    "icon": "assets/images/air.png",
    "total": "Rp 150.000",
  },
  {
    "nama": "Makan",
    "icon": "assets/images/food.png",
    "total": "Rp 400.000",
  },
];

List<TransaksiModel> transaksiWants = dataTransaksiWants
    .map((item) => TransaksiModel(item['nama'], item['icon'], item['total']))
    .toList();

var dataTransaksiWants = [
  {
    "nama": "Bioskop",
    "icon": "assets/images/movie.png",
    "total": "Rp 150.000",
  },
  {
    "nama": "Kuota",
    "icon": "assets/images/kuota.png",
    "total": "Rp 150.000",
  },
  {
    "nama": "Steam",
    "icon": "assets/images/game.png",
    "total": "Rp 400.000",
  },
];

List<TransaksiModel> transaksiSavings = dataTransaksiSavings
    .map((item) => TransaksiModel(item['nama'], item['icon'], item['total']))
    .toList();

var dataTransaksiSavings = [
  {
    "nama": "Laptop",
    "icon": "assets/images/laptop.png",
    "total": "Rp 150.000",
  },
  {
    "nama": "Motor",
    "icon": "assets/images/motor.png",
    "total": "Rp 150.000",
  },
  {
    "nama": "Haji",
    "icon": "assets/images/muslim.png",
    "total": "Rp 400.000",
  }
];
