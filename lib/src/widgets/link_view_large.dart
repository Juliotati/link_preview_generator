import 'package:flutter/material.dart';

class LinkViewLarge extends StatelessWidget {
  const LinkViewLarge({
    required this.url,
    required this.domain,
    required this.title,
    required this.description,
    required this.imageUri,
    required this.graphicFit,
    required this.showBody,
    required this.showDomain,
    required this.showGraphic,
    required this.showTitle,
    super.key,
    this.titleTextStyle,
    this.bodyTextStyle,
    this.domainTextStyle,
    this.bodyTextOverflow,
    this.bodyMaxLines,
    this.isIcon = false,
    this.bgColor,
    this.radius,
  });

  final Color? bgColor;
  final int? bodyMaxLines;
  final TextOverflow? bodyTextOverflow;
  final TextStyle? bodyTextStyle;
  final String description;
  final String domain;
  final TextStyle? domainTextStyle;
  final String imageUri;
  final bool isIcon;
  final double? radius;
  final bool showBody;
  final bool showDomain;
  final bool showGraphic;
  final bool showTitle;
  final BoxFit graphicFit;
  final String title;
  final TextStyle? titleTextStyle;
  final String url;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layoutWidth = constraints.biggest.width;
        final layoutHeight = constraints.biggest.height;

        final _titleTS = titleTextStyle ??
            TextStyle(
              fontSize: computeTitleFontSize(layoutHeight),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            );
        final _bodyTS = bodyTextStyle ??
            TextStyle(
              fontSize: computeTitleFontSize(layoutHeight) - 1,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            );
        final _domainTS = bodyTextStyle ??
            TextStyle(
              fontSize: computeTitleFontSize(layoutHeight) - 1,
              color: Colors.blue,
              fontWeight: FontWeight.w400,
            );

        return Column(
          children: <Widget>[
            showGraphic
                ? Expanded(
                    flex: 3,
                    child: imageUri == ''
                        ? Container(color: bgColor ?? Colors.grey)
                        : Container(
                            padding: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              borderRadius: radius == 0
                                  ? BorderRadius.zero
                                  : const BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                              image: DecorationImage(
                                image: NetworkImage(imageUri),
                                fit: isIcon ? BoxFit.contain : graphicFit,
                              ),
                            ),
                          ),
                  )
                : const SizedBox(height: 5),
            showTitle
                ? _buildTitleContainer(
                    _titleTS, computeTitleLines(layoutHeight, layoutWidth))
                : const SizedBox(),
            showBody
                ? _buildBodyContainer(
                    _bodyTS, _domainTS, computeBodyLines(layoutHeight))
                : const SizedBox(),
          ],
        );
      },
    );
  }

  int? computeBodyLines(layoutHeight) {
    var lines = layoutHeight ~/ 90 == 0 ? 1 : layoutHeight ~/ 90;
    lines += showDomain ? 0 : 1;
    return lines;
  }

  double computeTitleFontSize(double height) {
    var size = height * 0.13;
    if (size > 15) {
      size = 15;
    }
    return size;
  }

  int computeTitleLines(layoutHeight, layoutWidth) {
    return layoutHeight - layoutWidth < 50 ? 1 : 2;
  }

  Widget _buildBodyContainer(
      TextStyle _bodyTS, TextStyle _domainTS, _maxLines) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 5, 5),
        child: Column(
          children: [
            showDomain
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Align(
                      alignment: const Alignment(-1.0, -1.0),
                      child: Text(
                        domain,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: _domainTS,
                      ),
                    ),
                  )
                : const SizedBox(),
            Expanded(
              child: Container(
                alignment: const Alignment(-1.0, -1.0),
                child: Text(
                  description,
                  style: _bodyTS,
                  overflow: bodyTextOverflow ?? TextOverflow.ellipsis,
                  maxLines: bodyMaxLines ?? _maxLines,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleContainer(TextStyle _titleTS, _maxLines) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 5, 1),
      child: Container(
        alignment: const Alignment(-1.0, -1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: _titleTS,
              overflow: TextOverflow.ellipsis,
              maxLines: _maxLines,
            ),
          ],
        ),
      ),
    );
  }
}
