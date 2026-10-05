import 'package:flutter/material.dart';

String formatPrice(double price) {
  return '\$${price.toStringAsFixed(2)}';
}

double applyDiscount(double price, double percentOff) {
  return price * (1 - percentOff / 100);
}

// void main() {
//   print(formatPrice(12.9)); // expect: $12.90
//   print(applyDiscount(20.0, 25)); // expect: 15.0
// }

class Book {
  // Four fields
  String title;
  String author;
  double price;
  bool isAvailable;

  // Default constructor
  Book({
    required this.title,
    required this.author,
    required this.price,
    this.isAvailable = true,
  });

  // Named constructor for free samples
  Book.freeSample(this.title, this.author) : price = 0.0, isAvailable = true;

  String getSummary() {
    return '$title by $author — ${formatPrice(price)}';
  }

  void toggleAvailability() {
    isAvailable = !isAvailable;
  }
}

// void main() {
//   Book b1 = Book(
//     title: "Dart Basics",
//     author: "Jane Doe",
//     price: 12.99,
//   );
//
//   Book b2 = Book.freeSample("Flutter Taster", "Sam Lee");
//
//   print(b1.getSummary());
//   print(b2.getSummary());
//
//   b2.toggleAvailability();
//
//   print(b2.isAvailable);
// }

double calculateTotalValue(List<Book> books) {
  double total = 0.0;

  for (Book book in books) {
    if (book.isAvailable) {
      total += book.price;
    }
  }

  return total;
}

// void main() {
//   List<Book> catalog = [
//     Book(
//       title: "How to Flutter Like a Real G",
//       author: "Isaiah Rivera",
//       price: 12.99,
//     ),
//     Book(
//       title: "Network Programming for Dummies",
//       author: "That Guy",
//       price: 19.99,
//     ),
//     Book(
//       title: "Basics to Operating Systems Programming",
//       author: "Chao Zhao",
//       price: 15.50,
//     ),
//     Book(
//       title: "The Auto-Updating Flutter Docs Book",
//       author: "Insane Being",
//       price: 24.99,
//     ),
//     Book.freeSample("Flutter Taster", "Sam Lee"),
//   ];
//
//   for (Book b in catalog) {
//     print(b.getSummary());
//   }
//
//   double total = calculateTotalValue(catalog);
//   print("Total catalog value: ${formatPrice(total)}");
// }

void main() => runApp(const BookNookApp());

class BookNookApp extends StatelessWidget {
  const BookNookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BookListScreen());
  }
}

class BookListScreen extends StatelessWidget {
  BookListScreen({super.key});

  final List<Book> catalog = [
    Book(
      title: "How to Flutter Like a Real G",
      author: "Isaiah Rivera",
      price: 12.99,
    ),
    Book(
      title: "Network Programming for Dummies",
      author: "That Guy",
      price: 19.99,
    ),
    Book(
      title: "Basics to Operating Systems Programming",
      author: "Chao Zhao",
      price: 15.50,
    ),
    Book(
      title: "The Auto-Updating Flutter Docs Book",
      author: "Insane Being",
      price: 24.99,
    ),
    Book.freeSample("Flutter Taster", "Sam Lee"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Nook")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "Total catalog value: ${formatPrice(calculateTotalValue(catalog))}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: catalog.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(catalog[index].getSummary()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
