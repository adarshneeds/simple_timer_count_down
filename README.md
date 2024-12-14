# SimpleTimerCountDown

A customizable countdown timer for Flutter apps. The `SimpleTimerCountDown` widget allows you to easily implement countdown functionality with flexible intervals, callbacks, and custom UI rendering.

---

### ☕ Support My Work

If you find this package helpful, consider buying us a coffee! 

<a href="https://www.buymeacoffee.com/adarshsiiiiingh">
  <img src="https://github.com/user-attachments/assets/40372fba-f86c-4930-be63-66f1f49454ec" alt="Buy Me A Coffee" width="240" height="60"/>
</a>

---

## Features

- **Customizable Duration and Interval:** Specify the total countdown time and update intervals.
- **Callbacks:**
  - `onStarted`: Triggered when the timer starts.
  - `onFinished`: Triggered when the countdown ends.
  - `onChange`: Provides the remaining time at each interval.
- **Custom UI Rendering:** Use the `builder` function to create a dynamic UI based on the remaining time.
- **Lifecycle Management:** Automatically cleans up timers when the widget is disposed.

## Installation

Add this to your `pubspec.yaml` file:

```yaml
dependencies:
  count_down_timer: ^<latest_version>
```

Then run:

```bash
flutter pub get
```

## Usage

Here’s a basic example of how to use `SimpleTimerCountDown`:

```dart
import 'package:flutter/material.dart';
import 'package:count_down_timer/count_down_timer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('SimpleTimerCountDown Example')),
        body: Center(
          child: SimpleTimerCountDown(
            duration: Duration(seconds: 10),
            onStarted: () => print('Timer started!'),
            onFinished: () => print('Timer finished!'),
            onChange: (time) => print('Time remaining: $time'),
            builder: (context, remainingTime) {
              return Text(
                remainingTime.inSeconds.toString(),
                style: TextStyle(fontSize: 48),
              );
            },
          ),
        ),
      ),
    );
  }
}
```

### Properties

| Property       | Type                                           | Description                                         |
|----------------|------------------------------------------------|-----------------------------------------------------|
| `duration`     | `Duration`                                     | The total countdown duration (required).           |
| `interval`     | `Duration`                                     | The interval at which updates occur (default: 1s). |
| `onStarted`    | `VoidCallback?`                                | Callback triggered when the timer starts.          |
| `onFinished`   | `VoidCallback?`                                | Callback triggered when the countdown ends.        |
| `onChange`     | `void Function(Duration)?`                     | Callback providing the remaining time.             |
| `builder`      | `Widget Function(BuildContext, Duration)?`     | Custom UI builder based on the remaining time.     |

## Example UI

Use the `builder` property to create dynamic UIs:

```dart
builder: (context, remainingTime) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Time Remaining:', style: TextStyle(fontSize: 20)),
      Text(
        '${remainingTime.inSeconds}s',
        style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
      ),
    ],
  );
},
```

## Contributing

Contributions are welcome! If you have ideas for new features or improvements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).  

---

### ☕ Support My Work

Love what you see?  

<a href="https://www.buymeacoffee.com/adarshsiiiiingh">
  <img src="https://github.com/user-attachments/assets/40372fba-f86c-4930-be63-66f1f49454ec" alt="Buy Me A Coffee" width="240" height="60"/>
</a>

Your support helps us keep building awesome tools like this!

---

Start building with `SimpleTimerCountDown` today!

