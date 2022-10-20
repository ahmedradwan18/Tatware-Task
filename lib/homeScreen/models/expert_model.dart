class ExpertModel {
  final int id;
  final String firstName;
  final String lastName;
  final String avatar;
   bool isFavorite;

  ExpertModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.isFavorite,
  });

  factory ExpertModel.fromJson(Map<String, dynamic> json) {
    return ExpertModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'] ??
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz5ppoPb1psqBv_AOEWpURnnyxQmGMLFAPBxDT2Cw&s',
      isFavorite: false,
    );
  }
}
