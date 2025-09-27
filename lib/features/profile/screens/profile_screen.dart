import 'package:flutter/material.dart';
import 'package:krishi_rath/services/localization_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = localizationService.translate;

    return Scaffold(
      appBar: AppBar(
        title: Text(tr('profile_title')),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Chip(
              backgroundColor: Colors.white.withOpacity(0.3),
              label: const Text('Online', style: TextStyle(color: Colors.white)),
              avatar: const Icon(Icons.wifi, color: Colors.white, size: 16),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          _buildHeader(context),
          _buildSection(
            context,
            title: tr('profile_farm_info'),
            child: _buildFarmInfoGrid(),
          ),
          _buildSection(
            context,
            title: tr('profile_offline_capability'),
            child: _buildOfflineInfo(),
          ),
          _buildSettingsList(context),
          _buildSection(
            context,
            title: tr('profile_contact_info'),
            child: _buildContactInfo(),
          ),
          _buildSection(
            context,
            title: tr('profile_emergency_contacts'),
            child: _buildEmergencyContacts(),
          ),
          _buildSignOutButton(context),
          const SizedBox(height: 20), // Add some padding at the bottom
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white.withOpacity(0.8),
            child: const Text('RK',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Raj Kumar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white70, size: 16),
                    SizedBox(width: 4),
                    Text('Nashik, Maharashtra',
                        style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context,
      {required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildFarmInfoGrid() {
    final tr = localizationService.translate;
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 2.5,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: [
        _buildInfoItem(tr('profile_farm_size'), '5.2 acres'),
        _buildInfoItem(tr('profile_experience'), '15 years'),
        _buildInfoItem(tr('profile_primary_language'), 'Hindi'),
        _buildInfoItem(tr('profile_member_since'), 'January 2024'),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildOfflineInfo() {
    final tr = localizationService.translate;
    return Column(
      children: [
        Text(tr('profile_offline_desc')),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.green),
            const SizedBox(width: 8),
            Expanded(child: Text(tr('profile_offline_cta'))),
          ],
        ),
      ],
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    final tr = localizationService.translate;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          _buildSettingsItem(
            context,
            icon: Icons.settings,
            titleKey: 'profile_settings',
            subtitleKey: 'profile_settings_desc',
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          _buildSettingsItem(
            context,
            icon: Icons.download_for_offline,
            titleKey: 'profile_offline_data',
            subtitleKey: 'profile_offline_data_desc',
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          _buildSettingsItem(
            context,
            icon: Icons.help_outline,
            titleKey: 'profile_help_support',
            subtitleKey: 'profile_help_support_desc',
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context,
      {required IconData icon,
        required String titleKey,
        required String subtitleKey}) {
    final tr = localizationService.translate;
    return ListTile(
      leading: Icon(icon, color: Colors.grey[600]),
      title: Text(tr(titleKey)),
      subtitle: Text(tr(subtitleKey)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }

  Widget _buildContactInfo() {
    final tr = localizationService.translate;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoItem(tr('profile_primary_contact'), '+91 98765 43210'),
        const SizedBox(height: 8),
        _buildInfoItem('Nashik, Maharashtra', ''),
      ],
    );
  }

  Widget _buildEmergencyContacts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoItem('Agriculture Officer', '+91 98765 12345'),
        const SizedBox(height: 8),
        _buildInfoItem('Veterinary Doctor', '+91 98765 67890'),
        const SizedBox(height: 8),
        _buildInfoItem('Helpline', '1800-180-1551'),
      ],
    );
  }

  Widget _buildSignOutButton(BuildContext context) {
    final tr = localizationService.translate;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Center(
        child: TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.exit_to_app, color: Colors.red),
          label: Text(
            tr('profile_sign_out'),
            style: const TextStyle(color: Colors.red),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(12),
          ),
        ),
      ),
    );
  }
}

