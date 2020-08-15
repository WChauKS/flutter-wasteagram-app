# wasteagram

Wasteagram Application

## Description

This application was built for a mock client. They are a coffee shop owner that wanted an application for their staff to use for logging the unsold/wasted donuts at closing time. They wanted the application to have three screens:

1. List Screen: 
    - displays the date and number of wasted donuts of all posts with the most recent one being at the top
    - tapping on a post brings up the details screen for that post
    - a running total of wasted donuts
    - a button to choose an image and create a new post
2. Details Screen
    - displays the post's date, photo, number of wasted donuts, and latitude and longitude of where the post was made from
3. New Post Screen
    - displays the chosen image, a text field that brings up a numeric keypad, and a large upload button

This project includes:
- obtaining device location and access to the device's photo gallery
- storage and database services with Firestore
- Semantics widgets for accessibilty
- crash reporting through Sentry

## Quick Demo
![Wasteagram Demo](demo/wasteagramDemo.gif)