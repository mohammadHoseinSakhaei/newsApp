# Flutter Offline Article App 📰

[![Flutter](https://img.shields.io/badge/Flutter-3.7-blue?logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.1-blue?logo=dart&logoColor=white)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

A modern **Flutter** application built with **Clean Architecture**, featuring offline support, reactive state management, and local data persistence. This app demonstrates scalable and maintainable architecture for production-ready Flutter apps.

---

## 🌟 Features

- **Clean Architecture**: Separation of concerns into **presentation**, **domain**, and **data** layers.
- **State Management**: Built with **Cubit** from the Bloc library for efficient reactive UI updates.
- **Offline Support**: Seamlessly works offline using cached data.
- **Local Database**: Powered by **Isar** for fast and efficient local storage.
- **Multi-Source News Feed**: Fetches articles from multiple queries and arranges them sequentially for a smooth reading experience.
- **Error Handling & Fallbacks**: Graceful handling of network errors with automatic fallback to cached articles.
- **Responsive UI**: Adaptive design for different screen sizes and orientations.

---

## 🏗 Architecture Overview

The app follows **Clean Architecture** principles:


**Layers in Detail:**

- **Presentation Layer:** Handles UI and state management via Cubits.
- **Domain Layer:** Contains business logic, use cases, and entities.
- **Data Layer:** Manages API calls, caching, and local database (Isar).
- **Core Layer:** Provides shared utilities, constants, and error handling.

---

## ⚡ Dependencies

- [Flutter](https://flutter.dev/) – Cross-platform framework
- [Bloc & Cubit](https://pub.dev/packages/flutter_bloc) – State management
- [Isar](https://isar.dev/) – Local NoSQL database
- [Dio](https://pub.dev/packages/dio) – Network requests
- [Equatable](https://pub.dev/packages/equatable) – Value comparison for entities
- [Freezed](https://pub.dev/packages/freezed) – Immutable classes and union types

---

## 🚀 Getting Started

1. **Clone the repository:**

```bash
git clone https://github.com/yourusername/flutter-offline-news-app.git
cd flutter-offline-news-app
```

2. **Install dependencies:**
```bash
flutter pub get
```

### 🔨 Code Generation
This project uses **code generation** for models and immutable classes (e.g., `freezed`, `json_serializable`).
After cloning the repository or updating model files, run the following command to generate the necessary files:
```bash
dart run build_runner build -d
```