import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}


class RandomWordsState extends State<RandomWords> with TickerProviderStateMixin {

  late TabController _controller ;
  final List<Tab> topTabs = <Tab>[
    new Tab(text: 'Home',icon: Icon(Icons.directions_car)),
    new Tab(text: 'Match',icon: Icon(Icons.directions_transit)),
    new Tab(text: 'Chat',icon: Icon(Icons.directions_bike)),
  ];

  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);


  @override
  void initState() {
    super.initState();

    _controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    /*final WordPair wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);*/
    return new Scaffold (
      appBar: new AppBar(
        bottom: TabBar(
          controller: _controller,
          tabs: topTabs/*[
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ]*/,
        ),
        title: new Text('Startup Name Generator'),
        actions: <Widget>[new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body:TabBarView(
          controller: _controller,
          children: [
            new Container(
              color: Colors.lightBlueAccent,
              child: _buildSuggestions(),
            ),
            new Container(
              color: Colors.purpleAccent,
              child: Center(child: Text('Match', style: TextStyle(color: Colors.white),),),
            ),
            new Container(
              color: Colors.lightGreenAccent,
              child: Center(child: Text('Chat', style: TextStyle(color: Colors.white),),),
            )
          ]),

      /*_buildSuggestions(),*/
    );
  }


  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),

        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return new Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),

      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),

      onTap:(){
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },

    );
  }



  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
                (WordPair pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();

          return new Scaffold(
            appBar: new AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

}








