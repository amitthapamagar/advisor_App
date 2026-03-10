class Advisor {
  final String name;
  final String email;
  final String phone;
  final String university;
  final String description;
  final String image;

  Advisor({
    required this.name,
    required this.email,
    required this.phone,
    required this.university,
    required this.description,
    required this.image,
  });

  factory Advisor.fromJson(Map<String, dynamic> json) {
    return Advisor(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      university: json['university'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'university': university,
      'description': description,
      'image': image,
    };
  }
}