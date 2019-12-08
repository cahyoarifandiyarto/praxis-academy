# Profiling Kinerja Aplikasi

Koneksikan dengan physical device, Jalankan dengan mode profil
```
flutter run --track-widget-creation --trace-startup --profile
```
Mode profil tidak bisa dijalankan di emulator dan simulator. Jalankan DevTools pada Google Chrome. Jika frame render di bawah 16ms maka tidak perlu khawatir dengan performa.