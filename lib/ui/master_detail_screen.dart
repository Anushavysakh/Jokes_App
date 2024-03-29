import 'package:app_orientation/model/joke.dart';
import 'package:app_orientation/ui/joke_details.dart';
import 'package:app_orientation/ui/joke_listing.dart';
import 'package:flutter/material.dart';

class MasterDetailScreen extends StatefulWidget {
  @override
  State<MasterDetailScreen> createState() => _MasterDetailScreenState();
}

class _MasterDetailScreenState extends State<MasterDetailScreen> {
  static const int tabletBreakpoint = 600;
  late Joke _selectedJoke;

  Widget _buildMobileLayout() {
    return JokeListing(
      jokeSelectedCallback: (jokeSelected) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return JokeDetails(
            isInTabletLayout: false,
            joke: jokeSelected,
          );
        }),);
      },
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: <Widget>[
        Flexible(
            flex: 1,
            child: Material(
              elevation: 13.0,
              child: JokeListing(
                jokeSelectedCallback: (joke) {
                  setState(() {
                    _selectedJoke = joke;
                  });
                },
                // jokeSelected: _selectedJoke,
              ),
            )),
        Flexible(
          flex: 3,
          child: JokeDetails(
            isInTabletLayout: true,
            joke: _selectedJoke,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortedtSide = MediaQuery.of(context).size.shortestSide;
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait &&
        shortedtSide < tabletBreakpoint) {
      content = _buildMobileLayout();
    } else {
      content = _buildTabletLayout();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokes"),
      ),
      body: content,
    );
  }


}
