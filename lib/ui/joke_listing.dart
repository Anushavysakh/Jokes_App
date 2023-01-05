import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/joke.dart';

class JokeListing extends StatelessWidget {

  final ValueChanged<Joke> jokeSelectedCallback;
 // final Joke jokeSelected;

  JokeListing({required this.jokeSelectedCallback, });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jokeList.map((joke){
        return Container(
          child: ListTile(
            title: Text(joke.setup),
            onTap: () =>jokeSelectedCallback(joke),
            // selected: jokeSelected == joke,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.5)
          ),
        );
    }).toList(),
    );
  }
}
