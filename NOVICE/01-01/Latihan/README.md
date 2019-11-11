# **Dart Programming Language**
Dart adalah bahasa pemrograman yang dikembangkan oleh Google untuk kebutuhan umum.

Dart bisa digunakan untuk membuat aplikasi mobile, backend dan web aplikasi.

# **Dengan Dart kita bisa membuat apa?**
1. Mobile

    Untuk membuat aplikasi Mobile harus Install Flutter.

2. Web & Server or command line
   
   Untuk Web / Server / Command Line harus install Dart SDK.

# **Install Dart di Linux**

Install using app-get

```
1. sudo apt-get update
2. sudo apt-get install apt-transport-https
3. sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
4. sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
5. sudo apt-get update
6. sudo apt-get install dart

```

Modify PATH for access to all Dart binaries
```
export PATH="$PATH:/usr/lib/dart/bin"
```

# **IDE yang digunakan**
Untuk dart saya menyarankan untuk menggunakan Visual Studio Code dengan extensions Dart.

# **Contoh syntax Dart**
1. Mencetak tulisan "Hello World"

```
void main() {
    print('Hello World!);
}
```

2. Variabel

```
var name = 'Cahyo Arif';
var age = 18;
var hobbies = ['Music', 'Futsal'];
```

3. Control flow statements
   
```
if (age >= 18) {
    print("Umur anda memenuhi syarat untuk mendaftar KTP");
} else {
    print("Umur anda belum memenuhi syarat untuk mendaftar KTP");
}

for (var hobby in hobbies) {
    print(hobby);
}

for (int i = 1; i <= 5; i++) {
    print(i);
}

while (age < 25) {
    age += 1;
}
```

4. Functions
   
```
int checkAge(int age) {
    if (age >= 18) {
        print("Silahkan masuk umur anda mencukupi");
    } else {
        print("Tidak boleh masuk, umur anda belum mencukupi");
    }
}

checkAge(18);
```

5. Comments
   
```
// Komentar satu line.
/* Komentar
Dua
Line */
```

6. Import libraries

```
//Importing core libraries
import 'darth:math';

//Importing libraries from external package
import 'package:test/test.dart';

//Importing files
import 'path/to/my_other_file.dart';
```