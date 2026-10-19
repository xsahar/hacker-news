# Hacker News Piscine App

A lightweight, modular, and feature-based Hacker News client built in Flutter using a clean architecture approach. The application fetches top stories directly from the official Hacker News REST API, handles asynchronous states, renders dynamic lists, and launches external web URLs.

---

## Architecture Overview

The app follows a clean, feature-based layer separation:

```text
lib/
├── models/
│   └── post_model.dart     # Plain Dart class & JSON factory constructor
├── services/
│   └── hn_api_service.dart  # Asynchronous HTTP networking & concurrency logic
├── views/
│   └── feed/
│       └── feed_view.dart  # UI view utilizing FutureBuilder & ListView.builder
└── main.dart               # Application entry point & theme setup
```

- **Data Model Layer (`post_model.dart`)**: Safely maps JSON responses from the Hacker News API into strongly-typed Dart objects (`Post`), complete with fallbacks for null/missing values.
- **Service Layer (`hn_api_service.dart`)**: Interfaces with the Hacker News REST API using `http`. Fetches top story IDs and uses `Future.wait` for concurrent request execution to retrieve detailed item data efficiently.
- **UI View Layer (`feed_view.dart`)**: Reactively manages UI states (loading, error, empty, data) using `FutureBuilder` and lazy-loads items using `ListView.builder`.
- **Interactivity (`url_launcher`)**: Interfaces with the host operating system to launch post links in the user's default web browser.

---

## Features

- **Concurrent Data Fetching**: Fast loading times by downloading multiple posts asynchronously.
- **Reactive State Management**: Automatic UI transitions between loading spinners, error messages, and populating data.
- **Lazy Rendering**: Efficient memory usage with `ListView.builder`.
- **External Web Navigation**: Open post links directly in an external web browser.
- **Clean UI**: Uses modern Material 3 styling cards with details such as score, author, and comment counts.

---

## Getting Started

### Prerequisites

- Flutter SDK (3.x or higher)
- Dart SDK
- Windows / macOS / Linux / Android / iOS development environment configured
- *(Windows only)* **Developer Mode** enabled in System Settings (required for symlinks used by plugins like `url_launcher`).

### Installation & Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/hacker-news-piscine.
   cd hacker-news-piscine
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Add required external packages (if not pre-resolved):**
   ```bash
   flutter pub add http url_launcher
   ```

4. **Run the application:**
   ```bash
   flutter run
   ```

---

## Dependencies

- **[http](https://pub.dev/packages/http)**: Making HTTP requests to the REST API.
- **[url_launcher](https://pub.dev/packages/url_launcher)**: Launching external links in standard browsers.

---

## API Reference

This application communicates with the [Hacker News Firebase API](https://github.com/HackerNews/API):
- Top Stories: `https://hacker-news.firebaseio.com/v0/topstories.json`
- Story Details: `https://hacker-news.firebaseio.com/v0/item/{id}.json`