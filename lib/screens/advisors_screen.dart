import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/advisor_provider.dart';
import '../widgets/advisor_card.dart';
import 'advisor_detail_screen.dart';

class AdvisorsScreen extends StatelessWidget {
  final String university;

  const AdvisorsScreen({super.key, required this.university});

  @override
  Widget build(BuildContext context) {
    return Consumer<AdvisorProvider>(
      builder: (context, provider, child) {
        final advisors = provider.getAdvisorsByUniversity(university);

        return Scaffold(
          backgroundColor: const Color(0xFFF5F7FA),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context, advisors.length),
                Expanded(
                  child: advisors.isEmpty
                      ? const Center(child: Text('No advisors found.'))
                      : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                    itemCount: advisors.length,
                    itemBuilder: (context, index) {
                      final advisor = advisors[index];
                      return AdvisorCard(
                        advisor: advisor,
                        showUniversity: false,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  AdvisorDetailScreen(advisor: advisor),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, int count) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_rounded),
                color: const Color(0xFF1A1A2E),
              ),
              Expanded(
                child: Text(
                  university,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A2E),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 0, 16),
            child: Text(
              '$count Academic Advisor${count == 1 ? '' : 's'}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}