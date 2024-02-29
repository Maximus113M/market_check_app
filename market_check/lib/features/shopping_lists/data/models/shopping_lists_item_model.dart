class ShoppingListItemModel {
  String itemName;
  bool isSelected;
  int counterItems;

  ShoppingListItemModel({required this.itemName, this.isSelected = false, required this.counterItems});

  void toggleState() {
    isSelected = !isSelected;
  }

  Map<String, dynamic>toMap()=>{
    "itemName": itemName,
    "isSelected": isSelected,
    "counterItems": counterItems
  };
}
