# Example: SimpleTimerCountDown

The `SimpleTimerCountDown` widget provides a flexible countdown timer for your Flutter application. It allows customization of the timer's behavior and appearance with callbacks and a builder function.

---

## Features
- Customizable countdown duration and interval.
- Callbacks for timer start, update, and finish.
- Builder function for fully customizable UI based on the timer's current position.

---

## Code Example

```dart
import 'package:flutter/material.dart';
import 'simple_timer_countdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Timer Countdown Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Timer Countdown Example')),
      body: Center(
        child: SimpleTimerCountDown(
          duration: const Duration(seconds: 10), // Set the timer duration
          interval: const Duration(seconds: 1), // Update interval
          onStarted: () => print('Timer started!'), // Timer start callback
          onFinished: () => print('Timer finished!'), // Timer finish callback
          onChange: (time) => print('Time remaining: $time'), // Timer update callback
          builder: (context, time) {
            // Customize the UI based on the timer's current position
            return Text(
              '${time.inSeconds} seconds remaining',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
    );
  }
}
