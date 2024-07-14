import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: MyRouterDelegate(),
      routeInformationParser: MyRouteInformationParser(),
    );
  }
}

class MyRoutePath {
  String? id;
  MyRoutePath.home() : this.id = null;
  MyRoutePath.detail(this.id);
}

class MyRouteInformationParser extends RouteInformationParser<MyRoutePath> {
  @override
  Future<MyRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '/');
    if(uri.pathSegments.length >= 2) {
      var remaining = uri.pathSegments[1];
      return MyRoutePath.detail(remaining);
    }else{
      return MyRoutePath.home();
    }
  }

  @override
  RouteInformation restoreRouteInformation(MyRoutePath configuration) {
    if(configuration.id != null)
      return RouteInformation(location: '/detail/${configuration.id}');
    else
      return RouteInformation(location: '/');
  }
}

class MyRouterDelegate extends RouterDelegate<MyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath> {
  String? selectedId;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  MyRoutePath get currentConfiguration {
    if(selectedId != null)
      return MyRoutePath.detail(selectedId);
    else
      return MyRoutePath.home();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(child: HomeScreen(_handleOnPressed)),
        if(selectedId != null) MaterialPage(child: DetailScreen(selectedId))
      ],
      onPopPage: (route, result) {
        if(!route.didPop(result)) {
          return false;
        }
        selectedId = null;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(MyRoutePath configuration) async {
    if(configuration.id != null)
      selectedId = configuration.id;
  }
  void _handleOnPressed(String id) {
    selectedId = id;
    notifyListeners();
  }
}

class HomeScreen extends StatelessWidget {
  final ValueChanged<String> onPressed;

  HomeScreen(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Home Screen', style: TextStyle(color: Colors.white, fontSize: 30),),
              ElevatedButton(
                child: Text('on detail with 1'),
                onPressed: () => onPressed('1'),
              ),
              ElevatedButton(
                child: Text('on detail with 2'),
                onPressed: () => onPressed('2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  String? id;

  DetailScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.green,
        child: Center(
          child: Text('Detail Screen $id', style: TextStyle(color: Colors.white, fontSize: 30,),),
        ),
      ),
    );
  }
}