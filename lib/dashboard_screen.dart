import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'weight_screen.dart';
import 'training_plan_screen.dart';
import 'training_status_screen.dart';
import 'meal_plan_screen.dart';
import 'schedule_screen.dart';
import 'running_screen.dart';
import 'exercises_screen.dart';
import 'tips_screen.dart';
import 'settings_screen.dart';
import 'support_screen.dart';
import 'package:pedometer/pedometer.dart';
import 'live_activity_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MenuView extends StatefulWidget {
  final String userName;
  final bool isDarkMode;
  final void Function(bool) onThemeChanged;
  const MenuView({Key? key, required this.userName, required this.isDarkMode, required this.onThemeChanged}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  List menuArr = [
    {"name": "Live Activity", "image": "assets/steps.png", "tag": "0"},
    {"name": "Home", "image": "assets/home.jpg", "tag": "1"},
    {"name": "Weight", "image": "assets/weight.jpg", "tag": "2"},
    {"name": "Training Plan", "image": "assets/Running.jpg", "tag": "3"},
    {"name": "Training Status", "image": "assets/training_status.jpg", "tag": "4"},
    {"name": "Meal Plan", "image": "assets/meal.jpg", "tag": "5"},
    {"name": "Schedule", "image": "assets/support.jpg", "tag": "6"},
    {"name": "Running", "image": "assets/Running.jpg", "tag": "7"},
    {"name": "Exercises", "image": "assets/exercise.jpg", "tag": "8"},
    {"name": "Tips", "image": "assets/tips.png", "tag": "9"},
    {"name": "Settings", "image": "assets/settings.png", "tag": "10"},
    {"name": "Support", "image": "assets/support.jpg", "tag": "11"},
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          _StepStatsWidget(),
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    collapsedHeight: kToolbarHeight + 20,
                    backgroundColor: Colors.black,
                    expandedHeight: media.width * 0.6,
                    flexibleSpace: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Image.network(
                          "https://thumbs.dreamstime.com/b/intense-fitness-anime-character-performing-push-up-exercise-vibrant-gym-setting-intense-fitness-anime-character-performing-push-345012973.jpg",
                          fit: BoxFit.cover,
                          height: media.width * 0.8,
                          width: media.width,
                        ),
                        Container(
                          height: media.width * 0.8,
                          width: media.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(27)),
                                alignment: Alignment.center,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(
                                    "https://thumbs.dreamstime.com/b/intense-fitness-anime-character-performing-push-up-exercise-vibrant-gym-setting-intense-fitness-anime-character-performing-push-345012973.jpg",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.userName,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: 1),
                                    Text(
                                      "Profile",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w200,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ];
              },
              body: GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1,
                ),
                itemCount: menuArr.length,
                itemBuilder: (context, index) {
                  var mObj = menuArr[index] as Map? ?? {};
                  return GestureDetector(
                    onTap: () {
                      if (mObj["name"] == "Live Activity") {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => LiveActivityScreen()));
                        return;
                      }
                      switch (mObj["name"]) {
                        case "Home":
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('You are already on the Home screen!')),
                          );
                          break;
                        case "Weight":
                          Navigator.push(context, MaterialPageRoute(builder: (_) => WeightScreen()));
                          break;
                        case "Training Plan":
                          Navigator.push(context, MaterialPageRoute(builder: (_) => TrainingPlanScreen()));
                          break;
                        case "Training Status":
                          Navigator.push(context, MaterialPageRoute(builder: (_) => TrainingStatusScreen()));
                          break;
                        case "Meal Plan":
                          Navigator.push(context, MaterialPageRoute(builder: (_) => MealPlanScreen()));
                          break;
                        case "Schedule":
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ScheduleScreen()));
                          break;
                        case "Running":
                          Navigator.push(context, MaterialPageRoute(builder: (_) => RunningScreen()));
                          break;
                        case "Exercises":
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ExercisesScreen()));
                          break;
                        case "Tips":
                          Navigator.push(context, MaterialPageRoute(builder: (_) => TipsScreen()));
                          break;
                        case "Settings":
                          Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsScreen(
                            isDarkMode: widget.isDarkMode,
                            onThemeChanged: widget.onThemeChanged,
                          )));
                          break;
                        case "Support":
                          Navigator.push(context, MaterialPageRoute(builder: (_) => SupportScreen()));
                          break;
                        default:
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(mObj["name"]),
                              content: Text('${mObj["name"]} feature coming soon!'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                            spreadRadius: 2,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              mObj["image"],
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            mObj["name"],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepStatsWidget extends StatefulWidget {
  @override
  State<_StepStatsWidget> createState() => _StepStatsWidgetState();
}

class _StepStatsWidgetState extends State<_StepStatsWidget> {
  Stream<StepCount>? _stepCountStream;
  int _steps = 0;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream?.listen((event) {
        if (mounted) {
          setState(() {
            _steps = event.steps;
          });
        }
      });
    }
  }

  void _simulateStep() {
    if (mounted) {
      setState(() {
        _steps += 10;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Estimate distance (in km) and calories (simple formula)
    double distance = _steps * 0.0008; // average step = 0.8m
    double calories = _steps * 0.04; // rough estimate
    
    if (kIsWeb && _steps == 0) {
      // Don't show the widget on web if there's no data
      return SizedBox.shrink();
    }

    return Card(
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn('Steps', '$_steps'),
                _buildStatColumn('Distance', '${distance.toStringAsFixed(2)} km'),
                _buildStatColumn('Calories', calories.toStringAsFixed(0)),
              ],
            ),
            if (kIsWeb) ...[
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _simulateStep,
                child: Text('Simulate Steps'),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text(value, style: TextStyle(fontSize: 20)),
      ],
    );
  }
}
