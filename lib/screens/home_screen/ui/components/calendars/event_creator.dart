import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;

import '/config/config.dart';

import '/screens/home_screen/providers/calendar_state_provider.dart';

import '/utils/date_time.dart';

import '/widgets/global_utility_widgets.dart';

Future buildShowDialog(
  BuildContext context,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        elevation: 8.0,
        shape: const RoundedRectangleBorder(borderRadius: lightBorderRadius),
        backgroundColor: white,
        title: const SubText(
          'Event Creator.',
          color: black,
          bold: true,
        ),
        content: const SubText(
          'What You Want To Do?',
          color: grey,
        ),
        actions: [
          TextButton(
            onPressed: () {
              ///if the user chose to [close] then the defaultValues are set to the [providers]
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const SubTitle(
              'Draft',
              bold: true,
            ),
          ),
          TextButton(
            onPressed: () {
              // reset the providers
              titleController.text = "";
              descriptionController.text = "";
              context
                  .read(eventTitleStateNotifierProvider)
                  .updateEventTitle("");
              context
                  .read(eventDescriptionStateNotifierProvider)
                  .updateEventDescription("");
              // reset dates.
              context
                  .read(dateTimeRangeStateNotifierProvider)
                  .updateDateTimeRange(
                    DateTimeRange(
                      start: DateTime.now(),
                      end: DateTime.now().add(
                        const Duration(days: 1),
                      ),
                    ),
                  );
              // reset time
              updateTime(startTimeStateProvider,
                  const TimeOfDay(hour: 4, minute: 47), context);
              updateTime(endTimeStateProvider,
                  const TimeOfDay(hour: 4, minute: 47), context);

              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const SubTitle(
              'Discard',
              color: errorColor,
              bold: true,
            ),
          )
        ],
      );
    },
  );
}

class PigCustomKeyboardDismissiableWrapper extends StatelessWidget {
  /// if there is any [TextFeild] then wrap the entire [screen] with this [Widget]
  final Widget child;

  const PigCustomKeyboardDismissiableWrapper({Key? key, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
        _scrollController.animateTo(
          0.0,
          duration: const Duration(microseconds: 200),
          curve: Curves.ease,
        );
        context.read(registerDescriptionTextFeildTapStateProvider).state =
            false;
      },
      child: child,
    );
  }
}

final registerDescriptionTextFeildTapStateProvider =
    riverpod.StateProvider<bool>((ref) {
  return false;
});
ScrollController _scrollController = ScrollController();

