import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import 'favorites_screen.dart';
import 'movie_list_screen.dart';
class HomeScreen extends StatefulWidget {
 const HomeScreen({super.key});
 @override
 State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
 int selectedIndex = 0;
 final List<Widget> pages = const [
   MovieListScreen(),
   FavoritesScreen(),
 ];
 void changePage(int index) {
   setState(() {
     selectedIndex = index;
   });
 }
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: IndexedStack(
       index: selectedIndex,
       children: pages,
     ),
     bottomNavigationBar: Consumer<FavoritesProvider>(
       builder: (context, favoritesProvider, child) {
         return NavigationBar(
           backgroundColor: const Color(0xFF090B13),
           indicatorColor: const Color(0xFF0063E5),
           selectedIndex: selectedIndex,
           onDestinationSelected: changePage,
           destinations: [
             const NavigationDestination(
               icon: Icon(Icons.movie_outlined),
               selectedIcon: Icon(Icons.movie),
               label: 'Movies',
             ),
             NavigationDestination(
               icon: Badge(
                 isLabelVisible: favoritesProvider.favoriteCount > 0,
                 label: Text(
                   favoritesProvider.favoriteCount.toString(),
                 ),
                 child: const Icon(Icons.favorite_border),
               ),
               selectedIcon: Badge(
                 isLabelVisible: favoritesProvider.favoriteCount > 0,
                 label: Text(
                   favoritesProvider.favoriteCount.toString(),
                 ),
                 child: const Icon(Icons.favorite),
               ),
               label: 'Favorites',
             ),
           ],
         );
       },
     ),
   );
 }
}