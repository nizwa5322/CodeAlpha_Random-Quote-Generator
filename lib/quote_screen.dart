import 'dart:math';
import 'package:flutter/material.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final Random random = Random();

  final List<Map<String, String>> quotes = [
    {
      "quote":
          "The future belongs to those who believe in the beauty of their dreams.",
      "author": "Eleanor Roosevelt",
    },
    {
      "quote":
          "Success is not final, failure is not fatal. It is the courage to continue that counts.",
      "author": "Winston Churchill",
    },
    {
      "quote": "Believe you can and you're halfway there.",
      "author": "Theodore Roosevelt",
    },
    {"quote": "Dream big and dare to fail.", "author": "Norman Vaughan"},
    {
      "quote": "Your limitation—it's only your imagination.",
      "author": "Churchill",
    },
    {
      "quote": "Push yourself because no one else is going to do it for you.",
      "author": "Vaughan",
    },
    {
      "quote": "Great things never come from comfort zones.",
      "author": "Winston",
    },
    {"quote": "Don't stop until you're proud.", "author": "Unknown"},
    {
      "quote":
          "The harder you work for something, the greater you'll feel when you achieve it.",
      "author": "Unknown",
    },
    {"quote": "Every day is a second chance.", "author": "Roosevelt"},
  ];

  late Map<String, String> currentQuote;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    generateQuote();
  }

  void generateQuote() {
    int newIndex;

    do {
      newIndex = random.nextInt(quotes.length);
    } while (newIndex == currentIndex);

    currentIndex = newIndex;

    setState(() {
      currentQuote = quotes[currentIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff4A00E0), Color(0xff8E2DE2), Color(0xff00C9FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 20),

                const Icon(Icons.auto_awesome, color: Colors.white, size: 70),

                const SizedBox(height: 15),

                const Text(
                  "Quote of the Moment",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 50),

                Expanded(
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.format_quote,
                            color: Colors.white,
                            size: 45,
                          ),

                          const SizedBox(height: 20),

                          Text(
                            currentQuote["quote"]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontStyle: FontStyle.italic,
                              height: 1.5,
                            ),
                          ),

                          const SizedBox(height: 30),

                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "- ${currentQuote["author"]}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.deepPurple,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: generateQuote,
                    icon: const Icon(Icons.refresh),
                    label: const Text(
                      "New Quote",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
