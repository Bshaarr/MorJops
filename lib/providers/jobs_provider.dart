import 'package:flutter/material.dart';
import 'package:morjops/models/job_model.dart';

class JobsProvider extends ChangeNotifier {
  final List<Job> _allJobs = [
    Job(
      id: '1',
      title: 'أخصائي برامج — التعليم والتنمية',
      organization: 'برنامج الأمم المتحدة الإنمائي UNDP — سوريا',
      logo: '🌍',
      description:
          'نبحث عن متخصص في برامج التنمية للانضمام إلى فريقنا في دمشق. المرشح المثالي يمتلك خبرة لا تقل عن 3 سنوات في مجالات التنمية المستدامة والبرامج الاجتماعية.',
      type: 'un',
      location: 'دمشق',
      employment: 'fulltime',
      qualification: 'bachelor',
      salary: 'راتب تنافسي',
      deadline: '30 مايو',
      views: 1240,
      tags: ['🏢 منظمة أممية', '📍 دمشق', '⏰ دوام كامل', '📅 ينتهي 30 مايو'],
      featured: true,
      posted: 'منذ يومين',
      meta: ['💰 راتب تنافسي', '👁️ 1,240 مشاهدة', '📋 بكالوريوس+'],
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      applicants: 45,
    ),
    Job(
      id: '2',
      title: 'مهندس مدني — مشاريع البنية التحتية',
      organization: 'وزارة التنمية الاجتماعية والعمل — سوريا',
      logo: '🏛️',
      description:
          'تحتاج الوزارة إلى مهندس مدني متخصص في مشاريع البنية التحتية. يجب أن يمتلك خبرة لا تقل عن 3 سنوات في إدارة المشاريع والتصميم الهندسي.',
      type: 'government',
      location: 'حلب',
      employment: 'fulltime',
      qualification: 'bachelor',
      salary: '\$1000-1400',
      deadline: '15 يونيو',
      views: 876,
      tags: ['🏛️ حكومي', '📍 حلب', '⏰ دوام كامل', '📅 ينتهي 15 يونيو'],
      featured: false,
      posted: 'منذ 3 أيام',
      meta: ['📋 بكالوريوس هندسة', '👁️ 876 مشاهدة', '🗓️ خبرة 3 سنوات'],
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      applicants: 28,
    ),
    Job(
      id: '3',
      title: 'منسق لوجستي ميداني',
      organization: 'برنامج الغذاء العالمي WFP — سوريا',
      logo: '🌾',
      description:
          'يبحث البرنامج عن منسق لوجستي ميداني للعمل في منطقة حمص. المرشح المثالي يمتلك خبرة في إدارة الإمدادات والعمليات اللوجستية.',
      type: 'un',
      location: 'حمص',
      employment: 'contract',
      qualification: 'diploma',
      salary: '\$800–1200',
      deadline: '10 يونيو',
      views: 2103,
      tags: ['🏢 أممي', '📍 حمص', '📄 عقد مؤقت', '📅 ينتهي 10 يونيو'],
      featured: false,
      posted: 'منذ يوم',
      meta: ['💰 \$800–1200/شهر', '👁️ 2,103 مشاهدة', '📋 دبلوم+'],
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      applicants: 67,
    ),
    Job(
      id: '4',
      title: 'ممرض/ممرضة — الصحة النفسية والدعم النفسي',
      organization: 'اللجنة الدولية للصليب الأحمر ICRC',
      logo: '❤️',
      description:
          'تبحث اللجنة الدولية للصليب الأحمر عن ممرض/ممرضة متخصص في الصحة النفسية والدعم النفسي الاجتماعي. الخبرة في العمل الإنساني مهمة.',
      type: 'international',
      location: 'إدلب',
      employment: 'fulltime',
      qualification: 'bachelor',
      salary: 'راتب تنافسي',
      deadline: '5 يونيو',
      views: 1567,
      tags: ['🏢 إنساني', '📍 إدلب', '⏰ دوام كامل', '📅 ينتهي 5 يونيو'],
      featured: false,
      posted: 'ينتهي قريباً',
      meta: ['📋 تمريض/نفسية', '👁️ 1,567 مشاهدة', '🗓️ خبرة 2 سنة'],
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      applicants: 34,
    ),
    Job(
      id: '5',
      title: 'مسؤول تعليم — مناهج التعلم عن بُعد',
      organization: 'منظمة اليونيسف UNICEF — سوريا',
      logo: '🏫',
      description:
          'تبحث اليونيسف عن متخصص في التعليم لتطوير مناهج التعلم عن بُعد. يجب أن يمتلك ماجستير في التعليم وخبرة في التكنولوجيا التعليمية.',
      type: 'un',
      location: 'دمشق',
      employment: 'fulltime',
      qualification: 'master',
      salary: '\$1500+',
      deadline: '20 يونيو',
      views: 3240,
      tags: ['🏢 أممي', '📍 دمشق / عن بُعد', '💻 هجين', '📅 ينتهي 20 يونيو'],
      featured: false,
      posted: 'منذ 5 أيام',
      meta: ['💰 \$1500+/شهر', '👁️ 3,240 مشاهدة', '📋 ماجستير تعليم'],
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      applicants: 52,
    ),
    Job(
      id: '6',
      title: 'طبيب طوارئ ميداني',
      organization: 'منظمة الصحة العالمية WHO — سوريا',
      logo: '🏥',
      description:
          'تبحث منظمة الصحة العالمية عن طبيب متخصص في الطوارئ للعمل الميداني. الخبرة في العمل في بيئات الطوارئ والأزمات ضرورية.',
      type: 'un',
      location: 'اللاذقية',
      employment: 'fulltime',
      qualification: 'master',
      salary: '\$2000+',
      deadline: '25 يونيو',
      views: 987,
      tags: ['🏢 أممي', '📍 اللاذقية', '⏰ دوام كامل', '📅 ينتهي 25 يونيو'],
      featured: false,
      posted: 'اليوم',
      meta: ['📋 شهادة طب', '👁️ 987 مشاهدة', '🗓️ خبرة 5 سنوات'],
      createdAt: DateTime.now(),
      applicants: 19,
    ),
  ];