class EventCreator extends riverpod.ConsumerWidget {
  @override
  Widget build(BuildContext context, riverpod.ScopedReader watch) {
    final registerDescriptionTextFeildTapState =
        watch(registerDescriptionTextFeildTapStateProvider).state;
    final dateTimeRangeState = watch(dateTimeRangeStateNotifierProvider.state);
    // watch time
    final startTimeState = watch(startTimeStateProvider).state;
    final endTimeState = watch(endTimeStateProvider).state;
    // watch title
    final eventTitleState = watch(eventTitleStateNotifierProvider.state);
    // watch description
    final eventDescriptionState =
        watch(eventDescriptionStateNotifierProvider.state);
    return Scaffold(
      appBar: AppBar(
        title: const Heading2("Create Event"),
        elevation: 0.0,
        backgroundColor: white,
        leading: PigArrow(
          onTap: () {
            // Get.back();
            // check if time or date or title or description are empty or not
            if ((startTimeState != const TimeOfDay(hour: 4, minute: 47)) |
                (endTimeState != const TimeOfDay(hour: 4, minute: 47)) |
                (dateTimeRangeState.start.day != DateTime.now().day) |
                (dateTimeRangeState.end.day !=
                    DateTime.now().add(const Duration(days: 1)).day) |
                eventTitleState.isNotEmpty |
                eventDescriptionState.isNotEmpty) {
              buildShowDialog(context);
            } else {
              Navigator.of(context).pop();
            }
          },
          turns: 4,
        ),
      ),
      body: PigCustomKeyboardDismissiableWrapper(
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: PigPaddingContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VSpacer(
                  sizeFactor: SizeFactor.quater,
                ),
                const StartEndDatePickers(),
                const VSpacer(
                  sizeFactor: SizeFactor.half,
                ),
                const StartEndTimePickers(),
                const VSpacer(
                  sizeFactor: SizeFactor.quater,
                ),
                const Heading2("Event Title"),
                const EventTitleTextFeild(),
                const VSpacer(
                  sizeFactor: SizeFactor.quater,
                ),
                const Heading2("Event Description"),
                const EventDescriptionTextFeild(),
                if (!registerDescriptionTextFeildTapState)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      PostActions(),
                    ],
                  ),
                if (registerDescriptionTextFeildTapState)
                  SizedBox(
                    height: rSHeight(500),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextEditingController titleController = TextEditingController();
TextEditingController descriptionController = TextEditingController();

class EventTitleTextFeild extends riverpod.ConsumerWidget {
  const EventTitleTextFeild({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, riverpod.ScopedReader watch) {
    final validEventTitleState = watch(validEventTitleStateProvider).state;
    final eventTitleState = watch(eventTitleStateNotifierProvider.state);
    return TextField(
      key: const Key('title'),
      controller: titleController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      maxLength: 30,
      cursorColor: primaryColor,
      onChanged: (value) {
        if (validateEventTitle(context, value)) {
          context.read(eventTitleStateNotifierProvider).updateEventTitle(value);
        }
      },
      onEditingComplete: () {
        ///closes [keyboard] after clicking the [done] button on [keyboard]
        context
            .read(eventTitleStateNotifierProvider)
            .updateEventTitle(titleController.text);
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      decoration: InputDecoration(
        ///when the [title] is invaild an [errorText] is shown
        errorText: validEventTitleState ? null : "Title Required",

        ///when the [text] is not empty then an [close] icon is shown
        ///which allows the user to clear the [text] in the [TextFeild]
        suffixIcon: eventTitleState.isEmpty
            ? Container(
                width: 0.0,
              )
            : IconButton(
                icon: const Icon(
                  Icons.close_rounded,
                  size: 20.0,
                  color: errorColor,
                ),

                //this is [onPressed] which calls a fucntion that clears the contents from [TextFeild]
                //and also the [providers]
                onPressed: () {
                  titleController.clear();
                  context
                      .read(eventTitleStateNotifierProvider)
                      .updateEventTitle("");
                  final FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    currentFocus.focusedChild!.unfocus();
                  }
                },
              ),
        labelText: 'title',
        labelStyle: TextStyle(
          color: grey.withOpacity(0.5),
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.0,
        ),
        hintText: '"hackthon 2019"',
        hintStyle: TextStyle(
          color: grey.withOpacity(0.5),
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.0,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: grey),
        ),

        ///when the [TextFeild] is clicked and has an [error] then [border] color changes to [errorColor]
        focusedErrorBorder: validEventTitleState
            ? null
            : const OutlineInputBorder(
                borderSide: BorderSide(color: errorColor),
              ),

        ///when the [TextFeild] is clicked then the [border] color changes to [primaryColor]
        focusedBorder: validEventTitleState
            ? const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor))
            : null,
        errorBorder: validEventTitleState
            ? null
            : const OutlineInputBorder(
                borderSide: BorderSide(color: errorColor),
              ),
      ),
    );
  }
}

class EventDescriptionTextFeild extends riverpod.ConsumerWidget {
  const EventDescriptionTextFeild({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, riverpod.ScopedReader watch) {
    final validEventDescriptionState =
        watch(validEventDescriptionStateProvider).state;
    final eventDescriptionState =
        watch(eventDescriptionStateNotifierProvider.state);
    return TextField(
      onTap: () {
        context.read(registerDescriptionTextFeildTapStateProvider).state = true;
        _scrollController.animateTo(
          rSHeight(150),
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
        );
      },
      key: const Key('Description'),
      controller: descriptionController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      maxLines: 10,
      maxLength: 600,
      cursorColor: primaryColor,
      onChanged: (value) {
        if (validateEventDescription(context, value)) {
          context
              .read(eventDescriptionStateNotifierProvider)
              .updateEventDescription(value);
        }
      },
      onEditingComplete: () {
        ///closes [keyboard] after clicking the [done] button on [keyboard]
        context
            .read(eventDescriptionStateNotifierProvider)
            .updateEventDescription(titleController.text);
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();

          context.read(registerDescriptionTextFeildTapStateProvider).state =
              false;
        }
      },
      decoration: InputDecoration(
        ///when the [title] is invaild an [errorText] is shown
        errorText: validEventDescriptionState ? null : "Description Required",

        ///when the [text] is not empty then an [close] icon is shown
        ///which allows the user to clear the [text] in the [TextFeild]
        suffixIcon: eventDescriptionState.isEmpty
            ? Container(
                width: 0.0,
              )
            : IconButton(
                icon: const Icon(
                  Icons.close_rounded,
                  size: 20.0,
                  color: errorColor,
                ),

                //this is [onPressed] which calls a fucntion that clears the contents from [TextFeild]
                //and also the [providers]
                onPressed: () {
                  descriptionController.clear();
                  context
                      .read(eventDescriptionStateNotifierProvider)
                      .updateEventDescription("");
                  final FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    currentFocus.focusedChild!.unfocus();
                  }
                },
              ),
        labelText: 'Description',
        labelStyle: TextStyle(
          color: grey.withOpacity(0.5),
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.0,
        ),
        hintText: '"hackthon 2019"',
        hintStyle: TextStyle(
          color: grey.withOpacity(0.5),
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.0,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: grey),
        ),

        ///when the [TextFeild] is clicked and has an [error] then [border] color changes to [errorColor]
        focusedErrorBorder: validEventDescriptionState
            ? null
            : const OutlineInputBorder(
                borderSide: BorderSide(color: errorColor),
              ),

        ///when the [TextFeild] is clicked then the [border] color changes to [primaryColor]
        focusedBorder: validEventDescriptionState
            ? const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor))
            : null,
        errorBorder: validEventDescriptionState
            ? null
            : const OutlineInputBorder(
                borderSide: BorderSide(color: errorColor),
              ),
      ),
    );
  }
}

