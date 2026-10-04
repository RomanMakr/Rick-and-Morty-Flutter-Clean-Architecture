# Rick and Morty — Flutter Clean Architecture

A Flutter mobile application for exploring characters from the **Rick and Morty** universe.

The project is built with **Clean Architecture** principles and uses modern Flutter development practices to keep the codebase scalable, maintainable, and easy to test.

## 📱 Features

* Browse Rick and Morty characters
* View detailed character information
* Character images and information
* Search and explore characters
* Loading and error state handling
* Clean separation between presentation, domain, and data layers
* API integration
* State management with BLoC/Cubit

## 🛠️ Technologies

* **Flutter**
* **Dart**
* **BLoC / Cubit**
* **Clean Architecture**
* **REST API**
* **Dio**
* **Auto Route**
* **Get It**
* **JSON Serialization**
* **Build Runner**

## 🏗️ Architecture

The application follows Clean Architecture principles:

├── lib
│   ├── data
│   │   ├── datasource
│   │   │   ├── character_remote_datasource.dart
│   │   │   └── character_remote_datasource_impl.dart
│   │   ├── dto_models
│   │   │   └── character_dto.dart
│   │   └── repositories
│   │       └── character_repository_impl.dart
│   ├── domain
│   │   ├── entities
│   │   │   └── character_entity.dart
│   │   └── repository
│   │       └── character_repository.dart
│   ├── main.dart
│   └── presentation
│       ├── bloc
│       │   ├── character_favorite_page
│       │   │   ├── character_favorite_bloc.dart
│       │   │   ├── character_favorite_event.dart
│       │   │   └── character_favorite_state.dart
│       │   └── character_list_page
│       │       ├── character_bloc.dart
│       │       ├── character_event.dart
│       │       └── character_state.dart
│       ├── models
│       │   └── character_view_model.dart
│       ├── pages
│       │   ├── character_list.dart
│       │   ├── favorite_page.dart
│       │   ├── home_page.dart
│       │   └── main_page.dart
│       ├── router
│       │   ├── character_router.dart
│       │   └── character_router.gr.dart
│       └── widgets
│           └── character_card.dart

## 🎯 Practice Goals

This project was created for practice and to improve my skills in:

* Flutter & Dart
* Clean Architecture
* BLoC / Cubit state management
* REST API integration
* Dependency Injection
* Repository Pattern
* Navigation with Auto Route
* JSON serialization
* Error and loading state handling
* Building scalable and maintainable Flutter applications
