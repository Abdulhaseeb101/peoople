class Category {
  final String label;
  final String value;

  Category({
    this.label,
    this.value,

  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      label: json['label'] as String,
      value: json['value'] as String,
    );
  }
}