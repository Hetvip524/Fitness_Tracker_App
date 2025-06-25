import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_tracker_app/main.dart'; // Adjust the import based on your project structure
import 'package:fitness_tracker_app/login_screen.dart'; // Import the LoginScreen
import 'package:fitness_tracker_app/home_screen.dart';
import 'package:fitness_tracker_app/dashboard_screen.dart';
import 'package:fitness_tracker_app/profile_screen.dart'; // Import the HomeScreen
import 'package:fitness_tracker_app/profile_screen.dart';
void main() {
  group('Gym Fitness Tracker App Widget Tests', () {
    testWidgets('LoginScreen should display step 1 correctly', (WidgetTester tester) async {
      // Build the LoginScreen
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      // Verify that the first step of the login screen is displayed
      expect(find.text('Welcome Back!'), findsOneWidget); // Check for the title
      expect(find.byType(TextField), findsNWidgets(2)); // Check for email and password fields
      expect(find.text('Continue'), findsOneWidget); // Check for the continue button
    });

    testWidgets('LoginScreen should navigate to step 2', (WidgetTester tester) async {
      // Build the LoginScreen
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      // Tap the continue button
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle(); // Wait for the animation to complete

      // Verify that the second step of the login screen is displayed
      expect(find.text('Complete Profile'), findsOneWidget); // Check for the title
      expect(find.byType(CircleAvatar), findsOneWidget); // Check for the profile image
      expect(find.byType(TextField), findsOneWidget); // Check for the name field
      expect(find.text('Finish Setup'), findsOneWidget); // Check for the finish button
    });

    testWidgets('HomeScreen should display dashboard and navigation', (WidgetTester tester) async {
      // Build the HomeScreen
      await tester.pumpWidget(MaterialApp(home: HomeScreen()));

      // Verify that the DashboardScreen is displayed by default
      expect(find.byType(MenuView), findsOneWidget); // Check for the dashboard
      expect(find.byType(BottomNavigationBar), findsOneWidget); // Check for the bottom navigation bar
    });

    testWidgets('HomeScreen should switch to ProfileScreen on navigation', (WidgetTester tester) async {
      // Build the HomeScreen
      await tester.pumpWidget(MaterialApp(home: HomeScreen()));

      // Tap the profile icon in the bottom navigation bar
      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle(); // Wait for the navigation to complete

      // Verify that the ProfileScreen is displayed
      expect(find.byType(ProfileScreen), findsOneWidget); // Check for the profile screen
    });

    testWidgets('DashboardScreen should display 6 metric cards', (WidgetTester tester) async {
      // Build the DashboardScreen
      await tester.pumpWidget(MaterialApp(home: MenuView()));

      // Verify that 6 metric cards are displayed
      expect(find.byType(Card), findsNWidgets(6)); // Check for 6 cards
      expect(find.text('Steps'), findsOneWidget); // Check for one of the card titles
      expect(find.text('Calories'), findsOneWidget); // Check for another card title
    });

    testWidgets('ProfileScreen should display user information', (WidgetTester tester) async {
      // Build the ProfileScreen
      await tester.pumpWidget(MaterialApp(home: ProfileScreen()));

      // Verify that user information is displayed
      expect(find.byType(CircleAvatar), findsOneWidget); // Check for the profile image
      expect(find.text('John Doe'), findsOneWidget); // Check for the user's name
      expect(find.text('Member since 2023'), findsOneWidget); // Check for the member since text
    });
  });
}