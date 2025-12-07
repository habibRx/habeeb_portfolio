import 'package:flutter/material.dart';
import 'dart:html' as html;

class DownloadResumeButton extends StatefulWidget {
  const DownloadResumeButton({super.key});

  @override
  State<DownloadResumeButton> createState() => _DownloadResumeButtonState();
}

class _DownloadResumeButtonState extends State<DownloadResumeButton> {
  bool _isDownloading = false;

  static const String _driveFileId = '1DJhlEMOXs8zqHdIhZpipPMQrQF4StWKm';

  String get _directDownloadUrl =>
      'https://drive.google.com/uc?export=download&id=$_driveFileId';

  Future<void> _downloadResume() async {
    if (_isDownloading) return;

    setState(() {
      _isDownloading = true;
    });

    try {
      final anchor = html.AnchorElement(href: _directDownloadUrl);
      anchor.download = 'Habeeb_Resume.pdf';
      anchor.click();
      // Wait a bit before resetting state
      await Future.delayed(const Duration(seconds: 2));

    } finally {
      if (mounted) {
        setState(() {
          _isDownloading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isDownloading ? null : _downloadResume,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        backgroundColor: Colors.orange, // Customize to match your theme
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: _isDownloading
          ? const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          ),
          SizedBox(width: 12),
          Text('Downloading...'),
        ],
      )
          : const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.download, size: 20),
          SizedBox(width: 8),
          Text('Download Resume'),
        ],
      ),
    );
  }
}