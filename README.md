# Smart Ahwa Manager ☕

A Flutter application for managing orders in a coffee shop (Ahwa). This app helps track pending and completed orders, generate daily reports, and streamline the order management process.

## Features

* **Order Management**: Create new orders, mark them as completed, and view pending orders.
* **Daily Reports**: View summary of total orders and revenue, along with a list of completed orders.
* **Multiple Drink Types**: Support for Tea, Turkish Coffee, and Hibiscus Tea.
* **Real-time Updates**: Orders and reports update in real-time as orders are completed.

## Project Structure

### Core Components

* `/lib`: Main application code
   * `/core/constants`: App-wide constants like colors (`app_colors.dart`)
   * `/cubit`: State management using Cubit
      * `/home`: Manages home page state and orders
      * `/new_order`: Handles creating new orders
   * `/model`: Data models and repository
      * `drink.dart`: Drink types (Tea, Turkish Coffee, Hibiscus Tea)
      * `order.dart`: Order model
      * `order_repository.dart`: Data storage and management
   * `/presentation`: UI components
      * `/view`: Main screens (Home, Add New Order, Reports)
      * `/widgets`: Reusable UI components

### Key Files

* `main.dart`: Application entry point
* `home_page.dart`: Main dashboard with order overview
* `add_new_order.dart`: Screen for creating new orders
* `reports_page.dart`: Daily reports and revenue summary
* `app_colors.dart`: Color palette for consistent styling

## State Management

The app uses **Flutter Bloc/Cubit** for state management:

* `HomeCubit`: Manages orders state (pending, completed, all orders)
* `NewOrderCubit`: Handles new order creation process

## Data Models

* `Order`: Represents a customer order with details
* `Drink`: Abstract class for drink types with concrete implementations:
   * `Tea`
   * `TurkishCoffee`
   * `HibiscusTea`

## Repository Pattern

* `OrderRepository`: Abstract interface for order operations
* `InMemoryOrderRepository`: Concrete implementation using in-memory storage

## Getting Started

1. Ensure you have Flutter installed
2. Clone the repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the application

## Dependencies

* `flutter_bloc`: For state management
* `flutter`: Core Flutter framework

## UI Components

The app includes custom widgets for consistent design:

* `DropDownButton`: Custom dropdown for drink selection
* `MyTextInputField`: Custom text input field
* `OrderStatusWidgetBox`: Displays order counts
* `QuickActionButton`: For main actions (New Order, Reports)
* `PendingOrdersWidget`: Lists pending orders

This application provides a solid foundation for coffee shop order management with clean architecture and scalable state management.