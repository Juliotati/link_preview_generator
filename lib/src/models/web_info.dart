import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_info.freezed.dart';
part 'web_info.g.dart';

/// Represents the link preview style used for rendering the widget.
enum LinkPreviewStyle { large, small }

/// Represents the link preview type/rule used for scrapping the link.
enum LinkPreviewType {
  def,
  audio,
  image,
  video,
  amazon,
  instagram,
  twitter,
  youtube,
  error;

  const LinkPreviewType();

  bool get isError => this == LinkPreviewType.error;
}

/// Represents the Web Information object.
@Freezed()
class WebInfo with _$WebInfo {
  factory WebInfo({
    /// Description of the page.
    required String description,

    /// Domain name of the link.
    required String domain,

    /// Favicon of the page.
    required String icon,

    /// Image URL, if present any in the link.
    required String image,

    /// Title of the page.
    required String title,

    /// Link preview type of the rule used for scrapping the link.
    /// Returns [LinkPreviewType.error] if the scrapping is failed.
    required LinkPreviewType type,

    /// Video URL, if present any in the link.
    required String video,
  }) = _WebInfo;

  factory WebInfo.fromJson(Map<String, dynamic> json) =>
      _$WebInfoFromJson(json);
}
