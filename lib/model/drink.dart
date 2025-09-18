abstract class Drink {
  final String name;
  final double price;
  final String imageUrl;

  Drink({required this.name, required this.price, required this.imageUrl});

  String prepareHint(String hint) => "no special instructions";
}

class Tea extends Drink {
  Tea() : super(name: 'Tea', price: 2.0, imageUrl: 'assets/tea.jpg');
  @override
  String prepareHint(String hint) => "Tea Prepared with $hint";
}

class TurkishCoffee extends Drink {
  TurkishCoffee()
    : super(
        name: 'Turkish Coffee',
        price: 2.5,
        imageUrl: 'assets/Turkish_Coffee.jpg',
      );

  @override
  String prepareHint(String hint) => "Turkish Coffee Prepared with $hint";
}

class HibiscusTea extends Drink {
  HibiscusTea()
    : super(
        name: 'Hibiscus Tea',
        price: 4.0,
        imageUrl: 'assets/Hibiscus_Tea.jpg',
      );

  @override
  String prepareHint(String hint) => "Hibiscus Tea Prepared with $hint";
}
