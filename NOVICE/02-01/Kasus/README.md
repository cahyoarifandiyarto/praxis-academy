# What you'll learn
* How to write a Fluter app that looks natural on iOS, Android, and the web.
* Basic structure of a Flutter app.
* Finding and using packages to extend functionality.
* Using hot reload for a quicker development cycle.
* How to implement a stateful wigdet.
* How to create an infinite, lazily loaded list.
* Add icons to the list.
* Add interactivity.
* Navigate to a new screen.
* Change the UI using Themes.


# What you'll use
* A physical device(Android or iOS) connected to your computer and set to developer mode.
* The iOS simulator.
* The android emulator.
* A browser (currently Chrome is preferred).


# Step 1: Create the starter Flutter app
1. Replace the contents of lib/main.dart
   ```
   import 'package:flutter/material.dart';

   void main() => runApp(MyApp());

   class MyApp extends StatelessWidget {
       @override
       Widget build(BuildContext context) {
           return MaterialApp(
               title: 'Welcome to Flutter',
               home: Scaffold(
                   appBar: AppBar(
                       title: Text('Welcome to Flutter'),
                   ),
                   body: Center(
                       child: Text('Hello World'),
                   )
               )
           )
       }
   }
    ```
# Step 2: Use an external package
1. The pubspec file manages the assets and dependencies for a Flutter app. In pubspec.yaml, add english_words(3.1.0 or higher) to the dependencies list:
   ```
   dependencies:
    flutter:
       sdk: flutter
    cupertino_icons: ^0.1.2 
    english_words: ^3.1.0

2. While viewing the pubscpec in Android Studio's editor view, click Packages get.
   ```
   $ flutter pub get
   Running "flutter pub get" in startup_namer...
   Process finished with exit code 0
   ```

3. in lib/main.dart, import the new package:
   ```
   import 'package:flutter/material.dart';
   import 'package:english_words/english_words.dart';
   ```

4. Use the English words package to generate the text instead of using the string "Hello World";
   ```
   class MyApp extends StatelessWidget {
       @override
       Widget build(BuildContext context) {
           final wordPair = WordPair.random();
           return MaterialApp(
               title: 'Welcome to Flutter',
               home: Scaffold(
                   appBar: AppBar(
                       title: Text('Welcome to Flutter'),
                   ),
                   body: Center(
                       child: Text('Hello World'),
                       child: Text(wordPair.asPascalCase),
                   )
               )
           )
       }
   }
   ```

# Step 3: Add a Stateful widget
1. Create a minimal state class. Add the following to the bottom of main.dart:
   ```
   class RandomWordsState extends State<RandomWords> {
       // TODO Add build() method
   }
   ```
2. Add the stateful RandomWords widget to main.dart. The RandomWords widget does little else beside creating its State class:
   ```
   class RandomWordsState extends StatefulWidget {
       @override
       RandomWordState createState() => RandomWordState();
   }
   ```
3. Add the build() method to RandomWordState:
   ```
   class RandomWordsState extends State<RandomWords> {
       @override
       Widget build(BuildContext context) {
           final wordPair = WordPair.random();
           return Text(wordPair.asPascalCase);
       }
   }
   ```
4. Remove the word generation code from MyApp by making the changes shown in the following diff:
   ```
   class MyApp extends StatelessWidget {
       @override
       Widget build(BuildContext context) {
           final wordPair = WordPair.random();
           return MaterialApp(
               title: 'Welcome to Flutter',
               home: Scaffold(
                   appBar: AppBar(
                       title: Text('Welcome to Flutter'),
                   ),
                   body: Center(
                       child: RandomWords(),
                   )
               )
           )
       }
   }
   ```
5. Restart the app. The app should behave as before, displaying a word pairing each time you hot reload or save the app.
   
# Step 4: Create an infinite scrolling ListView
1. Add a _suggestions list to the RandomWordState class for saving suggested word pairings. Also, add a _biggerFont variable for making the font size larger.
   ```
   class RandomWordsState extends State<RandomWords> {
       final _suggestions = <WordPair>[];
       final _biggerFont = const TextStyle(fontSize: 18.0);
   }
   ```
2. Add a _buildSuggestions() function to the RandomWordsState class:
   ```
   Widget _buildSuggestions() {
       return ListView.builder(
           padding: const EdgeInsets.all(16.0),
           itemBuilder: (context, i) {
               if (i.isOdd) return Divider();

               final index = i ~/ 2;
               if (index >= _suggestions.length) {
                   _suggestions.addAll(generateWordPairs().take(10));
               }
               return _buildRow(_suggestions[index]);
           }
       );
   }
   ```
3. Add a _buildRow() function to RandomWordsState:
   ```
   Widget _buildRow(WordPair pair) {
       return ListTile(
           title: Text(
               pair.asPascalCase,
               style: _biggerFont,
           ),
       );
   }
   ```
4. In the RandomWordsState class, update the build() method to use _buildSuggestions(), rather than directly calling the word generation library. (Scaffold implements the basic Material Design visual layout.) Replace the method body with the highlighted code:
   ```
   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(
               title: Text('Startup Name Generator'),
           ),
           body: _buildSuggestions(),
       );
   }
   ```
5. In the MyApp class, update the build() method by changing the title, and changing the home to be a RandomWords widget:
   ```
   class MyApp extends StatelessWidget{
       @override
       Widget build(BuildContext context) {
           return MaterialApp(
               title: 'Welcome to Flutter',
               home: Scaffold(
                   title: 'Startup name generator',
                   home: RandomWords(),
                   appBar: AppBar(
                       title: Text('Welcome to Flutter'),
                   ),
                   body: Center(
                    child: RandomWords(),
                   ),
               ),
           );
       }
   }
   ```
6. Restart the app. You should see a list of word pairings no matter how far you scroll.

# Step 5: Add icons to the list
1. Add a _saved Set to RandomWordsState.
    ```
    class RandomWordsState extends State<RandomWords> {
        final List<WordPair> _suggestions = <WordPair>[];
        final Set<WordPair> _saved = Set<WordPair>();
        final TextStyle _biggerFont = TextStyle(fontSize: 18.0);
    }
    ```
2. In the _buildRow function, add an alreadySaved check to ensure that a word pairing has not alreay been added to favorites.
   ```
   Widget _buildRow(WordPair pair) {
       final bool alreadSaved = _saved.contains(pair);
   }
   ```
3. Add the icons, as shown below:
   ```
   Widget _buildRow(WordPair pair) {
       final bool alreadSaved = _saved.contains(pair);
       return ListTile(
           title: Text(
               pair.asPascalCase,
               style: _biggerFont,
           ),
           trailing: Icon(
               alreadySaved ? Icons.favorite : Icons.favorite_border,
               color: alreadySaved ? Colors.red : null,
           ),
       );
   }
   ```

# Step 6: Add Interactivity
1. Add onTap, as shown below:
   ```
   Widget _buildRow(WordPair pair) {
       final alreadySaved = _saved.contains(pair);
       return ListTile(
           title: Text(
               pair.asPascalCase,
               style: _biggerFont,
           ),
           trailing: Icon(
               alreadySaved ? Icons.favorite : Icons.favorite_border,
               color: alreadySaved ? Colors.red : null,
           ),
           onTap: () {
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
   ```

# Step 7: Navigate to a new screen
1. Add the icon and its corresponding action to the build method:
   ```
   class RandomWordsState extends State<RandomWords> {
       ...
       @override
       Widget build(BuildContext context) {
           return Scaffold(
               appBar: AppBar(
                   title: Text('Startup Name Generator'),
                   actions: <Widget>[
                       IconButton(icon: Icon(Icons.list), onPressed: _pushedSave),
                   ],
               ),
               body: _buildSuggestions(),
           );
       }
       ...
   }
   ```
2. Add a _pushSaved() function to the RandomWordsState class.
   ```
   void _pushSaved() {

   }
   ```
3. Call Navigator.push
   ```
   void _pushSaved() {
       Navigator.of(context).push(

       );
   }
   ```
4. Add the code, as shown below:
   ```
   void _pushSaved() {
       Navigator.of(context).push(
           MaterialPageRoute<void>(
               builder: (BuildContext context) {
                   final Iterable<ListTile> tiles = _saved.map(
                       (WordPair pair) {
                           return ListTile(
                               title: Text(
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
               },
           ),
       );
   }
   ```
5. Add horizontal dividers, as shown below:
   ```
   void _pushSaved() {
       Navigator.of(context).push(
           MaterialPageRoute<void>(
               builder: (BuildContext context) {
                   final Iterable<ListTile> tiles = _saved.map(
                       (WordPair pair) {
                           return ListTile(
                               title: Text(
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
                   
                   return Scaffold(
                       appBar: AppBar(
                           title: Text('Saved Suggestions'),
                       ),
                       body: ListView(children: divided),
                   );
               },
           ),
       );
   }
   ```

# Step 8: Change the UI using Themes
1. Change the color in the MyApp class:
   ```
   class MyApp extends StatelessWidget {
       @override
       Widget build(BuildContext context) {
           return MaterialApp(
               title: 'Startup Name Generator',
               theme: ThemeData(
                   primaryColor: Colors.white,
               ),
               home: RandomWords(),
           );
       }
   }