class StartEndDatePickers extends riverpod.ConsumerWidget {
  const StartEndDatePickers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, riverpod.ScopedReader watch) {
    final dateTimeRangeState = watch(dateTimeRangeStateNotifierProvider.state);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading2('Pick Dates'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                pickDateRange(context, dateTimeRangeState);
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: lightBoxShadow(),
                  borderRadius: lightBorderRadius,
                ),
                child: Center(
                  child: SubText(
                    formattedDate(dateTimeRangeState.start),
                    bold: true,
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_rounded,
              color: primaryColor,
            ),
            GestureDetector(
              onTap: () {
                pickDateRange(context, dateTimeRangeState);
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: lightBoxShadow(),
                  borderRadius: lightBorderRadius,
                ),
                child: Center(
                  child: SubText(
                    formattedDate(dateTimeRangeState.end),
                    bold: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Future pickDateRange(BuildContext context, DateTimeRange dateTimeRange) async {
  final newDateRange = await showDateRangePicker(
    context: context,
    firstDate: DateTime.now(),
    lastDate: DateTime(DateTime.now().year + 2),
    initialDateRange: dateTimeRange,
    builder: (BuildContext context, Widget? child) {
      return Theme(
        /// overriding the default color theme.
        data: ThemeData.light().copyWith(
          primaryColor: primaryColor,
          colorScheme: const ColorScheme.light(
            onPrimary: black,
            primary: primaryColor,
          ),
          dialogBackgroundColor: white,
        ),
        child: child!,
      );
    },
  );
  if (newDateRange == null) {
    return;
  } else {
    context
        .read(dateTimeRangeStateNotifierProvider)
        .updateDateTimeRange(newDateRange);
    // initialDateRange = newDateRange;
  }
}

class StartEndTimePickers extends riverpod.ConsumerWidget {
  const StartEndTimePickers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, riverpod.ScopedReader watch) {
    final startTimeState = watch(startTimeStateProvider).state;
    final endTimeState = watch(endTimeStateProvider).state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading2('Pick Time'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                final _time = TimeOfDay.now();

                /// opens a  [DatePicker] to select date for the [Event ]
                showTimePicker(
                  context: context,
                  initialTime: _time,
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      /// overriding the default color theme.
                      data: ThemeData.light().copyWith(
                        colorScheme: const ColorScheme.dark(
                          primary: primaryColor,
                          onPrimary: white,
                          surface: white,
                          onSurface: black,
                        ),
                        dialogBackgroundColor: white,
                      ),
                      child: child!,
                    );
                  },
                ).then((time) =>
                    updateTime(startTimeStateProvider, time, context));
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: lightBoxShadow(),
                  borderRadius: lightBorderRadius,
                ),
                child: Center(
                  child: SubText(
                    formattedTime(startTimeState),
                    // formattedDate(startDateState),
                    bold: true,
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_rounded,
              color: primaryColor,
            ),
            GestureDetector(
              onTap: () {
                final _time = TimeOfDay.now();

                /// opens a  [TimePicker] to select End time for the [Event ]
                showTimePicker(
                  initialTime: _time,
                  context: context,
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      /// overriding the default color theme.
                      data: ThemeData.light().copyWith(
                        colorScheme: const ColorScheme.dark(
                          primary: primaryColor,
                          onPrimary: white,
                          surface: white,
                          onSurface: black,
                        ),
                        dialogBackgroundColor: white,
                      ),
                      child: child!,
                    );
                  },
                ).then(
                    (time) => updateTime(endTimeStateProvider, time, context));
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: lightBoxShadow(),
                  borderRadius: lightBorderRadius,
                ),
                child: Center(
                  child: SubText(
                    formattedTime(endTimeState),
                    bold: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PostActions extends riverpod.ConsumerWidget {
  /// [post] button
  const PostActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, riverpod.ScopedReader watch) {
    Color getColor(Set<MaterialState> states) {
      ///setting the button [theme] when
      ///[pressed]
      ///[hoverd]
      ///[focused]
      ///to [transparent]
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return transparent;
      }
      return transparent;
    }

    return TextButton(
      ///button which allow to [post]
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith(getColor),
      ),
      onPressed: () {},
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          boxShadow: lightBoxShadow(),
          color: primaryColor,
          borderRadius: lightBorderRadius,
        ),
        child: const PigPaddingContainer(
          verticalPadding: true,
          sizeFactor: SizeFactor.quater,
          child: SubText(
            'Post',
            color: white,
            bold: true,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
