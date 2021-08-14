class product {
  int quantity;
  int totalQuantity;
  bool selected = false;
  bool selectedAdd = false;
  String name;
  String descreption;
  double price;
  String path;
  bool stock;
  bool nostok;
  String form;
  int id;
  product(this.id, this.quantity, this.totalQuantity, this.name, this.form,
      this.descreption, this.price, this.path, this.stock, this.nostok);
}
