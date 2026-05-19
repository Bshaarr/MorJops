class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? profileImage;
  final List<String> savedJobs;
  final List<String> appliedJobs;
  final String qualification;
  final List<String> skills;
  final String bio;
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.profileImage,
    this.savedJobs = const [],
    this.appliedJobs = const [],
    this.qualification = '',
    this.skills = const [],
    this.bio = '',
    required this.createdAt,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? profileImage,
    List<String>? savedJobs,
    List<String>? appliedJobs,
    String? qualification,
    List<String>? skills,
    String? bio,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profileImage: profileImage ?? this.profileImage,
      savedJobs: savedJobs ?? this.savedJobs,
      appliedJobs: appliedJobs ?? this.appliedJobs,
      qualification: qualification ?? this.qualification,
      skills: skills ?? this.skills,
      bio: bio ?? this.bio,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
