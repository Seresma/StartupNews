# NewsApp

## Overview
NewsApp is a mobile application built with Swift that displays news articles fetched from an online API. The application is developed using UIKit and follows the Model-View-Controller (MVC) architecture along with the Coordinator pattern to manage navigation.

## Features
- Fetch and display the latest news articles from an online API.
- Browse articles with a clean and user-friendly interface.
- View detailed information about each article.
- Smooth navigation between different sections of the app.

## Architecture
The application is structured using the Model-View-Controller (MVC) pattern, enhanced with the Coordinator pattern for handling navigation. This ensures a clean separation of concerns and easier maintainability.

### Model
The Model represents the data layer of the app. It includes the data structures and networking code to fetch news articles from the API.

### View
The View represents the UI layer of the app. It consists of UIView and UIViewController subclasses that display the data to the user.

### Controller
The Controller acts as an intermediary between the Model and the View. It processes user input and updates the View accordingly.

### Coordinator
The Coordinator pattern is used to manage the navigation flow of the application.
