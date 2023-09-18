import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/components/exercise/provider_select_muscles.dart';
import 'package:project/components/exercise/tempdata.dart';
import 'package:project/components/workouts/provider_workoutdays.dart';
import 'package:project/data/provider.dart';
import 'package:project/screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/screen/screen_layout.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async{ 
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
); 
  runApp(const MyApp()); 
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>WorkoutDaysProvider()),
        ChangeNotifierProvider(create: (context) =>TempData()), 
        ChangeNotifierProvider(create: (context) =>PrimaryMuscleProvider()),
        ChangeNotifierProvider(create: (context) =>SelectMusclesProvider()),       
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.active) {
              if(snapshot.hasData){
                return const ScreenLayout();
              } else if(snapshot.hasError){
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const LoginPage();
          }
        )
      ),
    );
  }
}
