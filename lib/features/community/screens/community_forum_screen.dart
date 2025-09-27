import 'package:flutter/material.dart';
import 'package:krishi_rath/features/community/widgets/forum_post.dart';
import 'package:krishi_rath/services/localization_service.dart';

class CommunityForumScreen extends StatelessWidget {
  const CommunityForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = localizationService.translate;

    return Scaffold(
      appBar: AppBar(
        title: Text(tr('community_title')),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildFilterChips(tr),
          const SizedBox(height: 16),
          _buildShareExperienceCard(context, tr),
          const SizedBox(height: 16),
          // Example Forum Posts
          const ForumPost(
            userName: 'Ramesh Kumar',
            userLocation: 'Pune, Maharashtra',
            postTime: '2 hours ago',
            tagKey: 'community_tag_crops',
            voiceNoteDuration: '45s',
            postText:
            'My wheat crop is showing yellow leaves. What should I do?',
            likes: 12,
            comments: 8,
            avatarColor: Colors.green,
          ),
          const ForumPost(
            userName: 'Sunita Devi',
            userLocation: 'Nashik, Maharashtra',
            postTime: '4 hours ago',
            tagKey: 'community_tag_tips',
            voiceNoteDuration: '1m 20s',
            postText:
            'I use neem oil mixed with soap water for pest control. Very effective and organic!',
            likes: 28,
            comments: 15,
            avatarColor: Colors.orange,
          ),
          const ForumPost(
            userName: 'Mohan Singh',
            userLocation: 'Akola, Maharashtra',
            postTime: '6 hours ago',
            tagKey: 'community_tag_govt',
            voiceNoteDuration: '2m 10s',
            postText:
            'PM-KISAN installment received today. ₹2000 credited to account. Check your status!',
            likes: 45,
            comments: 22,
            avatarColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips(String Function(String) tr) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildFilterChip(tr('updates_tab_all'), isSelected: true),
          _buildFilterChip('🌾'),
          _buildFilterChip('📞'),
          _buildFilterChip('💡'),
          _buildFilterChip('🏛️'),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(label),
        backgroundColor: isSelected ? Colors.green[100] : Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isSelected ? Colors.green : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildShareExperienceCard(
      BuildContext context, String Function(String) tr) {
    return Card(
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(Icons.mic, color: Theme.of(context).primaryColor, size: 40),
            const SizedBox(height: 8),
            Text(
              tr('community_share_experience'),
              textAlign: TextAlign.center,
              style:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              tr('community_share_experience_subtitle'),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
              ),
              child: Text(tr('community_record_button')),
            ),
          ],
        ),
      ),
    );
  }
}

