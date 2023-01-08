import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void  main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to flutter',
      home: RandomWords(),
    );
  }
}



class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggetions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    //the concept is the list expanded if there are not enough number of items.
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        //i the order of item that we re gonna show
        itemBuilder: (BuildContext _context, int i) {
          //Add a one pixel high divider widget before each row
          if (i.isOdd) {
            return Divider();
          }
          final int index = i ~/ 2;//division ; why we devide it
          //if the index is bigger than of what we ve generated we will add 10 more items.
          if (index >= _suggetions.length)
          {
            _suggetions.addAll(generateWordPairs().take(10));
          }
          return _build_Row(_suggetions[index]);
        }
    );
  }

  Widget _build_Row(WordPair pair)
  {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}



