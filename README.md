
![Logo](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/th5xamgrr6se0x5ro4g6.png)

# CLIMA

CLIMA is a Flutter app that allows users to acquire the current weather information of their own city and search for weather information of other cities.

## Features

- Fetches current weather data using the OpenWeatherMap API.
- Provides weather conditions, temperature, and suggestions based on the weather.
- Supports searching for weather information of other cities.
- Minimalistic user interface design.

## Screenshots

![Loading Screen](screenshots/loading_screen.png)
![Home Screen](screenshots/home_screen.png)
![City Screen](screenshots/city_screen.png)

## Technologies Used

- Flutter: A cross-platform framework for building mobile applications.
- Flutter Networking: Used to make API requests and fetch weather data.
- Flutter HTTPs: Used to establish secure connections for API requests.


## Screenshots

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)


## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/CLIMA.git

2. change directory to flash-chat

   ```bash
   cd CLIMA

3. Install the dependencies:

   ```bash
   flutter pub get

4. Run the application:

   ```bash
   flutter run
   ```

Make sure you have Flutter and the necessary development tools installed on your machine.


## Usage

1. Open the app and register a new account or log in with your existing credentials.

2. Navigate to the chat screen to join the group chat.

3. Type your message in the input field and press the send button to send it to the group.

## API key

The app requires an API key from OpenWeatherMap to fetch weather data. You can obtain an API key by signing up on their website [here](https://openweathermap.org/).

Once you have the API key, create a file named api_key.dart in the lib directory with the following content:

```bash
const String openWeatherMapApiKey = 'YOUR_API_KEY';
```

Replace YOUR_API_KEY with your actual API key.

    

## License


[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)

[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)

[![AGPL License](https://img.shields.io/badge/license-AGPL-blue.svg)](http://www.gnu.org/licenses/agpl-3.0)

