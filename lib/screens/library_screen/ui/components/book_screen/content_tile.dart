import 'package:flutter/material.dart';

import '../../../../../config/config.dart';

import '../../../../../widgets/pig_expansion_tile.dart';

class ContentTile extends StatelessWidget {
  final String? title;
  final List<String>? contents;
  const ContentTile({
    Key? key,
    this.title,
    this.contents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _contents = contents ?? ["NA"];
    final String _title = title ?? "NA";
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: vPadding(0.12),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: white,
          boxShadow: lightBoxShadow,
          borderRadius: lightBorderRadius,
        ),
        child: PigExpansionTile(
          title: SubText(
            _title,
            bold: true,
            color: black,
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: _contents.map(
            (val) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: vPadding(0.2),
                  left: hPadding(0.5),
                ),
                child: SubTitle(
                  "- $val",
                  // bold: true,
                  color: grey,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
