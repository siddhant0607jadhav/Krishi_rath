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
    LanguageOption('Assamese', 'অসমীয়া', 'as-IN', 'as'),
    LanguageOption('Bengali', 'বাংলা', 'bn-IN', 'bn'),
    LanguageOption('Bodo', 'बड़ो', 'brx-IN', 'brx'),
    LanguageOption('Dogri', 'डोगरी', 'doi-IN', 'doi'),
    LanguageOption('English', 'English', 'en-US', 'en'),
    LanguageOption('Gujarati', 'ગુજરાતી', 'gu-IN', 'gu'),
    LanguageOption('Hindi', 'हिन्दी', 'hi-IN', 'hi'),
    LanguageOption('Kannada', 'ಕನ್ನಡ', 'kn-IN', 'kn'),
    LanguageOption('Kashmiri', 'कॉशुर', 'ks-IN', 'ks'),
    LanguageOption('Konkani', 'कोंकणी', 'kok-IN', 'kok'),
    LanguageOption('Maithili', 'मैथिली', 'mai-IN', 'mai'),
    LanguageOption('Malayalam', 'മലയാളം', 'ml-IN', 'ml'),
    LanguageOption('Manipuri', 'মৈতৈলোন্', 'mni-IN', 'mni'),
    LanguageOption('Marathi', 'मराठी', 'mr-IN', 'mr'),
    LanguageOption('Nepali', 'नेपाली', 'ne-IN', 'ne'),
    LanguageOption('Oriya', 'ଓଡ଼ିଆ', 'or-IN', 'or'),
    LanguageOption('Punjabi', 'ਪੰਜਾਬੀ', 'pa-IN', 'pa'),
    LanguageOption('Sanskrit', 'संस्कृतम्', 'sa-IN', 'sa'),
    LanguageOption('Santali', 'ᱥᱟᱱᱛᱟᱲᱤ', 'sat-IN', 'sat'),
    LanguageOption('Sindhi', 'सिन्धी', 'sd-IN', 'sd'),
    LanguageOption('Tamil', 'தமிழ்', 'ta-IN', 'ta'),
    LanguageOption('Telugu', 'తెలుగు', 'te-IN', 'te'),
    LanguageOption('Urdu', 'اُردُو', 'ur-IN', 'ur'),
  ];

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();

    // Set up TTS completion handler
    flutterTts.setCompletionHandler(() {
      if (mounted) {
        setState(() {
          _currentlySpeaking = null;
        });
        _navigateToDashboard();
      }
    });

    // Set speech rate for better pronunciation
    flutterTts.setSpeechRate(0.4);
    flutterTts.setPitch(1.0);
  }

  // Function to speak the selected language name AND set the app's language
  Future<void> _speak(LanguageOption language) async {
    // Stop any currently playing speech
    await flutterTts.stop();

    // Set the app's language
    localizationService.setLocale(Locale(language.localeCode));

    setState(() {
      _currentlySpeaking = language.languageCode;
    });

    try {
      await flutterTts.setLanguage(language.languageCode);
      await flutterTts.speak(language.nativeName);
    } catch (e) {
      // Fallback to English if language is not supported by TTS
      print('TTS error for ${language.englishName}: $e');
      await flutterTts.setLanguage('en-US');
      await flutterTts.speak(language.englishName);
    }
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
          padding: const EdgeInsets.all(16.0), // Reduced padding for more space
          child: Column(
            children: [
              const SizedBox(height: 10),
              _buildHeader(),
              const SizedBox(height: 15),
              _buildInfoBox(),
              const SizedBox(height: 15),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2.0, // Slightly smaller aspect ratio
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
          radius: 35, // Slightly smaller
          backgroundColor: Colors.green,
          child: Icon(Icons.agriculture, color: Colors.white, size: 35),
        ),
        SizedBox(height: 12),
        Text(
          'Krishi Rath',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6),
        Text(
          'Choose your language / अपनी भाषा चुनें',
          style: TextStyle(fontSize: 14, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildInfoBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.volume_up, color: Colors.blue, size: 18),
          SizedBox(width: 6),
          Flexible(
            child: Text(
              'Tap any language to hear it spoken',
              style: TextStyle(fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ),
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
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: isSpeaking ? Colors.green : Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () => _speak(lang),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                lang.nativeName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                lang.englishName,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}