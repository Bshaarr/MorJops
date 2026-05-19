import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:morjops/models/job_model.dart';
import 'package:morjops/providers/jobs_provider.dart';
import 'package:morjops/theme/app_theme.dart';

class JobCard extends StatelessWidget {
  final Job job;

  const JobCard({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<JobsProvider>(
      builder: (context, jobsProvider, _) {
        final isSaved = jobsProvider.isJobSaved(job.id);

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: job.featured ? 3 : 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: job.featured ? AppColors.gold : AppColors.border,
              width: job.featured ? 2 : 1,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: job.featured
                  ? const LinearGradient(
                      colors: [Color(0xFFFFFDF0), Colors.white],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (job.featured)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.gold,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          '⭐ وظيفة مميزة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  // الرأس: الشعار والعنوان
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Color(
                            int.parse('FF' +
                                (job.logo.hashCode.abs() % 0xFFFFFF)
                                    .toString()
                                    .padLeft(6, '0'),
                                radix: 16,
                              ),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            job.logo,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              job.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.text,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              job.organization,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // الوصف
                  Text(
                    job.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.text2,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // الوسوم
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: job.tags.take(3).map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.surface2,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.text2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 12),
                  // المعلومات والأزرار
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // المعلومات
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.remove_red_eye,
                              size: 14,
                              color: AppColors.text3,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${job.views}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.text3,
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Icon(
                              Icons.person_add,
                              size: 14,
                              color: AppColors.text3,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${job.applicants}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.text3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // زر الحفظ
                      IconButton(
                        icon: Icon(
                          isSaved ? Icons.bookmark : Icons.bookmark_outline,
                          color: isSaved ? AppColors.gold : AppColors.text3,
                        ),
                        onPressed: () {
                          jobsProvider.toggleSaveJob(job);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                isSaved
                                    ? 'تم حذفها من المحفوظات'
                                    : 'تم إضافتها للمحفوظات',
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        constraints: const BoxConstraints(),
                        padding: const EdgeInsets.all(8),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
