import 'package:flutter/material.dart';
import 'package:krishi_rath/services/localization_service.dart';

class ForumPost extends StatelessWidget {
  final String userName;
  final String userLocation;
  final String postTime;
  final String tagKey;
  final String voiceNoteDuration;
  final String postText;
  final int likes;
  final int comments;
  final Color avatarColor;

  const ForumPost({
    super.key,
    required this.userName,
    required this.userLocation,
    required this.postTime,
    required this.tagKey,
    required this.voiceNoteDuration,
    required this.postText,
    required this.likes,
    required this.comments,
    required this.avatarColor,
  });

  @override
  Widget build(BuildContext context) {
    final tr = localizationService.translate;
    final initials = userName.split(' ').map((e) => e[0]).take(2).join();

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(initials, tr),
            const SizedBox(height: 16),
            _buildVoicePlayer(context),
            const SizedBox(height: 8),
            Text(postText),
            const SizedBox(height: 16),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String initials, String Function(String) tr) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: avatarColor,
          child: Text(initials,
              style: const TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text('$userLocation • $postTime',
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
        Chip(
          label: Text(tr(tagKey)),
          backgroundColor: Colors.grey[200],
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }

  Widget _buildVoicePlayer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(Icons.play_arrow, color: Theme.of(context).primaryColor),
          const Expanded(
            child:
            LinearProgressIndicator(value: 0.3), // Placeholder for progress
          ),
          const SizedBox(width: 8),
          Text(voiceNoteDuration),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      children: [
        _buildStat(Icons.thumb_up_outlined, likes.toString()),
        const SizedBox(width: 24),
        _buildStat(Icons.comment_outlined, comments.toString()),
      ],
    );
  }

  Widget _buildStat(IconData icon, String count) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 4),
        Text(count),
      ],
    );
  }
}

