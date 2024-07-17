import 'package:pr_1_recipie_app/headers.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> recipe =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Detail Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              Navigator.pushNamed(context, Routes.favorite);
            },
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: s.height * 0.4,
                  width: s.width * 0.95,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade300,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(recipe['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                Container(
                  alignment: Alignment.center,
                  width: s.width,
                  height: s.height * 0.05,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    recipe['name'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Prep Time: ${recipe['prepTimeMinutes']} minutes',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Cooking Time: ${recipe['cookTimeMinutes']} minutes',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Total Time :',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " ${(recipe['prepTimeMinutes'] + recipe['cookTimeMinutes'])} minutes",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Servings: ${recipe['servings']}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Difficulty: ${recipe['difficulty']}',
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Cuisine: ${recipe['cuisine']}',
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Calories: ${recipe['caloriesPerServing']}',
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tags :',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                ...List.generate(
                  recipe['tags'].length,
                  (index) => Text(recipe['tags'][index]),
                ).toList(),
                SizedBox(
                  height: s.height * 0.01,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Ingredients :',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                ...List.generate(
                  recipe['ingredients'].length,
                  (index) => Text(recipe['ingredients'][index]),
                ).toList(),
                SizedBox(
                  height: s.height * 0.01,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Instructions :',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                ...List.generate(
                  recipe['instructions'].length,
                  (index) => Text(recipe['instructions'][index]),
                ).toList(),
                SizedBox(
                  height: s.height * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routes.recipe,
            arguments: recipe,
          );
        },
        child: const Icon(
          Icons.food_bank_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
