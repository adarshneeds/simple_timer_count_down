import 'package:simple_timer_count_down/simple_timer_count_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SimpleTimerCountDown triggers onStarted when timer starts', (tester) async {
    bool startedCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: SimpleTimerCountDown(
          duration: const Duration(seconds: 5),
          onStarted: () {
            startedCalled = true;
          },
        ),
      ),
    );

    expect(startedCalled, true);
  });

  testWidgets('SimpleTimerCountDown triggers onChange during countdown', (tester) async {
    final List<Duration> changes = [];

    await tester.pumpWidget(
      MaterialApp(
        home: SimpleTimerCountDown(
          duration: const Duration(seconds: 3),
          onChange: (remaining) {
            changes.add(remaining);
          },
        ),
      ),
    );

    await tester.pumpAndSettle(const Duration(seconds: 4));

    expect(changes.length, 3);
    expect(changes[0], const Duration(seconds: 2));
    expect(changes[1], const Duration(seconds: 1));
    expect(changes[2], Duration.zero);
  });

  testWidgets('SimpleTimerCountDown triggers onFinished when timer ends', (tester) async {
    bool finishedCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: SimpleTimerCountDown(
          duration: const Duration(seconds: 3),
          onFinished: () {
            finishedCalled = true;
          },
        ),
      ),
    );

    await tester.pumpAndSettle(const Duration(seconds: 4));

    expect(finishedCalled, true);
  });

  testWidgets('SimpleTimerCountDown renders custom builder correctly', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SimpleTimerCountDown(
          duration: const Duration(seconds: 3),
          builder: (context, remaining) {
            return Text('Remaining: ${remaining.inSeconds}');
          },
        ),
      ),
    );

    expect(find.text('Remaining: 3'), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Remaining: 2'), findsOneWidget);
  });

  testWidgets('SimpleTimerCountDown works with custom interval', (tester) async {
    final List<Duration> changes = [];

    await tester.pumpWidget(
      MaterialApp(
        home: SimpleTimerCountDown(
          duration: const Duration(seconds: 6),
          interval: const Duration(seconds: 2),
          onChange: (remaining) {
            changes.add(remaining);
          },
        ),
      ),
    );

    await tester.pumpAndSettle(const Duration(seconds: 7));

    expect(changes.length, 3); // 6 -> 4 -> 2 -> 0
    expect(changes[0], const Duration(seconds: 4));
    expect(changes[1], const Duration(seconds: 2));
    expect(changes[2], Duration.zero);
  });
}
