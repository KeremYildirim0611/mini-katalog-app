import '../models/product.dart';

final List<Map<String, dynamic>> fakeApiData = [
  {
    "id": 1,
    "title": "AirPods Pro (2nd Gen)",
    "price": 249.0,
    "description": "Zenginleştirilmiş ses deneyimi ve 2 kat daha fazla Aktif Gürültü Engelleme özelliği ile kendi dünyanıza odaklanın.",
    "image": "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MQD83?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1660803972361"
  },
  {
    "id": 2,
    "title": "AirPods Max",
    "price": 549.0,
    "description": "Kusursuz uyum ve yüksek kaliteli sesin birleşimi. Baş döndürücü bir duyma deneyimi için tasarlandı.",
    "image": "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/airpods-max-select-silver-202011?wid=470&hei=556&fmt=png-alpha&.v=1604021221000"
  },
  {
     "id": 3,
     "title": "HomePod Mini",
     "price": 99.0,
     "description": "İnanılmaz derecede büyük bir ses. Odayı dolduran 360 derece ses deneyimi sunan akıllı hoparlör.",
     "image": "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/homepod-mini-select-orange-202110?wid=940&hei=1112&fmt=png-alpha&.v=1632925511000"
  },
  {
    "id": 4,
    "title": "MacBook Pro 14\"",
    "price": 1999.0,
    "description": "M serisi çip ile nefes kesen performans. Profesyoneller için sınırları zorlayan güç.",
    "image": "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mbp14-spacegray-select-202310?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1697230830200"
  },
  {
    "id": 5,
    "title": "Akıllı Spor Saati",
    "price": 349.0,
    "description": "Zorlu koşu antrenmanları için özel kronometre barındıran, hassas GPS'li akıllı saat.",
    "image": "https://images.unsplash.com/photo-1579586337278-3befd40fd17a?auto=format&fit=crop&w=500&q=80"
  },
  {
    "id": 6,
    "title": "Mekanik Kodlama Klavyesi",
    "price": 189.50,
    "description": "Yazılım geliştiriciler ve bilgisayar mühendisleri için uzun saatler süren kodlama seanslarında yormayan, sessiz switch'lere sahip premium klavye.",
    "image": "https://images.unsplash.com/photo-1595225476474-87563907a212?auto=format&fit=crop&w=500&q=80"
  },
  {
    "id": 7,
    "title": "Kablosuz Araç Multimedya Ekranı",
    "price": 429.0,
    "description": "Sedan araçların konsoluna tam oturan, trim sesi yapmayan yüksek çözünürlüklü akıllı yol bilgisayarı ve CarPlay ekranı.",
    "image": "https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?auto=format&fit=crop&w=500&q=80"
  }
];

List<Product> dummyProducts = fakeApiData.map((json) => Product.fromJson(json)).toList();