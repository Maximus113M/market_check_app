class ShoppingListItemModel {
  String itemName;
  bool isSelected;

  ShoppingListItemModel({required this.itemName, this.isSelected = false});

  void toggleState() {
    isSelected = !isSelected;
  }
}
