class ItemModel {
  int? id;
  final String title;
  final String subTitle;

  ItemModel({
    this.id,
    required this.title,
    required this.subTitle,
  });
  factory ItemModel.fromMap(Map<String, dynamic> json) => ItemModel(
      id: json['id'], title: json['title'], subTitle: json['subtitle']);
  Map<String, dynamic> toMap() => {'title': title, 'subtitle': subTitle};
}
