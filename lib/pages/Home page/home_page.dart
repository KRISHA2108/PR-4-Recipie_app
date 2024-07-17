import 'package:pr_1_recipie_app/headers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://cdn.pixabay.com/photo/2014/04/02/17/07/user-307993_640.png",
                ),
              ),
              accountName: Text("KRISHA"),
              accountEmail: Text("krisha123@gmail.com"),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.home,
                  );
                },
                icon: const Icon(
                  Icons.home,
                ),
              ),
              title: const Text(
                "Home",
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.favorite,
                  );
                },
                icon: const Icon(
                  Icons.favorite,
                ),
              ),
              title: const Text(
                "Favorite",
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.recipe,
                  );
                },
                icon: const Icon(
                  Icons.food_bank_outlined,
                ),
              ),
              title: const Text(
                "Recipe",
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Home Page',
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.favorite,
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: s.height * 0.22,
              width: double.infinity,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://thumbs.dreamstime.com/b/vegetarian-recipes-banner-healthy-vegetables-bowl-pan-soup-kitchenware-wooden-surface-57263921.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "All Recipes",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  childAspectRatio: 4 / 7,
                  mainAxisSpacing: 20,
                ),
                itemCount: allRecipies.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.details,
                      arguments: allRecipies[index],
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(5, 5),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image: NetworkImage(
                            allRecipies[index]['image'],
                          ),
                          opacity: const AlwaysStoppedAnimation(0.8),
                        ),
                        SizedBox(
                          height: s.height * 0.01,
                        ),
                        Text(
                          allRecipies[index]['name'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          allRecipies[index]['cuisine'],
                        ),
                        Text(
                          allRecipies[index]['difficulty'],
                        ),
                        RatingBar.builder(
                          initialRating: allRecipies[index]['rating'],
                          minRating: 0.5,
                          direction: Axis.horizontal,
                          itemSize: 20,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {
                              (FavoriteRecipies.contains(allRecipies[index]))
                                  ? FavoriteRecipies.remove(allRecipies[index])
                                  : FavoriteRecipies.add(allRecipies[index]);
                              setState(() {});
                            },
                            icon: FavoriteRecipies.contains(allRecipies[index])
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite,
                                    color: Colors.grey,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
