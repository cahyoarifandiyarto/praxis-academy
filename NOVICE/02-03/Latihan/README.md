# Menambahkan assets dan images

1. Membuat direktori images di root direktori.
2. Ubah bagian kode yang terletak di file pubspec.yaml seperti berikut:
   
   ```
   flutter:
    assets:
     - images/image.png
   ```

    atau seperti berikut:

    ```
    flutter:
     assets:
      - images/
    ```

# Navigasi di Flutter
1. Buat dua routes
   ```
   class FirstRoute extends StatelessWidget {
       @override
       Widget build(BuildContext context) {
           return Scaffold(
               appBar: AppBar(
                   title: Text('First Route'),
               ),
               body: Center(
                   child: RaisedButton(
                       child: Text('Open route'),
                       onPressed: () {
                           // fungsi untuk navigasi ke route dua
                       }
                   ),
               ),
           );
       }
   }

   class SecondRoute extends StatelessWidget {
       @override
       Widget build(BuildContext context) {
           return Scaffold(
               appBar: AppBar(
                   title: Text('Second Route'),
               ),
               body: Center(
                   child: RaisedButton(
                       onPressed: () {
                           // fungsi untuk kembali ke route pertama
                       },
                       child: Text('Go back!');
                   ),
               ),
           );
       }
   }
   ```

2. Navigasi ke route dua menggunakan Navigator.push()
   ```
   onPressed: () {
       Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => SecondRoute()),
       )
   }
   ```

3. Kembali ke route pertama menggunakan Navigator.pop()
   ```
   onPressed: () {
       Navigator.pop(context);
   }
   ```

    Sehingga kode nya seperti berikut ini:
    ```
    import 'package:flutter/material.dart';

    void main() {
        runApp(MaterialApp(
            title: 'Navigation Basics',
            home: FirstRoute(),
        ));
    }

    class FirstRoute extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                    title: Text('First Route'),
                ),
                body: Center(
                    child: RaisedButton(
                        child: Text('Open Route'),
                        onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SecondRoute()),
                            );
                        },
                    ),
                ),
            );
        }
    }

    class SecondRoute extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                    title: Text('Second Route'),
                ),
                body: Center(
                    child: RaisedButton(
                        onPressed: () {
                            Navigator.pop(context);
                        },
                        child: Text('Go back!'),
                    ),
                ),
            );
        }
    }
    ```