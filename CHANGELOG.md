## [1.0.5] - 2024-12-21
### Added
- Added comments
### Updated
- README documentation for better clarity.

## [1.0.4] - 2024-12-21
### Updated
- Changelog documentation

## [1.0.3] - 2024-12-21
### Updated
- README documentation for better clarity.

## [1.0.2] - 2024-12-21
### Updated
- README documentation.

## [1.0.1] - 2024-12-14
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