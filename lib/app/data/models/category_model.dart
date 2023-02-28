class CategoryModel {
  String? categoryId;
  String? categoryName;
  String? imageurl;

  CategoryModel(this.categoryId, this.categoryName, this.imageurl);

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    imageurl = json['imageurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['imageurl'] = imageurl;
    return data;
  }

}