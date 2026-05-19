import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:morjops/providers/jobs_provider.dart';
import 'package:morjops/providers/auth_provider.dart';
import 'package:morjops/screens/job_details_screen.dart';
import 'package:morjops/screens/saved_jobs_screen.dart';
import 'package:morjops/screens/profile_screen.dart';
import 'package:morjops/screens/login_screen.dart';
import 'package:morjops/theme/app_theme.dart';
import 'package:morjops/widgets/job_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _searchController = TextEditingController();
  String _selectedFilter = 'all';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تسجيل الخروج'),
        content: const Text('هل أنت متأكد من رغبتك في تسجيل الخروج؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<AuthProvider>().logout();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
            child: const Text(
              'خروج',
              style: TextStyle(color: AppColors.danger),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MorJops'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _handleLogout,
            tooltip: 'تسجيل الخروج',
          ),
        ],
      ),
      body: _currentIndex == 0
          ? _buildJobsTab(context)
          : _currentIndex == 1
              ? const SavedJobsScreen()
              : const ProfileScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            activeIcon: Icon(Icons.work),
            label: 'الوظائف',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            activeIcon: Icon(Icons.bookmark),
            label: 'المحفوظة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'الملف الشخصي',
          ),
        ],
      ),
    );
  }

  Widget _buildJobsTab(BuildContext context) {
    return Consumer<JobsProvider>(
      builder: (context, jobsProvider, _) {
        return Column(
          children: [
            // شريط البحث
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.surface,
              child: Column(
                children: [
                  // حقل البحث
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'ابحث عن وظيفة...',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                                jobsProvider.resetFilters();
                              },
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (value) {
                      jobsProvider.searchJobs(value);
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 12),
                  // أزرار التصفية
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _FilterButton(
                          label: 'الكل',
                          isActive: _selectedFilter == 'all',
                          onPressed: () {
                            setState(() => _selectedFilter = 'all');
                            jobsProvider.filterByType('all');
                          },
                        ),
                        const SizedBox(width: 8),
                        _FilterButton(
                          label: 'حكومي',
                          isActive: _selectedFilter == 'government',
                          onPressed: () {
                            setState(() => _selectedFilter = 'government');
                            jobsProvider.filterByType('government');
                          },
                        ),
                        const SizedBox(width: 8),
                        _FilterButton(
                          label: 'أممي',
                          isActive: _selectedFilter == 'un',
                          onPressed: () {
                            setState(() => _selectedFilter = 'un');
                            jobsProvider.filterByType('un');
                          },
                        ),
                        const SizedBox(width: 8),
                        _FilterButton(
                          label: 'دولي',
                          isActive: _selectedFilter == 'international',
                          onPressed: () {
                            setState(() => _selectedFilter = 'international');
                            jobsProvider.filterByType('international');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // قائمة الوظائف
            Expanded(
              child: jobsProvider.filteredJobs.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64,
                            color: AppColors.border,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'لم يتم العثور على وظائف',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.text3,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'حاول تغيير معايير البحث',
                            style: TextStyle(
                              color: AppColors.text3,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: jobsProvider.filteredJobs.length,
                      itemBuilder: (context, index) {
                        final job = jobsProvider.filteredJobs[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    JobDetailsScreen(job: job),
                              ),
                            );
                          },
                          child: JobCard(job: job),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onPressed;

  const _FilterButton({
    required this.label,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isActive ? AppColors.primary : AppColors.surface2,
        foregroundColor:
            isActive ? Colors.white : AppColors.text2,
        side: BorderSide(
          color: isActive ? AppColors.primary : AppColors.border,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      child: Text(label),
    );
  }
}
