import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/route_manager.dart';

import '../config/config.dart';
import '../widgets/global_utility_widgets.dart';

///import [flutter_riverpod.dart]
class SandBox extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return GestureDetector(
      onTap: () {
        // Get.back();
      },
      child: Material(
        color: white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: hPadding(1),
            vertical: vPadding(4),
          ),
          child: GestureDetector(
            onTap: () {},
            child: PigCube(
              // height: screenHeight * 0.3,
              width: double.infinity,
              child: PigPaddingContainer(
                child: Column(
                  children: [
                    const VSpacer(
                      sizeFactor: SizeFactor.quater,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 20.0,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: lightBorderRadius,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Heading2(
                            "scope",
                            color: black,
                          ),
                          Wrap(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: hPadding(0.12),
                                ),
                                child: const BranchChip(label: "CSE"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: hPadding(0.12),
                                ),
                                child: const BranchChip(label: "MEC"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: hPadding(0.12),
                                ),
                                child: const BranchChip(label: "ECE"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: hPadding(0.12),
                                ),
                                child: const BranchChip(label: "EEE"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: hPadding(0.12),
                                ),
                                child: const BranchChip(label: "IT"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: hPadding(0.12),
                                ),
                                child: const BranchChip(label: "ALL"),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        clipBehavior: Clip.antiAlias,
                        physics: const BouncingScrollPhysics(),
                        child: Wrap(
                          runSpacing: 2.0,
                          children: const [
                            YearSectionChip(
                              label: "1 A",
                              branch: "cse",
                            ),
                            YearSectionChip(
                              label: "2 A",
                              branch: "cse",
                            ),
                            YearSectionChip(
                              label: "3 A",
                              branch: "cse",
                            ),
                            YearSectionChip(
                              label: "4 A",
                              branch: "cse",
                            ),
                            YearSectionChip(
                              label: "1 B",
                              branch: "cse",
                            ),
                            YearSectionChip(
                              label: "2 B",
                              branch: "cse",
                            ),
                            YearSectionChip(
                              label: "3 B",
                              branch: "cse",
                            ),
                            YearSectionChip(
                              label: "4 B",
                              branch: "Mec",
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class YearSectionChip extends StatefulWidget {
  final String label;
  final String branch;
  final Color? color;
  const YearSectionChip({
    Key? key,
    required this.label,
    required this.branch,
    this.color,
  }) : super(key: key);

  @override
  _YearSectionChipState createState() => _YearSectionChipState();
}

class _YearSectionChipState extends State<YearSectionChip> {
  bool selected = false;
  double elevation = 6.0;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      showCheckmark: false,
      // backgroundColor: selected ? primaryColor : Colors.grey.shade300,
      selectedColor: primaryColor,
      avatar: CircleAvatar(
        backgroundColor: white,
        child: SubText(
          widget.branch.toUpperCase().substring(0, 2),
          letterSpacing: 0.0,
          color: black,
          // bold: true,
        ),
      ),
      selected: selected,
      elevation: elevation,
      label: SubTitle(
        widget.label,
        color: selected ? white : black,
        bold: true,
      ),
      onSelected: (bool value) {
        setState(() {
          selected = value;
          value ? elevation = 0.0 : elevation = 6.0;
        });
      },
    );
  }
}

class BranchChip extends StatefulWidget {
  final String label;
  const BranchChip({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  _BranchChipState createState() => _BranchChipState();
}

class _BranchChipState extends State<BranchChip> {
  bool selected = false;
  double elevation = 6.0;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      backgroundColor: white,
      selected: selected,
      tooltip: widget.label == "ALL" ? "send to everyone" : "",
      selectedColor: primaryColor,
      checkmarkColor: white,
      elevation: elevation,
      label: SubText(
        widget.label,
        color: selected ? white : black,
        bold: !selected,
      ),
      onSelected: (bool value) {
        setState(() {
          selected = value;
          value ? elevation = 0.0 : elevation = 6.0;
        });
      },
    );
  }
}
