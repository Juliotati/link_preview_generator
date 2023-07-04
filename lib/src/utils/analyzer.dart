import 'dart:convert';

import 'package:link_preview_generator/src/models/web_info.dart';
import 'package:link_preview_generator/src/utils/scrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Link Preview Analyzer
class LinkPreviewAnalyzer {
  /// Get web information
  static Future<WebInfo?> getInfo(
    String url, {
    Duration cacheDuration = const Duration(hours: 24),
    bool multimedia = true,
  }) async {
    var cachedInfo = await getInfoFromCache(url);

    if (cachedInfo != null) return cachedInfo;

    try {
      final info = await LinkPreview.scrapeFromURL(url);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_cacheKey(url), jsonEncode(info.toJson()));
      await prefs.setString(
        _cacheKey(url, isDuration: true),
        DateTime.now().add(cacheDuration).toIso8601String(),
      );

      return info;
    } catch (e) {
      print('Get web error: $url, Error: $e');
      return null;
    }
  }

  /// Get web information
  /// return [InfoBase]
  static Future<WebInfo?> getInfoFromCache(String? url) async {
    final prefs = await SharedPreferences.getInstance();

    final info = prefs.getString(_cacheKey(url));
    final durationString = prefs.getString(_cacheKey(url, isDuration: true));

    if (durationString == null) return null;

    final duration = DateTime.parse(durationString);

    if (info != null && !duration.isAfter(DateTime.now())) {
      await prefs.remove(_cacheKey(url, isDuration: true));
      return null;
    }

    if (info == null) return null;

    return WebInfo.fromJson(jsonDecode(info));
  }

  static String _cacheKey(String? value, {bool isDuration = false}) {
    if (isDuration) {
      return '$value-duration';
    }
    return value ?? '';
  }

  /// Is it an empty string
  static bool isNotEmpty(String? str) =>
      str != null && str.isNotEmpty && str.trim().isNotEmpty;
}
