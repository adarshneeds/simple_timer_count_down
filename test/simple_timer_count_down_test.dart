import 'package:simple_timer_count_down/simple_timer_count_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Test to check if the onStarted callback is triggered when the timer starts.
  testWidgets('SimpleTimerCountDown triggers onStarted when timer starts',
      (tester) async {
    bool startedCalled = false;

    // Pump the SimpleTimerCountDown widget with a duration of 5 seconds and onStarted callback.
    await tester.pumpWidget(
      MaterialApp(
        home: SimpleTimerCountDown(
          duration: const Duration(seconds: 5),
          onStarted: () {
            startedCalled =
                true; // Set startedCalled to true when onStarted is triggered.
          },
        ),
      ),
    );

    // Expect that the onStarted callback was called.
    expect(startedCalled, true);
  });

  // Test to check if the onChange callback is triggered during the countdown at each interval.
  testWidgets('SimpleTimerCountDown triggers onChange during countdown',
      (tester) async {
    final List<Duration> changes = [];

    // Pump the SimpleTimerCountDown widget with a duration of 3 seconds and onChange callback.
    await tester.pumpWidget(
      MaterialApp(
        home: SimpleTimerCountDown(
          duration: const Duration(seconds: 3),
          onChange: (remaining) {
            changes.add(
                remaining); // Add the remaining time to the changes list on each update.
          },
        ),
      ),
    );

    // Wait for 4 seconds to allow the timer to trigger the onChange callback multiple times.
    await tester.pumpAndSettle(const Duration(seconds: 4));

    // Expect that the onChange callback was called 3 times (for 2s, 1s, and 0s).
    expect(changes.length, 3);
    expect(changes[0], const Duration(seconds: 2));
    expect(changes[1], const Duration(seconds: 1));
    expect(changes[2], Duration.zero);
  });

  // Test to check if the onFinished callback is triggered when the timer reaches zero.
  testWidgets('SimpleTimerCountDown triggers onFinished when timer ends',
      (tester) async {
    bool finishedCalled = false;

    // Pump the SimpleTimerCountDown widget with a duration of 3 seconds and onFinished callback.
    await tester.pumpWidget(
      MaterialApp(
        home: SimpleTimerCountDown(
          duration: const Duration(seconds: 3),
          onFinished: () {
            finishedCalled =
                true; // Set finishedCalled to true when onFinished is triggered.
          },
        ),
      ),
    );

    // Wait for 4 seconds to allow the timer to finish and trigger the onFinished callback.
    await tester.pumpAndSettle(const Duration(seconds: 4));

    // Expect that the onFinished callback was called.
    expect(finishedCalled, true);
  });

  // Test to check if the custom builder renders the widget correctly with the remaining time.
  testWidgets('SimpleTimerCountDown renders custom builder correctly',
      (tester) async {
    // Pump the SimpleTimerCountDown widget with a custom builder to display the remaining time.
    await tester.pumpWidget(
      MaterialApp(
        home: SimpleTimerCountDown(
          duration: const Duration(seconds: 3),
          builder: (context, remaining) {
            return Text(
                'Remaining: ${remaining.inSeconds}'); // Display remaining time in seconds.
          },
        ),
      ),
    );

    // Expect that the initial text shows the remaining time as 3 seconds.
    expect(find.text('Remaining: 3'), findsOneWidget);

    // Wait for 1 second and check if the text updates to reflect the remaining time as 2 seconds.
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Remaining: 2'), findsOneWidget);
  });

  // Test to check if the SimpleTimerCountDown works correctly with a custom interval.
  testWidgets('SimpleTimerCountDown works with custom interval',
      (tester) async {
    final List<Duration> changes = [];

    // Pump the SimpleTimerCountDown widget with a duration of 6 seconds and a custom interval of 2 seconds.
    await tester.pumpWidget(
      MaterialApp(
        home: SimpleTimerCountDown(
          duration: const Duration(seconds: 6),
          interval: const Duration(seconds: 2),
          onChange: (remaining) {
            changes.add(
                remaining); // Add the remaining time to the changes list at each interval.
          },
        ),
      ),
    );

    // Wait for 7 seconds to allow the timer to update at the custom interval.
    await tester.pumpAndSettle(const Duration(seconds: 7));

    // Expect that the onChange callback was called 3 times (for 4s, 2s, and 0s).
    expect(changes.length, 3); // 6 -> 4 -> 2 -> 0
    expect(changes[0], const Duration(seconds: 4));
    expect(changes[1], const Duration(seconds: 2));
    expect(changes[2], Duration.zero);
  });
}
