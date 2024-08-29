// Reverse each word in the given string without using inbuilt methods
List<String> reverse(List<String> str) {
  int start = 0;
  int end = str.length - 1;
  while (start < end) {
    String temp = str[start];
    str[start] = str[end];
    str[end] = temp;
    start++;
    end--;
  }
  return str;
}

void main() {
  String str = "hello tulasi reddy 654";
  List<String> list = str.split(' ');
  print("Before Reverse: $str");

  List<String> newData = [];

  list.forEach((element) {
    final List<String> tempData = element.split("");
    var val = reverse(tempData);
    newData.add(val.join(""));
  });

  String data = reverse(newData).join(" ");
  print("After Reverse: ${data}");
}
