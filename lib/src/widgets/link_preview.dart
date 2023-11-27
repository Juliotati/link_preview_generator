import 'dart:async';

import 'package:flutter/material.dart';
import 'package:link_preview_generator/src/models/web_info.dart';
import 'package:link_preview_generator/src/utils/analyzer.dart';
import 'package:link_preview_generator/src/widgets/link_view_large.dart';
import 'package:link_preview_generator/src/widgets/link_view_small.dart';
import 'package:url_launcher/url_launcher.dart';

/// A widget to convert your links into beautiful previews.
class LinkPreviewGenerator extends StatefulWidget {
  /// Creates [LinkPreviewGenerator]
  const LinkPreviewGenerator({
    Key? key,
    required this.link,
    this.info,
    this.cacheDuration = const Duration(days: 7),
    this.titleStyle,
    this.bodyStyle,
    this.linkPreviewStyle = LinkPreviewStyle.large,
    this.showBody = true,
    this.showDomain = true,
    this.showGraphic = true,
    this.showTitle = true,
    this.graphicFit = BoxFit.cover,
    this.backgroundColor = const Color.fromRGBO(248, 248, 248, 1.0),
    this.bodyMaxLines,
    this.bodyTextOverflow = TextOverflow.ellipsis,
    this.onTap,
    this.placeholderWidget,
    this.proxyUrl,
    this.errorWidget,
    this.description,
    this.errorBody = 'Oops! Unable to parse the url.',
    this.errorImage =
        'https://raw.githubusercontent.com/ghpranav/link_preview_generator/main/assets/giphy.gif',
    this.errorTitle = 'Something went wrong!',
    this.borderRadius = 12.0,
    this.boxShadow,
    this.removeShadow = false,
    this.onInfoLoaded,
  }) : super(key: key);


  /// Link information from the web.
  final WebInfo? info;

  /// Customize the background colour.
  /// Defaults to `Color.fromRGBO(248, 248, 248, 1.0)`.
  final Color backgroundColor;

  /// Give the limit to body text (Description).
  /// If not provided, it will be calculated automatically.
  final int? bodyMaxLines;

  /// Customize `body` [TextStyle].
  final TextStyle? bodyStyle;

  /// Give the overflow type for body text (Description). Default to
  /// `TextOverflow.ellipsis`.
  final TextOverflow bodyTextOverflow;

  /// BorderRadius for the card. Defaults to `12.0`.
  final double borderRadius;

  /// Box shadow for the card.
  /// Defaults to:
  /// ```
  /// [
  ///  BoxShadow(
  ///   spreadRadius: 1,
  ///   blurRadius: 5,
  ///   color: Colors.grey.withOpacity(0.5),
  ///   offset: Offset(0, 3),
  ///  )
  /// ]
  /// ```
  final List<BoxShadow>? boxShadow;

  /// Cache result time, default cache `7 days`.
  final Duration cacheDuration;

  /// Exposes the description from the url preview.
  /// If null the untempered description will be displayed
  final String Function(String data)? description;

  /// Body that need to be shown if parsing fails.
  /// Defaults to `Oops! Unable to parse the url.`
  final String errorBody;

  /// Image URL that will be shown if parsing fails
  /// & when multimedia enabled & no meta data is available.
  /// Defaults to `A crying semi-soccer ball image`.
  /// https://raw.githubusercontent.com/ghpranav/link_preview_generator/main/assets/giphy.gif
  final String errorImage;

  /// Title that need to be shown if parsing fails.
  /// Defaults to `Something went wrong!`
  final String errorTitle;

  /// Widget that needs to be shown if parsing fails.
  /// Defaults to plain container with given background colour.
  final Widget? errorWidget;

  /// Web address (URL that needs to be parsed/scrapped).
  final String link;

  /// Link Preview display style. One among `large` or `small`.
  /// Defaults to [LinkPreviewStyle.large].
  final LinkPreviewStyle linkPreviewStyle;

  /// Widget that needs to be shown when
  /// package is trying to fetch metadata.
  /// If not given anything then default widget will be shown.
  final Widget? placeholderWidget;

  /// Proxy URL to pass that resolve CORS issues on web.
  /// For example, `https://cors-anywhere.herokuapp.com/` .
  final String? proxyUrl;

  /// To remove the card shadow effect set it to `true`. Defaults to `false`.
  final bool removeShadow;

  /// Show or Hide body text (Description). Defaults to `true`.
  final bool showBody;

  /// Show or Hide domain name. Defaults to `true`.
  final bool showDomain;

  /// Show or Hide image, if available. Defaults to `true`.
  final bool showGraphic;

  /// Show or Hide title. Defaults to `true`.
  final bool showTitle;

  /// Adjust the box fit of the image. Defaults to [BoxFit.cover].
  final BoxFit graphicFit;

  /// Customize `title` [TextStyle].
  final TextStyle? titleStyle;

  /// Function that needs to be called when user taps on the card.
  /// If not given then given URL will be launched.
  /// Pass empty function to disable tap.
  final void Function(WebInfo? data)? onTap;

  /// Called when [WebInfo] is loaded and ready to be used.
  /// Usually used to cache the result else where
  final void Function(WebInfo? data)? onInfoLoaded;

  @override
  _LinkPreviewGeneratorState createState() => _LinkPreviewGeneratorState();
}

