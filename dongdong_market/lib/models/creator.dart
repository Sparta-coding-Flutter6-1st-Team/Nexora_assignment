class Creator {
  final int id;
  final String name;
  final String profileImage;
  final String address;

  Creator({
    required this.id,
    required this.name,
    required this.profileImage,
    required this.address,
  });

  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
      id: json['id'],
      name: json['name'],
      profileImage: json['profile_image'],
      address: json['address'],
    );
  }
}
