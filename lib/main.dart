import 'package:flutter/material.dart';
import 'package:fluterprojet/pages/home_page.dart';
import 'package:fluterprojet/pages/event_page.dart';
import 'package:fluterprojet/pages/add_event_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void  main() async{
  //initialisation de toutes les dependance ratacher a notre projet
  WidgetsFlutterBinding.ensureInitialized();
  //initialisation de firebase en fonction de la plateforme sur laquelle on se trouve
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //methode pour changer de page
  int _currentIndex=0;
  setCurrentIndex(int index){
    setState((){
      _currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:[
            const Text("Accueil",
            style:TextStyle(color: Colors.white,
              fontFamily: 'Montseraat',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
            const Text("Liste des variete",
              style:TextStyle(color: Colors.white,
                fontFamily: 'Montseraat',
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("Formulaire",
              style:TextStyle(color: Colors.white,
                fontFamily: 'Montseraat',
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ][_currentIndex],

          backgroundColor: Colors.blue,
        ),
        body: [
          HomePage(),
          EventPage(),
          AddEventPage(),
        ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex:_currentIndex,
            onTap:(index)=>setCurrentIndex(index),
            type: BottomNavigationBarType.fixed,
            selectedItemColor:Colors.green,
            unselectedItemColor:Colors.grey,
            unselectedFontSize: 16,
            selectedFontSize: 17,
            iconSize:32,
            elevation:12,
            items:const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label:"Accueil"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month),
                  label:"variete"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label:"Ajout"
              ),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.search),
              //     label:"Recherche"
              // )
            ]
        ),


      ),
    );
  }
}

