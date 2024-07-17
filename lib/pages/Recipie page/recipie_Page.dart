import 'package:pr_1_recipie_app/headers.dart';

class RecipiePage extends StatefulWidget {
  const RecipiePage({super.key});

  @override
  State<RecipiePage> createState() => _RecipiePageState();
}

class _RecipiePageState extends State<RecipiePage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> recipedetail =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Recipie",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.home);
            },
            icon: const Icon(
              Icons.home,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: s.height * 0.4,
                width: s.width * 0.95,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade300,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(recipedetail['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: s.width,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  recipedetail['name'],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: s.width * 0.4,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Ingredients",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ...List.generate(
                recipedetail['ingredients'].length,
                (index) => Text(recipedetail['ingredients'][index]),
              ).toList(),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: s.width * 0.4,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Instructions",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ...List.generate(
                recipedetail['instructions'].length,
                (index) => Text(recipedetail['instructions'][index]),
              ).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
