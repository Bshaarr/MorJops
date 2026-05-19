class Job {
  final String id;
  final String title;
  final String organization;
  final String logo;
  final String description;
  final String type; // government, un, international, local
  final String location;
  final String employment; // fulltime, parttime, contract, remote
  final String qualification; // diploma, bachelor, master
  final String salary;
  final String deadline;
  final int views;
  final List<String> tags;
  final bool featured;
  final String posted;
  final List<String> meta;
  final DateTime createdAt;
  final int applicants;

  Job({
    required this.id,
    required this.title,
    required this.organization,
    required this.logo,
    required this.description,
    required this.type,
    required this.location,
    required this.employment,
    required this.qualification,
    required this.salary,
    required this.deadline,
    required this.views,
    required this.tags,
    this.featured = false,
    required this.posted,
    required this.meta,
    required this.createdAt,
    this.applicants = 0,
  });

  Job copyWith({
    String? id,
    String? title,
    String? organization,
    String? logo,
    String? description,
    String? type,
    String? location,
    String? employment,
    String? qualification,
    String? salary,
    String? deadline,
    int? views,
    List<String>? tags,
    bool? featured,
    String? posted,
    List<String>? meta,
    DateTime? createdAt,
    int? applicants,
  }) {
    return Job(
      id: id ?? this.id,
      title: title ?? this.title,
      organization: organization ?? this.organization,
      logo: logo ?? this.logo,
      description: description ?? this.description,
      type: type ?? this.type,
      location: location ?? this.location,
      employment: employment ?? this.employment,
      qualification: qualification ?? this.qualification,
      salary: salary ?? this.salary,
      deadline: deadline ?? this.deadline,
      views: views ?? this.views,
      tags: tags ?? this.tags,
      featured: featured ?? this.featured,
      posted: posted ?? this.posted,
      meta: meta ?? this.meta,
      createdAt: createdAt ?? this.createdAt,
      applicants: applicants ?? this.applicants,
    );
  }
}
