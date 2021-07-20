import 'package:flutter/material.dart';
import 'root_page.dart';
import 'constants/destinations.dart';

class DestinationView extends StatefulWidget {
  const DestinationView(
      {required this.destination, required this.onNavigation});

  final Destination destination;
  final VoidCallback onNavigation;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      observers: <NavigatorObserver>[
        ViewNavigatorObserver(widget.onNavigation),
      ],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                return RootPage(destination: widget.destination);
              default:
                return RootPage(destination: widget.destination);
            }
          },
        );
      },
    );
  }
}

class ViewNavigatorObserver extends NavigatorObserver {
  ViewNavigatorObserver(this.onNavigation);

  final VoidCallback onNavigation;

  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onNavigation();
  }

  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onNavigation();
  }
}
