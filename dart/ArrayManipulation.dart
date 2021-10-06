void main() {
  final List<int> input = [3, 5, 2, -4, 8, 11];
  const int additional = 7;
  final List<List<int>> result = [];

  for (int i = input.length - 1; i >= 0; i--) {
    for (int j = i - 1; j >= 0; j--) {
      if (input[i] + input[j] == additional) {
        result.add([input[i], input[j]]);
      }
    }
  }

  print(result);
}
