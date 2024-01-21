import 'dart:convert';

import 'package:link_preview_generator/src/models/web_info.dart';
import 'package:link_preview_generator/src/utils/scrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Link Preview Analyzer
class LinkPreviewAnalyzer {
  /// Get web meta data information from the given [url].
  static Future<WebInfo?> info(
    String url, {
    Duration cacheDuration = const Duration(days: 30),
    bool multimedia = true,
  }) async {
    final cachedInfo = await infoFromCache(url);
    if (cachedInfo != null) return cachedInfo;

    try {
      final info = await LinkPreview.scrapeFromURL(url);
      if (info.type.isError) return null;

      final prefs = await SharedPreferences.getInstance();

      final cacheDurationStr =
          DateTime.now().add(cacheDuration).toIso8601String();
      await prefs.setString(_cacheKey(url), jsonEncode(info.toJson()));
      await prefs.setString(_cacheKey(url, isDuration: true), cacheDurationStr);

      return info;
    } catch (e) {
      print('WebInfo error: $url, Error: $e');
      return null;
    }
  }

  static Future<WebInfo?> infoFromCache(String? url) async {
    final prefs = await SharedPreferences.getInstance();
    final info = prefs.getString(_cacheKey(url));
    if (info == null) return null;

    final nowString =
        DateTime.now().subtract(const Duration(minutes: 1)).toIso8601String();

    final durationString =
        prefs.getString(_cacheKey(url, isDuration: true)) ?? nowString;

    final duration = DateTime.parse(durationString);
    if (DateTime.now().isBefore(duration)) {
      await prefs.remove(_cacheKey(url, isDuration: true));
      return null;
    }

    return WebInfo.fromJson(jsonDecode(info));
  }

  static String _cacheKey(String? value, {bool isDuration = false}) {
    if (isDuration) {
      return '$value-duration';
    }
    return value ?? '';
  }

  static bool isNotEmpty(String? str) =>
      str != null && str.isNotEmpty && str.trim().isNotEmpty;
}
