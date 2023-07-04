// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebInfo _$WebInfoFromJson(Map<String, dynamic> json) {
  return _WebInfo.fromJson(json);
}

/// @nodoc
mixin _$WebInfo {
  /// Description of the page.
  String get description => throw _privateConstructorUsedError;

  /// Domain name of the link.
  String get domain => throw _privateConstructorUsedError;

  /// Favicon of the page.
  String get icon => throw _privateConstructorUsedError;

  /// Image URL, if present any in the link.
  String get image => throw _privateConstructorUsedError;

  /// Title of the page.
  String get title => throw _privateConstructorUsedError;

  /// Link preview type of the rule used for scrapping the link.
  /// Returns [LinkPreviewType.error] if the scrapping is failed.
  LinkPreviewType get type => throw _privateConstructorUsedError;

  /// Video URL, if present any in the link.
  String get video => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebInfoCopyWith<WebInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebInfoCopyWith<$Res> {
  factory $WebInfoCopyWith(WebInfo value, $Res Function(WebInfo) then) =
      _$WebInfoCopyWithImpl<$Res, WebInfo>;
  @useResult
  $Res call(
      {String description,
      String domain,
      String icon,
      String image,
      String title,
      LinkPreviewType type,
      String video});
}

/// @nodoc
class _$WebInfoCopyWithImpl<$Res, $Val extends WebInfo>
    implements $WebInfoCopyWith<$Res> {
  _$WebInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? domain = null,
    Object? icon = null,
    Object? image = null,
    Object? title = null,
    Object? type = null,
    Object? video = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LinkPreviewType,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WebInfoCopyWith<$Res> implements $WebInfoCopyWith<$Res> {
  factory _$$_WebInfoCopyWith(
          _$_WebInfo value, $Res Function(_$_WebInfo) then) =
      __$$_WebInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      String domain,
      String icon,
      String image,
      String title,
      LinkPreviewType type,
      String video});
}

/// @nodoc
class __$$_WebInfoCopyWithImpl<$Res>
    extends _$WebInfoCopyWithImpl<$Res, _$_WebInfo>
    implements _$$_WebInfoCopyWith<$Res> {
  __$$_WebInfoCopyWithImpl(_$_WebInfo _value, $Res Function(_$_WebInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? domain = null,
    Object? icon = null,
    Object? image = null,
    Object? title = null,
    Object? type = null,
    Object? video = null,
  }) {
    return _then(_$_WebInfo(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LinkPreviewType,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebInfo implements _WebInfo {
  _$_WebInfo(
      {required this.description,
      required this.domain,
      required this.icon,
      required this.image,
      required this.title,
      required this.type,
      required this.video});

  factory _$_WebInfo.fromJson(Map<String, dynamic> json) =>
      _$$_WebInfoFromJson(json);

  /// Description of the page.
  @override
  final String description;

  /// Domain name of the link.
  @override
  final String domain;

  /// Favicon of the page.
  @override
  final String icon;

  /// Image URL, if present any in the link.
  @override
  final String image;

  /// Title of the page.
  @override
  final String title;

  /// Link preview type of the rule used for scrapping the link.
  /// Returns [LinkPreviewType.error] if the scrapping is failed.
  @override
  final LinkPreviewType type;

  /// Video URL, if present any in the link.
  @override
  final String video;

  @override
  String toString() {
    return 'WebInfo(description: $description, domain: $domain, icon: $icon, image: $image, title: $title, type: $type, video: $video)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebInfo &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.video, video) || other.video == video));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, description, domain, icon, image, title, type, video);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebInfoCopyWith<_$_WebInfo> get copyWith =>
      __$$_WebInfoCopyWithImpl<_$_WebInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebInfoToJson(
      this,
    );
  }
}

abstract class _WebInfo implements WebInfo {
  factory _WebInfo(
      {required final String description,
      required final String domain,
      required final String icon,
      required final String image,
      required final String title,
      required final LinkPreviewType type,
      required final String video}) = _$_WebInfo;

  factory _WebInfo.fromJson(Map<String, dynamic> json) = _$_WebInfo.fromJson;

  @override

  /// Description of the page.
  String get description;
  @override

  /// Domain name of the link.
  String get domain;
  @override

  /// Favicon of the page.
  String get icon;
  @override

  /// Image URL, if present any in the link.
  String get image;
  @override

  /// Title of the page.
  String get title;
  @override

  /// Link preview type of the rule used for scrapping the link.
  /// Returns [LinkPreviewType.error] if the scrapping is failed.
  LinkPreviewType get type;
  @override

  /// Video URL, if present any in the link.
  String get video;
  @override
  @JsonKey(ignore: true)
  _$$_WebInfoCopyWith<_$_WebInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
