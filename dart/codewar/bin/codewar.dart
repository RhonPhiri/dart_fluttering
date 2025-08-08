void main() {
  StringBuffer buffer = StringBuffer();
  for (var a = 0; a < 10; a++) {
    for (var b = 0; b < 10; b++) {
      b == a ? buffer.write(" ") : buffer.write("*");
    }
    print(buffer.toString());
    buffer.clear();
  }
}