class _LinkPreviewGeneratorState extends State<LinkPreviewGenerator> {
  WebInfo? _info;

  bool _loading = false;

  String _url = '';

  Widget _buildLinkContainer(
    double _height, {
    String? domain = '',
    String? title = '',
    String? desc = '',
    String? image = '',
    bool isIcon = false,
  }) {
    return SizedBox(
      height: _height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: widget.removeShadow
              ? null
              : widget.boxShadow ??
                  [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 5,
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(0, 3),
                    )
                  ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          onTap: widget.onTap != null
              ? () => widget.onTap?.call(_info)
              : () => _launchURL(widget.link),
          child: (widget.linkPreviewStyle == LinkPreviewStyle.small)
              ? LinkViewSmall(
                  key: widget.key ?? Key(widget.link),
                  url: widget.link,
                  domain: domain!,
                  title: title!,
                  description: desc!,
                  imageUri: image!,
                  titleTextStyle: widget.titleStyle,
                  bodyTextStyle: widget.bodyStyle,
                  bodyTextOverflow: widget.bodyTextOverflow,
                  bodyMaxLines: widget.bodyMaxLines,
                  showBody: widget.showBody,
                  showDomain: widget.showDomain,
                  showGraphic: widget.showGraphic,
                  showTitle: widget.showTitle,
                  graphicFit: widget.graphicFit,
                  isIcon: isIcon,
                  bgColor: widget.backgroundColor,
                  radius: widget.borderRadius,
                )
              : LinkViewLarge(
                  key: widget.key ?? Key(widget.link.toString()),
                  url: widget.link,
                  domain: domain!,
                  title: title!,
                  description: desc!,
                  imageUri: image!,
                  titleTextStyle: widget.titleStyle,
                  bodyTextStyle: widget.bodyStyle,
                  bodyTextOverflow: widget.bodyTextOverflow,
                  bodyMaxLines: widget.bodyMaxLines,
                  showBody: widget.showBody,
                  showDomain: widget.showDomain,
                  showGraphic: widget.showGraphic,
                  showTitle: widget.showTitle,
                  graphicFit: widget.graphicFit,
                  isIcon: isIcon,
                  bgColor: widget.backgroundColor,
                  radius: widget.borderRadius,
                ),
        ),
      ),
    );
  }

  Widget _buildPlaceHolder(Color color, double defaultHeight) {
    return SizedBox(
      height: defaultHeight,
      child: LayoutBuilder(
        builder: (context, constraints) {
          var layoutWidth = constraints.biggest.width;
          var layoutHeight = constraints.biggest.height;

          return Container(
            color: color,
            width: layoutWidth,
            height: layoutHeight,
          );
        },
      ),
    );
  }

  void _launchURL(String url) async {
    try {
      await launch(url);
    } catch (err) {
      throw Exception('Could not launch $url. Error: $err');
    }
  }

  Future<void> _getInfo() async {
    _info ??= widget.info;
    if (_info != null) return;

    _loading = true;
    if (mounted) setState(() {});

    _url = widget.link;

    if (!_url.startsWith('http://') || !_url.startsWith('https://')) {
      _url = 'https://$_url';
    }

    _url = ((widget.proxyUrl ?? '') + widget.link).trim();
    if (_url.startsWith('http') || _url.startsWith('https')) {
      _info = await LinkPreviewAnalyzer.getInfo(
        _url,
        cacheDuration: widget.cacheDuration,
      );
      widget.onInfoLoaded?.call(_info);
    } else {
      print('Error: $_url is not starting with either http or https.');
    }
    _loading = false;
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    final info = _info;
    var _height = (widget.linkPreviewStyle == LinkPreviewStyle.small ||
            !widget.showGraphic)
        ? MediaQuery.sizeOf(context).height * 0.15
        : MediaQuery.sizeOf(context).height * 0.30;

    if (_loading) {
      return widget.placeholderWidget ??
          Container(
            height: _height,
            width: MediaQuery.sizeOf(context).width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              color: const Color.fromRGBO(248, 248, 248, 1.0),
            ),
            child: const Text('Fetching data...'),
          );
    }

    if (_info != null) {
      if (_info!.type == LinkPreviewType.image) {
        final img = _info!.image;
        return _buildLinkContainer(
          _height,
          title: widget.errorTitle,
          desc: widget.errorBody,
          image: (widget.proxyUrl ?? '') +
              (img.trim() == '' ? widget.errorImage : img),
        );
      }
    }

    return _info == null
        ? widget.errorWidget ??
            _buildPlaceHolder(widget.backgroundColor, _height)
        : _buildLinkContainer(
            _height,
            domain:
                LinkPreviewAnalyzer.isNotEmpty(info!.domain) ? info.domain : '',
            title: LinkPreviewAnalyzer.isNotEmpty(info.title)
                ? info.title
                : widget.errorTitle,
            desc: LinkPreviewAnalyzer.isNotEmpty(info.description)
                ? widget.description?.call(info.description) ?? info.description
                : widget.errorBody,
            image: LinkPreviewAnalyzer.isNotEmpty(info.image)
                ? info.image
                : LinkPreviewAnalyzer.isNotEmpty(info.icon)
                    ? info.icon
                    : widget.errorImage,
            isIcon: LinkPreviewAnalyzer.isNotEmpty(info.image) ? false : true,
          );
  }
}
