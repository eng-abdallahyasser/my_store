class Item {
  String name = "default name";
  int price = 0;
  int oldPrice = 0;
  int quantity = 0;
  String description = "default desc";
  String category = "category";

  constructor(name, price, oldPrice, quantity, description, category) {
    this.name = name;
    this.price = price;
    this.oldPrice = oldPrice;
    this.quantity = quantity;
    this.description = description;
    this.category = category;
  }
  
}
