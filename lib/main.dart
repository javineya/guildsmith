import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'destination_view.dart';
import 'constants/destinations.dart';

class GuildSmith extends StatefulWidget {
  @override
  _GuildSmithState createState() => _GuildSmithState();
}

class _GuildSmithState extends State<GuildSmith>
    with TickerProviderStateMixin<GuildSmith> {
  List<Key> _destinationKeys = [];
  List<AnimationController> _faders = [];
  late AnimationController _hide;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _faders =
        allDestinations.map<AnimationController>((Destination destination) {
      return AnimationController(
          vsync: this, duration: Duration(milliseconds: 200));
    }).toList();
    _faders[_currentIndex].value = 1.0;
    _destinationKeys =
        List<Key>.generate(allDestinations.length, (int index) => GlobalKey())
            .toList();
    _hide = AnimationController(vsync: this, duration: kThemeAnimationDuration);
  }

  @override
  void dispose() {
    for (AnimationController controller in _faders) controller.dispose();
    _hide.dispose();
    super.dispose();
  }
  // A feature to auto-hide navBar on scrollable content (save for later)
  // bool _handleScrollNotification(ScrollNotification notification) {
  //   if (notification.depth == 0) {
  //     if (notification is UserScrollNotification) {
  //       final UserScrollNotification userScroll = notification;
  //       switch (userScroll.direction) {
  //         case ScrollDirection.forward:
  //           _hide.forward();
  //           break;
  //         case ScrollDirection.reverse:
  //           _hide.reverse();
  //           break;
  //         case ScrollDirection.idle:
  //           break;
  //       }
  //     }
  //   }
  //   return false;
  // }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      // save this in case you want to add this feature later
      // onNotification: _handleScrollNotification,
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: Stack(
            fit: StackFit.expand,
            children: allDestinations.map((Destination destination) {
              final Widget view = FadeTransition(
                opacity: _faders[destination.index]
                    .drive(CurveTween(curve: Curves.fastOutSlowIn)),
                child: KeyedSubtree(
                  key: _destinationKeys[destination.index],
                  child: DestinationView(
                    destination: destination,
                    onNavigation: () {
                      _hide.forward();
                    },
                  ),
                ),
              );
              if (destination.index == _currentIndex) {
                _faders[destination.index].forward();
                return view;
              } else {
                _faders[destination.index].reverse();
                if (_faders[destination.index].isAnimating) {
                  return IgnorePointer(child: view);
                }
                return Offstage(child: view);
              }
            }).toList(),
          ),
        ),
        bottomNavigationBar: ClipRect(
          child: SizeTransition(
            sizeFactor: _hide,
            axisAlignment: -1.0,
            child: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              selectedIconTheme: IconThemeData(size: 36.0),
              currentIndex: _currentIndex,
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: allDestinations.map(
                (Destination destination) {
                  return BottomNavigationBarItem(
                      icon: Icon(destination.icon),
                      backgroundColor: destination.color,
                      label: destination.title);
                },
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: GuildSmith()));
}
