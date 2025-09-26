import 'package:flutter/material.dart';
import 'package:plantio/wigets/topCategorySection.dart';

class SpeciesScreen extends StatefulWidget {
  const SpeciesScreen({super.key});

  @override
  State<SpeciesScreen> createState() => _SpeciesScreenState();
}

class _SpeciesScreenState extends State<SpeciesScreen> {
  final Map<String, List<String>> plantsByAlphabet = {
    'A': [
      'Ageratum',
      'Alchemilla',
      'Allium',
      'Alstroemeria',
      'Amaranthus',
      'Anemone',
    ],
    'B': [
      "Baby's Breath",
      'Begonia',
      'Bellflower',
      'Bird of Paradise',   
    ],
    'C': [
      'Calendula',
      'California Poppy',
      'Camellia',
      'Cosmos',
      'Crocosmia',
      'Cyclamen',
    ],
    'D': [
      'Daffodil',
      'Dahlia',
      'Daisy',
      'Delphinium',
      'Dianthus',
      'Dusty Miller',
    ],
    'E': [
      'Eaffodil',
      'Eahlia',
      'Eaisy',
      'Eelphinium',
      'Eianthus',
      'Eusty Miller',
    ],
  };

  final Map<String, GlobalKey> _headerKeys = {};

  String query = "";

  @override
  void initState() {
    super.initState();
    // create GlobalKeys for all possible letters up front
    for (final letter in plantsByAlphabet.keys) {
      _headerKeys[letter] = GlobalKey();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, List<String>> filtered = {};
    plantsByAlphabet.forEach((letter, list) {
      final results = list
          .where((p) => p.toLowerCase().contains(query.toLowerCase()))
          .toList();
      if (results.isNotEmpty) filtered[letter] = results;
    });

    final List<String> letters = filtered.keys.toList();

    return Scaffold(
      body: Column(
        children: [
          // Top header + floating search bar (passes the query to this screen)
          TopCategorySection(title:"Species", onSearchChanged: (val) {
            setState(() {
              query = val;
            });
          }),
      
          const SizedBox(height: 10),
      
          // List + right-side index overlayed
          Expanded(
            child: Stack(
              children: [
                // Main grouped list
                ListView.builder(
                  padding: const EdgeInsets.only(bottom: 24),
                  itemCount: letters.length,
                  itemBuilder: (context, index) {
                    final letter = letters[index];
                    final plants = filtered[letter]!;
      
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Section header with GlobalKey so we can scroll to it
                        KeyedSubtree(
                          key: _headerKeys[letter],
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            color: Colors.transparent,
                            child: Text(
                              letter,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.green, 
                              ),
                            ),
                          ),
                        ),
      
                        // Items under each section
                        ...plants.map((plant) {
                          return ListTile(
                            title: Text(plant),
                            dense: true,
                          );
                        }).toList(),
                      ],
                    );
                  },
                ),
      
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: letters.map((letter) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            final ctx = _headerKeys[letter]?.currentContext;
                            if (ctx != null) {
                              // Scroll so header sits at top of the list's viewport.
                              Scrollable.ensureVisible(
                                ctx,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                alignment: 0.0,
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 6),
                            child: Text(
                              letter,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
