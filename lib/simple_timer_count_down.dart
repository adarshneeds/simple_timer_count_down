// Copyright (c) 2024 ADARSH SINGH
// Licensed under the MIT License. See the LICENSE file in the root directory for details.

import 'dart:async';
import 'package:flutter/material.dart';

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

  final Duration duration;
  final Duration interval;
  final VoidCallback? onStarted;
  final VoidCallback? onFinished;
  final void Function(Duration)? onChange;
  final Widget Function(BuildContext context, Duration time)? builder;

  @override
  State<SimpleTimerCountDown> createState() => _SimpleTimerCountDownState();
}

class _SimpleTimerCountDownState extends State<SimpleTimerCountDown> {
  late Duration position;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    position = widget.duration;
    _startTimer();
  }

  void _startTimer() {
    widget.onStarted?.call();

    _timer = Timer.periodic(widget.interval, (timer) {
      if (!mounted) return;

      setState(() {
        position -= widget.interval;
      });

      widget.onChange?.call(position);

      if (position <= Duration.zero) {
        widget.onFinished?.call();
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder?.call(context, position) ?? const SizedBox();
  }
}
