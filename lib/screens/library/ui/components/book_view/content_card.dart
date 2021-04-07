import 'package:flutter/material.dart';
import '../../../../../config/config.dart';
import '../../../../../widgets/global_utility_widgets.dart';

class ContentCard extends StatelessWidget {
  final String? title;
  final List<String>? content;
  const ContentCard({
    Key? key,
    this.title = "",
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _contents = content ?? [""];
    return PigPaddingContainer(
      verticalPadding: true,
      sizeFactor: SizeFactor.quater,
      child: PigCube(
        height: 150,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VSpacer(
              sizeFactor: SizeFactor.quater,
            ),
            PigPaddingContainer(
              // verticalPadding: true,
              // sizeFactor: SizeFactor.half,
              child: SubText(
                title!,
                bold: true,
                color: black,
              ),
            ),
            SizedBox(
              height: rSHeight(100),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: PigPaddingContainer(
                  verticalPadding: true,
                  sizeFactor: SizeFactor.quater,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
