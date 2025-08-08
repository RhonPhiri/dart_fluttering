void recordExercises() {
  // print(logSensorData("12", 21));
  // print(logSensorData("1400", 42));
  // print(logSensorData("132", 10));

  // final (:name, :age, :city) = parseCsvLine("Alice,30,LL");
  // print("$name is $age years old. She lives in $city City");
  // printInStockProducts(productList);
  // sortOrderRecords(orderList);
  //
  //Test all five cases: (0,0), (3,0), (0,-4), (5,6), (-2,3).
  print(describePoint(-2, 3.4));
}

// 1. Sensor Data Logger
// Write a function logSensorData that takes a sensor ID (String), a value (double), and automatically stamps it with the current timestamp. Have it return a positional record:
// (DateTime timestamp, String sensorId, double value)
// Task: Call it three times with different fake sensors and print each record’s fields.
typedef SensorData = ({DateTime timestamp, String sensorId, double value});
SensorData logSensorData(String id, double value) {
  return (timestamp: DateTime.timestamp(), sensorId: id, value: value);
}

// 2. CSV Line Parser
// Given a line from a CSV file in the format "name,age,city", write a function parseCsvLine(String line) that returns a named record:
// ({ String name, int age, String city })
//     Task: Parse "Alice,30,Paris", then print Alice is 30 years old and lives in Paris.
typedef CVSData = ({String name, int age, String city});
CVSData parseCsvLine(String line) {
  final cvsParts = line.split(",");
  return (
    name: cvsParts.first,
    age: int.parse(cvsParts[1]),
    city: cvsParts.last,
  );
}

// 3. E‑Commerce Product
// Model an e‑commerce product using a mixed record:
// (int id, String name, { double price, bool inStock })
//     Task:
//         Create a List of 3 products.
//         Write a function printInStockProducts that takes that list, filters by inStock == true, and prints each product’s name and price.
typedef Product = (int id, String name, {double price, bool inStock});

final List<Product> productList = [
  (1, "Bic Pen", price: 499.99, inStock: true),
  (2, "Hardcover NoteBook", price: 2_999.99, inStock: false),
  (3, "Stationary Paper", price: 10_000.00, inStock: true),
  (4, "Laptop Bag", price: 34_999.00, inStock: false),
  (5, "Id Holder", price: 1_499.99, inStock: true),
];

void printInStockProducts(List<Product> products) {
  for (var product in products) {
    if (product.inStock) {
      print("${product.$2}: K${product.price}");
    }
  }
}

// 4. Record‑Based Sorting
// Given a list of orders, each as a named record:
// ({ int orderId, DateTime date, double total })
//     Task:
//         Create at least 5 sample orders with varying dates/totals.
//         Sort them ascending by date, then descending by total for orders on the same day.
//         Print a nicely formatted list:
// Order 42 — 2025‑07‑20 — $123.45\
typedef Order = ({int orderId, DateTime date, double total});

final List<Order> orderList = [
  (orderId: 1, date: DateTime(2025, 7, 24), total: 2_499.99),
  (orderId: 2, date: DateTime(2025, 7, 25), total: 4_499.99),
  (orderId: 3, date: DateTime(2025, 7, 26), total: 11_999.99),
  (orderId: 4, date: DateTime(2025, 7, 21), total: 3_299.99),
  (orderId: 5, date: DateTime(2025, 7, 25), total: 4_699.99),
];

void sortOrderRecords(List<Order> orderList) {
  orderList.sort((a, b) => a.date.compareTo(b.date));
  for (var order in orderList) {
    print("Order ${order.orderId} - ${order.date} - K${order.total}");
  }
}

// Pattern Matching with Records
// Using Dart’s switch‑case on records, write a function describePoint that takes a 2D point record:
// (double x, double y)
// and returns a String:
//     If both x and y are 0.0: "Origin".
//     If only one is zero: "On X axis" or "On Y axis".
//     Otherwise: "Quadrant I/II/III/IV" as appropriate.
//     Task:
//         Implement describePoint with record patterns.
//         Test all five cases: (0,0), (3,0), (0,-4), (5,6), (-2,3).
String describePoint(double x, double y) {
  return switch ((x, y)) {
    (0, 0) => "Origin",
    (0, < 0 || > 0) => "On Y axis",
    (< 0 || > 0, 0) => "On X axis",
    (> 0, > 0) => "Quadrant I",
    (< 0, > 0) => "Quadrant II",
    (< 0, < 0) => "Quadrant III",
    (> 0, < 0) => "Quadrant IV",
    _ => "Math Error",
  };
}
