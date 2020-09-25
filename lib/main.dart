import 'package:Meals_category/meals_specification_data.dart';
import 'package:Meals_category/screens/filters_screen.dart';
import 'package:Meals_category/screens/tab_screen.dart';

import './screens/meals_details_screen.dart';

import './screens/category-meals_screen.dart';
import './screens/category_screen.dart';
import 'package:flutter/material.dart';

import 'models/meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((element) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'African Meals',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline6: TextStyle(
                  fontSize: 18,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
        ),
        // home: CategoryScreen(),
        routes: {
          '/': (context) => TabScreen(),
          CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
          MealsDetailScreen.routeName: (context) => MealsDetailScreen(),
          FiltersScreen.routeName: (context) => FiltersScreen(_setFilters),
        },
        // onGenerateRoute: (settings) {
        //   // used to call a route that is not specified
        //   // print(settings.arguments);
        //   // if(settings.name == '/meal-detail'){
        //   //   return ...;
        //   // }else if(settings.name == '/something-else'){
        //   //   return ...;
        //   // }
        //   // return MaterialPageRoute(builder: (context) => CategoryScreen());
        // },

        // this is reached wen flutter fails to build a screen with all other measure or that the page u want to load does not exist
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) => CategoryScreen());
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('African meals'),
      ),
      body: Center(
        child: Text('Navigation time'),
      ),
    );
  }
}
