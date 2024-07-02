# ecomerce_app

This is a simple ecommerce Flutter application that demonstrates the use of Flutter BLoC architecture for state management and includes light and dark theme support with custom color options.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Bloc Architecture](#bloc-architecture)
- [Theme Management](#theme-management)
- [Screenshots](#screenshots)
- [Dependencies](#dependencies)

## Features

- Basic ecommerce functionality
- Light and dark theme support
- Custom theme colors using RGB values
- State management using Flutter BLoC

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/ankoosh544/E-commerce-App.git
   cd E-commerce-app/ecomerce_app
   ```

## Run Flutter Commands

# Install Dependencies

    flutter pub get

## Run the App

    flutter run

## Projct Structure

lib/
├── bloc/
│ ├── cart/
│ │ ├── cart_bloc.dart
│ │ ├── cart_event.dart
│ │ └── cart_state.dart
│ ├── product/
│ │ ├── product_bloc.dart
│ │ ├── product_event.dart
│ │ └── product_state.dart
├── models/
│ ├── category.dart
│ ├── product.dart
│ └── product_repository.dart
├── screens/
│ ├── home_screen.dart
│ ├── category_screen.dart
│ └── product_screen.dart
├── theme_cubit.dart
├── themes.dart
├── widgets/
│ ├── cart_appbar_action.dart
│ ├── category_tile.dart
│ ├── product_tile.dart
│ └── product_row.dart
└── main.dart

Bloc Architecture

The project uses Flutter BLoC for state management. The BLoC pattern is used to separate business logic from UI components.

CartBloc: Manages the state and events related to the shopping cart.
ProductBloc: Manages the state and events related to product listings.
ThemeBloc: Manages the theme state, allowing switching between light, dark, and custom themes.
