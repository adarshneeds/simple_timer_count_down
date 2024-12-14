## [1.0.2] - 2024-12-14
### Added
- Initial release of the `SimpleTimerCountDown` package.
- Core features:
  - Countdown functionality with customizable duration and interval.
  - Callbacks:
    - `onStarted`: Triggered when the timer starts.
    - `onFinished`: Triggered when the countdown finishes.
    - `onChange`: Triggered every interval with the remaining time.
  - `builder` property for rendering custom UI during the countdown.
- Proper lifecycle management:
  - Automatic cleanup of timers when the widget is disposed.
