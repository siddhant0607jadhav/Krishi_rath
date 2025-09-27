import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:krishi_rath/features/dashboard/screens/dashboard_screen.dart';
import 'package:krishi_rath/services/localization_service.dart'; // Import the service

// A simple data class to hold language information
class LanguageOption {
  final String englishName;
  final String nativeName;
  final String languageCode; // e.g., "hi-IN"
  final String localeCode; // e.g., "hi"

  LanguageOption(this.englishName, this.nativeName, this.languageCode, this.localeCode);
}

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  late FlutterTts flutterTts;
  String? _currentlySpeaking;

  final List<LanguageOption> languages = [
    LanguageOption('Hindi', 'हिन्दी', 'hi-IN', 'hi'),
    LanguageOption('English', 'English', 'en-US', 'en'),
    LanguageOption('Marathi', 'मराठी', 'mr-IN', 'mr'),
    // Add other languages here if needed
  ];

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    flutterTts.setCompletionHandler(() {
      if (mounted) {
        setState(() {
          _currentlySpeaking = null;
        });
        _navigateToDashboard();
      }
    });
  }

  // Function to speak the selected language name AND set the app's language
  Future<void> _speak(LanguageOption language) async {
    // --- THIS IS THE FIX ---
    // This line tells the entire app to change its language.
    localizationService.setLocale(Locale(language.localeCode));
    // -----------------------

    setState(() {
      _currentlySpeaking = language.languageCode;
    });
    await flutterTts.setLanguage(language.languageCode);
    await flutterTts.speak(language.nativeName);
  }

  void _navigateToDashboard() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 20),
              _buildInfoBox(),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 2.2,
                  ),
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    return _buildLanguageButton(languages[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.green,
          child: Icon(Icons.agriculture, color: Colors.white, size: 40),
        ),
        SizedBox(height: 16),
        Text(
          'Krishi Rath',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Choose your language / अपनी भाषा चुनें',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildInfoBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.volume_up, color: Colors.blue),
          SizedBox(width: 8),
          Text('Tap any language button to hear it spoken'),
        ],
      ),
    );
  }

  Widget _buildLanguageButton(LanguageOption lang) {
    final bool isSpeaking = _currentlySpeaking == lang.languageCode;
    return Card(
      elevation: 2,
      color: isSpeaking ? Colors.green[100] : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSpeaking ? Colors.green : Colors.transparent,
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: () => _speak(lang),
        borderRadius: BorderRadius.circular(12),
        child: Center(
          child: Text(
            lang.nativeName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

