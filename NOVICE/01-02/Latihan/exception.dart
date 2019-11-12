main() {
  try {
    dynamic cahyo = true;
    print(cahyo++);
  } catch (e) {
    print(e);
  } finally {
    print("Default");
  }
}