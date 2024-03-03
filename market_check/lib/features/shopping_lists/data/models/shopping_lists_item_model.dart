class ShoppingListItemModel {
  String itemName;
  bool isSelected;
  int counterItems;

  ShoppingListItemModel(
      {required this.itemName,
      this.isSelected = false,
      required this.counterItems});

  void toggleState() {
    isSelected = !isSelected;
  }

  factory ShoppingListItemModel.fromJson(json) => ShoppingListItemModel(
        itemName: json['item_name'],
        counterItems: json['counter_items'],
        isSelected: json['is_selected'],
      );

  Map<String, dynamic> toMap() => {
        "item_name": itemName,
        "is_selected": isSelected,
        "counter_items": counterItems
      };
}
