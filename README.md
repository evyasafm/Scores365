# Scores365

An iOS app that displays sports games grouped by date and competition.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [API Integration](#api-integration)
- [Setup](#setup)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Overview
Scores365 is an iOS application that fetches and displays sports games from a remote API. The app organizes games by date and competition, providing a clear and intuitive interface for users to track sports events.

## Features
- Fetches games from the demo API endpoint
- Groups games by date and competition
- Displays games in three states:
  - Future games (STID = 2): Shows team names and start time
  - Live games (Active = true): Shows team names, live score, and current minute
  - Finished games (STID = 3): Shows team names and final score
- Clean architecture with MVVM pattern
- Custom table view cells for games, competitions, and date headers
- Error handling and loading states

## Architecture
The app follows Clean Architecture principles with MVVM pattern, ensuring separation of concerns and testability:

### Layers
- **Domain Layer**
  - Entities: `Game`, `Competitor`, `GameStatus`
  - Use Cases: `GetGamesUseCase`
  - Repositories: `GamesRepository`

- **Data Layer**
  - DTOs: `GameDTO`, `CompetitionDTO`, `CompetitorDTO`
  - Mappers: `GameMapper`
  - Remote Data Sources: `GamesRemoteDataSource`
  - Repositories Implementation: `GamesRepositoryImpl`

- **Presentation Layer**
  - View Models: `GamesViewModel`, `GameCellViewModel`
  - Views: `GamesTableView`, `GameCell`, `CompetitionCell`
  - View Controllers: `GamesViewController`

## Project Structure
```
Scores365/
├── App/                  # App entry point and DI container
├── Data/                 # Data layer implementation
│   ├── Remote/          # API integration and DTOs
│   ├── Mappers/         # Data mapping
│   └── Repository/      # Repository implementations
├── Domain/              # Business logic and entities
│   ├── Entities/        # Core models
│   └── UseCases/        # Business use cases
├── Presentation/        # UI layer
│   ├── Screens/         # Screen implementations
│   ├── Components/      # Reusable UI components
│   └── ViewModels/      # View models
├── Support/             # Utilities and extensions
├── Assets.xcassets/     # App assets
├── Info.plist           # App configuration
└── README.md            # Project documentation
```

## API Integration
The app integrates with the following API endpoint:
- Base URL: `http://demo2170822.mockable.io/`
- Endpoint: `/assignment`


## Setup
1. **Clone the repository:**
   ```sh
   git clone git@github.com:evyasafm/Scores365.git
   cd Scores365
   ```

2. **Open in Xcode:**
   - Open `Scores365.xcodeproj` in Xcode 

3. **Build and run:**
   - Select a simulator or device
   - Press `Cmd+R` to build and run the app

## Usage
- The app automatically fetches and displays games on launch
- Games are grouped by date and competition
- Each game cell shows:
  - Future games: Team names and start time
  - Live games: Team names, current score, and game minute
  - Finished games: Team names and final score

## License
This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
