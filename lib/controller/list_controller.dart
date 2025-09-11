import 'package:butter/model/product.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Observable list of product categories
  final RxList<ProductCategory> categories = <ProductCategory>[].obs;

  // Observable map for expanded sections
  final RxMap<String, bool> expandedSections = <String, bool>{}.obs;

  // Observable map for selected products
  final RxMap<String, bool> selectedProducts = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeData();
    _initializeSelectedProducts();
  }

  void _initializeData() {
    categories.value = [
      const ProductCategory(
        name: "Produce",
        products: [
          Product(id: "1", name: "Bananas", quantity: 2),
          Product(id: "2", name: "Carrots", quantity: 4),
          Product(id: "3", name: "Cherry toms",quantity: 6),
          Product(
            id: "4",
            name: "Spinach",
            subtitle: "The prewashed ones with the purple label",
            quantity: 2,
          ),
        ],
      ),
      const ProductCategory(
        name: "Pantry",
        products: [
          Product(id: "5", name: "Olive oil"),
          Product(id: "6", name: "Rice", subtitle: "Basmati 1kg"),
          Product(id: "7", name: "Pasta", subtitle: "Spaghetti"),
        ],
      ),
      const ProductCategory(
        name: "Baby",
        products: [
          Product(id: "8", name: "Diapers", subtitle: "Size 3"),
          Product(id: "9", name: "Baby Food", subtitle: "Apple & Banana puree"),
          Product(id: "10", name: "Baby Wipes", subtitle: "Sensitive skin"),
        ],
      ),
      const ProductCategory(
        name: "Household",
        products: [
          Product(id: "11", name: "Detergent", subtitle: "Washing powder"),
          Product(id: "12", name: "Toilet Paper", subtitle: "12 pack"),
          Product(id: "13", name: "Dish Soap", subtitle: "Lemon scented"),
        ],
      ),
    ];

    // Initialize all sections as collapsed
    for (var category in categories) {
      expandedSections[category.name] = false;
    }
  }

  // Toggle category expansion
  void toggleCategory(String categoryName) {
    expandedSections[categoryName] = !(expandedSections[categoryName] ?? false);
  }

  // Check if category is expanded
  bool isCategoryExpanded(String categoryName) {
    return expandedSections[categoryName] ?? false;
  }

  // Get products for a category (reactive)
  List<Product> getProductsForCategory(String categoryName) {
    final category = categories.firstWhereOrNull(
      (cat) => cat.name == categoryName,
    );
    return category?.products ?? [];
  }

  // Remove product from category
  void removeProduct(String categoryName, String productId) {
    final categoryIndex = categories.indexWhere(
      (cat) => cat.name == categoryName,
    );
    if (categoryIndex != -1) {
      final updatedProducts = List<Product>.from(
        categories[categoryIndex].products,
      );
      updatedProducts.removeWhere((product) => product.id == productId);

      if (updatedProducts.isEmpty) {
        categories.removeAt(categoryIndex);
        expandedSections.remove(categoryName);
      } else {
        final updatedCategory = ProductCategory(
          name: categories[categoryIndex].name,
          products: updatedProducts,
        );
        categories[categoryIndex] = updatedCategory;
      }

      categories.refresh();
    }
  }

  // Initialize selected products map
  void _initializeSelectedProducts() {
    // Initialize all products as unselected
    for (var category in categories) {
      for (var product in category.products) {
        selectedProducts[product.id] = false;
      }
    }
  }

  // Toggle product selection
  void toggleProductSelection(String productId) {
    selectedProducts[productId] = !(selectedProducts[productId] ?? false);
  }

  // Check if product is selected
  bool isProductSelected(String productId) {
    return selectedProducts[productId] ?? false;
  }

  // Get total selected products count
  int get totalSelectedCount {
    return selectedProducts.values.where((selected) => selected).length;
  }

  // Get all selected products
  List<Product> get getSelectedProducts {
    List<Product> selected = [];
    for (var category in categories) {
      for (var product in category.products) {
        if (selectedProducts[product.id] ?? false) {
          selected.add(product);
        }
      }
    }
    return selected;
  }

  // Clear all selections
  void clearAllSelections() {
    for (String productId in selectedProducts.keys) {
      selectedProducts[productId] = false;
    }
  }

  // Select all products
  void selectAllProducts() {
    for (String productId in selectedProducts.keys) {
      selectedProducts[productId] = true;
    }
  }
}
