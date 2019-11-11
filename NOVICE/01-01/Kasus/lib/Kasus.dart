int checkAge(int age) {
  if (age >= 18) {
    print("Silahkan masuk umur anda mencukupi");
    return age;
  } else {
    print("Tidak boleh masuk, umur anda belum mencukupi");
    return null;
  }
}
