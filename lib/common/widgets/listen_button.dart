import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ListenButton extends StatefulWidget {
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  // New required parameter to know what text to speak
  final String textToSpeak;

  const ListenButton({
    super.key,
    this.iconSize,
    this.padding,
    required this.textToSpeak, // Added to the constructor
  });

  @override
  State<ListenButton> createState() => _ListenButtonState();
}

class _ListenButtonState extends State<ListenButton> {
  late FlutterTts flutterTts;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    // Initialize the text-to-speech engine
    flutterTts = FlutterTts();
    _setupTts();
  }

  void _setupTts() {
    // Set a completion handler to know when speaking is finished
    flutterTts.setCompletionHandler(() {
      if (mounted) {
        setState(() {
          isPlaying = false;
        });
      }
    });

    // Set an error handler
    flutterTts.setErrorHandler((msg) {
      if (mounted) {
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  // Method to handle the speech logic
  Future<void> _speak() async {
    if (widget.textToSpeak.isNotEmpty) {
      setState(() {
        isPlaying = true;
      });
      // You can adjust language, pitch, and rate here if needed
      await flutterTts.setPitch(1.0);
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.speak(widget.textToSpeak);
    }
  }

  // Method to stop speaking
  Future<void> _stop() async {
    await flutterTts.stop();
    if(mounted) {
      setState(() {
        isPlaying = false;
      });
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Toggle between speak and stop
      onTap: isPlaying ? _stop : _speak,
      child: Container(
        padding: widget.padding ?? const EdgeInsets.all(4),
        decoration: BoxDecoration(
          // Change color when speaking
          color: isPlaying ? Colors.green[200] : Colors.grey[200],
          shape: BoxShape.circle,
        ),
        child: Icon(
          // Change icon when speaking
          isPlaying ? Icons.stop_circle_outlined : Icons.volume_up_outlined,
          size: widget.iconSize ?? 18,
          color: isPlaying ? Colors.green[800] : Colors.grey[700],
        ),
      ),
    );
  }
}

