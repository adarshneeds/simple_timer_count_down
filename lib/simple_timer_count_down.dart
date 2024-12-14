// Copyright (c) 2024 ADARSH SINGH
// Licensed under the MIT License. See the LICENSE file in the root directory for details.

import 'dart:async';
import 'package:flutter/material.dart';

/// A simple countdown timer widget that updates every specified interval.
/// It allows custom actions when the timer starts, updates, or finishes.
///
/// [SimpleTimerCountDown] requires:
/// - [duration]: The total duration for the countdown.
/// - [interval]: The interval at which the timer updates (defaults to 1 second).
/// - [onStarted]: A callback function triggered when the timer starts.
/// - [onFinished]: A callback function triggered when the timer finishes.
/// - [onChange]: A callback function triggered on every interval update with the current timer position.
/// - [builder]: A custom builder function to customize the widget UI based on the current timer duration.

class SimpleTimerCountDown extends StatefulWidget {
  const SimpleTimerCountDown({
    required this.duration,
    this.interval = const Duration(seconds: 1),
    this.onStarted,
    this.onFinished,
    this.onChange,
    this.builder,
    super.key,
  });

  /// The total duration for the countdown.
  final Duration duration;

  /// The interval at which the timer updates, defaults to 1 second.
  final Duration interval;

  /// A callback function triggered when the timer starts.
  final VoidCallback? onStarted;

  /// A callback function triggered when the timer finishes.
  final VoidCallback? onFinished;

  /// A callback function triggered when the timer updates on every interval.
  final void Function(Duration)? onChange;

  /// A custom builder function to customize the UI based on the current timer position.
  final Widget Function(BuildContext context, Duration time)? builder;

  @override
  State<SimpleTimerCountDown> createState() => _SimpleTimerCountDownState();
}

class _SimpleTimerCountDownState extends State<SimpleTimerCountDown> {
  /// The current position of the timer (time remaining).
  late Duration position;

  /// The timer that controls the countdown.
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Initialize the timer position with the provided duration.
    position = widget.duration;
    // Start the countdown timer when the widget is created.
    _startTimer();
  }

  /// Starts the countdown timer and updates the position at regular intervals.
  void _startTimer() {
    // Invoke the onStarted callback if provided.
    widget.onStarted?.call();

    // Periodically update the timer position at the specified interval.
    _timer = Timer.periodic(widget.interval, (timer) {
      // Check if the widget is still mounted to avoid errors.
      if (!mounted) return;

      // Update the position by subtracting the interval.
      setState(() {
        position -= widget.interval;
      });

      // Invoke the onChange callback with the current position.
      widget.onChange?.call(position);

      // If the countdown has finished, stop the timer and invoke onFinished.
      if (position <= Duration.zero) {
        widget.onFinished?.call();
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed.
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use the provided builder to build the widget UI based on the current timer position.
    // If no builder is provided, return an empty container (SizedBox).
    return widget.builder?.call(context, position) ?? const SizedBox();
  }
}
