class CategoryModel {
  String id;
  String name;
  String imageName;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageName,
  });

  static List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'General', imageName: 'general'),
    CategoryModel(id: '2', name: 'Business', imageName: 'business'),
    CategoryModel(id: '3', name: 'Sport', imageName: 'sport'),
    CategoryModel(id: '4', name: 'Entertainment', imageName: 'entertainment'),
    CategoryModel(id: '5', name: 'Technology', imageName: 'technology'),
    CategoryModel(id: '6', name: 'Science', imageName: 'science'),
    CategoryModel(id: '7', name: 'Health', imageName: 'health'),
  ];
}
