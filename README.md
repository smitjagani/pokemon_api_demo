aaaaa# Welcome to Pokemon API 🚀

Create a Flutter app using BLoC to fetch and display Pokémon details from the Pokémon API, showcasing efficient state management and data sharing.

## Getting Started

To run this project locally, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/smitjagani/pokemon_api_demo.git

   ```

2. Navigate to the project directory:

   ```bash
   cd pokemon_api_demo

   ```

3. Install dependencies:

   ```bash
   flutter pub get

   ```

4. Generate models:

   ```bash
   dart run build_runner build

   ```

5. Run the project:

   ```bash
   flutter run
   ```

## Dependencies 📦

- cupertino_icons: ^1.0.6
- flutter_bloc: ^8.1.5
- http: ^1.2.1
- json_annotation: ^4.9.0
- cached_network_image: ^3.3.1
 
## Dev Dependencies 📦

- flutter_lints: ^3.0.0
- build_runner: 2.4.9
- json_serializable: 6.8.0

## Fonts 🖋️

The project uses the following fonts:

**Poppins (family)**

- Poppins-Bold.ttf (700)
- Poppins-Medium.ttf (500)
- Poppins-Regular.ttf (400)
- Poppins-Light.ttf (300)

## Assets 🌅

**The project includes assets in the following directories:**

- Fonts: assets/fonts/

## Features Folder :card_index_dividers:
    .lib
    ├── components
    │   └── widgets
    │
    ├── config
    │   ├── api_constatnt.dart
    │   ├── app_colors.dart
    │   ├── app_asset.dart
    │   └── app_theme.dart
    │
    ├── models
    │   ├── pokemon_model.dart
    │   ├── pokemon_model_g.dart
    │   ├── pokemon_detail_model.dart
    │   └── pokemon_detail_model_g.dart
    │
    ├── repository
    │   └── api_repository
    │       └── api_repository.dart
    │
    ├── routes
    │   └── routes.dart
    │
    ├── screens
    │   └── pokemon
    │       ├── pokemon_screen.dart
    │       └── pokemon_detail_screen.dart
    │
    ├── utils
    │   └── services
    │       └── api_services.dart
    │
    └── main.dart