  List<Job> _filteredJobs = [];
  List<Job> _savedJobs = [];
  bool _isLoading = false;

  List<Job> get allJobs => _allJobs;
  List<Job> get filteredJobs => _filteredJobs.isEmpty ? _allJobs : _filteredJobs;
  List<Job> get savedJobs => _savedJobs;
  bool get isLoading => _isLoading;

  JobsProvider() {
    _filteredJobs = [..._allJobs];
  }

  void searchJobs(String query) {
    if (query.isEmpty) {
      _filteredJobs = [..._allJobs];
    } else {
      final lowerQuery = query.toLowerCase();
      _filteredJobs = _allJobs
          .where((job) =>
              job.title.toLowerCase().contains(lowerQuery) ||
              job.organization.toLowerCase().contains(lowerQuery) ||
              job.description.toLowerCase().contains(lowerQuery) ||
              job.location.toLowerCase().contains(lowerQuery))
          .toList();
    }
    notifyListeners();
  }

  void filterByType(String type) {
    if (type == 'all') {
      _filteredJobs = [..._allJobs];
    } else {
      _filteredJobs = _allJobs.where((job) => job.type == type).toList();
    }
    notifyListeners();
  }

  void filterByLocation(String location) {
    if (location == 'جميع المحافظات') {
      _filteredJobs = [..._allJobs];
    } else {
      _filteredJobs = _allJobs.where((job) => job.location == location).toList();
    }
    notifyListeners();
  }

  void filterByEmploymentType(String employment) {
    if (employment == 'all') {
      _filteredJobs = [..._allJobs];
    } else {
      _filteredJobs = _allJobs.where((job) => job.employment == employment).toList();
    }
    notifyListeners();
  }

  void sortJobs(String sortBy) {
    if (sortBy == 'newest') {
      _filteredJobs.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    } else if (sortBy == 'salary') {
      _filteredJobs.sort((a, b) {
        final salaryA = int.tryParse(a.salary.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;
        final salaryB = int.tryParse(b.salary.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;
        return salaryB.compareTo(salaryA);
      });
    } else if (sortBy == 'views') {
      _filteredJobs.sort((a, b) => b.views.compareTo(a.views));
    } else if (sortBy == 'applicants') {
      _filteredJobs.sort((a, b) => b.applicants.compareTo(a.applicants));
    }
    notifyListeners();
  }

  void toggleSaveJob(Job job) {
    final index = _savedJobs.indexWhere((j) => j.id == job.id);
    if (index != -1) {
      _savedJobs.removeAt(index);
    } else {
      _savedJobs.add(job);
    }
    notifyListeners();
  }

  bool isJobSaved(String jobId) {
    return _savedJobs.any((job) => job.id == jobId);
  }

  Job? getJobById(String id) {
    try {
      return _allJobs.firstWhere((job) => job.id == id);
    } catch (e) {
      return null;
    }
  }

  void resetFilters() {
    _filteredJobs = [..._allJobs];
    notifyListeners();
  }
}
