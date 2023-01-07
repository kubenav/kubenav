import 'package:flutter/material.dart';

import 'package:kubenav/models/plugins/time.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// [times] is a list of all time values which are supported.
List<String> times = [
  'Last 5 Minutes',
  'Last 15 Minutes',
  'Last 30 Minutes',
  'Last 1 Hour',
  'Last 3 Hours',
  'Last 6 Hours',
  'Last 12 Hours',
  'Last 1 Day',
  'Last 2 Days',
  'Last 7 Days',
  'Last 30 Days',
];

/// The [AppTimeRangeSelectorWidget] widget can be used to render a modal, where
/// the user can select a [Time]. The widget requires a [time] for the initial
/// selected value and a [selectTime] function which is called when the user
/// selects a new time.
class AppTimeRangeSelectorWidget extends StatefulWidget {
  const AppTimeRangeSelectorWidget({
    super.key,
    required this.time,
    required this.selectTime,
  });

  final Time time;
  final void Function(Time time) selectTime;

  @override
  State<AppTimeRangeSelectorWidget> createState() =>
      _AppTimeRangeSelectorWidgetState();
}

class _AppTimeRangeSelectorWidgetState
    extends State<AppTimeRangeSelectorWidget> {
  String _selectedTime = 'Last 15 Minutes';

  /// [_getTime] returns a [Time] model for the the [_selectedTime] string. The
  /// returned time model contains the selected time string, and the start and
  /// end time as unix timestamp in seconds.
  Time _getTime() {
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    switch (_selectedTime) {
      case 'Last 5 Minutes':
        return Time(time: 'Last 5 Minutes', start: now - 300, end: now);
      case 'Last 15 Minutes':
        return Time(time: 'Last 15 Minutes', start: now - 900, end: now);
      case 'Last 30 Minutes':
        return Time(time: 'Last 30 Minutes', start: now - 1800, end: now);
      case 'Last 1 Hour':
        return Time(time: 'Last 1 Hour', start: now - 3600, end: now);
      case 'Last 3 Hours':
        return Time(time: 'Last 3 Hours', start: now - 10800, end: now);
      case 'Last 6 Hours':
        return Time(time: 'Last 6 Hours', start: now - 21600, end: now);
      case 'Last 12 Hours':
        return Time(time: 'Last 12 Hours', start: now - 43200, end: now);
      case 'Last 1 Day':
        return Time(time: 'Last 1 Day', start: now - 86400, end: now);
      case 'Last 2 Days':
        return Time(time: 'Last 2 Days', start: now - 172800, end: now);
      case 'Last 7 Days':
        return Time(time: 'Last 7 Days', start: now - 604800, end: now);
      case 'Last 30 Days':
        return Time(time: 'Last 30 Days', start: now - 2592000, end: now);
      default:
        return Time(time: 'Last 15 Minutes', start: now - 900, end: now);
    }
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      _selectedTime = widget.time.time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Time Range',
      subtitle: 'Select the time range for you data',
      icon: Icons.schedule,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Select Time Range',
      actionPressed: () {
        widget.selectTime(_getTime());
        Navigator.pop(context);
      },
      actionIsLoading: false,
      child: ListView(
        children: [
          ...List.generate(
            times.length,
            (index) {
              return Container(
                margin: const EdgeInsets.only(
                  top: Constants.spacingSmall,
                  bottom: Constants.spacingSmall,
                  left: Constants.spacingExtraSmall,
                  right: Constants.spacingExtraSmall,
                ),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: theme(context).colorShadow,
                      blurRadius: Constants.sizeBorderBlurRadius,
                      spreadRadius: Constants.sizeBorderSpreadRadius,
                      offset: const Offset(0.0, 0.0),
                    ),
                  ],
                  color: theme(context).colorCard,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Constants.sizeBorderRadius),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedTime = times[index];
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        times[index] == _selectedTime
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        size: 24,
                        color: theme(context).colorPrimary,
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      Expanded(
                        flex: 1,
                        child: Text(
                          times[index],
                          style: noramlTextStyle(
                            context,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
