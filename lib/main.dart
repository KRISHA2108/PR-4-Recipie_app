import 'package:pr_1_recipie_app/headers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.home: (context) => const HomePage(),
        Routes.details: (context) => const DetailPage(),
        Routes.recipe: (context) => const RecipiePage(),
        Routes.favorite: (context) => const FavoritePage(),
      },
    );
  }
}
