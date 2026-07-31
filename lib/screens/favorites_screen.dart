import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/movie_card.dart';
class FavoritesScreen extends StatelessWidget {
 const FavoritesScreen({super.key});
 void showClearConfirmation(
   BuildContext context,
   FavoritesProvider provider,
 ) {
   showDialog(
     context: context,
     builder: (dialogContext) {
       return AlertDialog(
         backgroundColor: const Color(0xFF13151D),
         title: const Text('Clear favorites?'),
         content: const Text(
           'This will remove all movies from your favorites.',
         ),
         actions: [
           TextButton(
             onPressed: () {
               Navigator.pop(dialogContext);
             },
             child: const Text('Cancel'),
           ),
           FilledButton(
             onPressed: () {
               provider.clearFavorites();
               Navigator.pop(dialogContext);
               ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(
                   content: Text('All favorites were removed.'),
                 ),
               );
             },
             child: const Text('Clear'),
           ),
         ],
       );
     },
   );
 }
 @override
 Widget build(BuildContext context) {
   return Consumer<FavoritesProvider>(
     builder: (context, favoritesProvider, child) {
       return Scaffold(
         appBar: AppBar(
           title: const Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 'My Favorites',
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                 ),
               ),
               Text(
                 'Your personal watchlist',
                 style: TextStyle(
                   fontSize: 12,
                   color: Colors.white60,
                 ),
               ),
             ],
           ),
           actions: [
             if (favoritesProvider.favoriteMovies.isNotEmpty)
               TextButton.icon(
                 onPressed: () {
                   showClearConfirmation(
                     context,
                     favoritesProvider,
                   );
                 },
                 icon: const Icon(
                   Icons.delete_sweep_outlined,
                   color: Colors.redAccent,
                 ),
                 label: const Text(
                   'Clear',
                   style: TextStyle(
                     color: Colors.redAccent,
                   ),
                 ),
               ),
             const SizedBox(width: 8),
           ],
         ),
         body: Column(
           children: [
             Container(
               width: double.infinity,
               margin: const EdgeInsets.all(16),
               padding: const EdgeInsets.all(18),
               decoration: BoxDecoration(
                 gradient: const LinearGradient(
                   colors: [
                     Color(0xFF0063E5),
                     Color(0xFF073D88),
                   ],
                 ),
                 borderRadius: BorderRadius.circular(18),
               ),
               child: Row(
                 children: [
                   Container(
                     padding: const EdgeInsets.all(13),
                     decoration: BoxDecoration(
                       color: Colors.white.withValues(alpha: 0.15),
                       shape: BoxShape.circle,
                     ),
                     child: const Icon(
                       Icons.favorite,
                       size: 30,
                       color: Colors.white,
                     ),
                   ),
                   const SizedBox(width: 15),
                   const Expanded(
                     child: Text(
                       'Total Favorite Movies',
                       style: TextStyle(
                         fontSize: 17,
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                   ),
                   Text(
                     favoritesProvider.favoriteCount.toString(),
                     style: const TextStyle(
                       fontSize: 35,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ],
               ),
             ),
             Expanded(
               child: favoritesProvider.favoriteMovies.isEmpty
                   ? const EmptyFavorites()
                   : GridView.builder(
                       padding: const EdgeInsets.fromLTRB(
                         16,
                         5,
                         16,
                         25,
                       ),
                       itemCount:
                           favoritesProvider.favoriteMovies.length,
                       gridDelegate:
                           const SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 2,
                         mainAxisSpacing: 18,
                         crossAxisSpacing: 14,
                         childAspectRatio: 0.56,
                       ),
                       itemBuilder: (context, index) {
                         final movie =
                             favoritesProvider.favoriteMovies[index];
                         return MovieCard(movie: movie);
                       },
                     ),
             ),
           ],
         ),
       );
     },
   );
 }
}
class EmptyFavorites extends StatelessWidget {
 const EmptyFavorites({super.key});
 @override
 Widget build(BuildContext context) {
   return Center(
     child: Padding(
       padding: const EdgeInsets.all(30),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
             padding: const EdgeInsets.all(25),
             decoration: const BoxDecoration(
               color: Color(0xFF13151D),
               shape: BoxShape.circle,
             ),
             child: const Icon(
               Icons.favorite_border,
               size: 60,
               color: Color(0xFF0063E5),
             ),
           ),
           const SizedBox(height: 22),
           const Text(
             'No favorite movies yet',
             style: TextStyle(
               fontSize: 21,
               fontWeight: FontWeight.bold,
             ),
           ),
           const SizedBox(height: 8),
           const Text(
             'Tap the heart button on a movie to add it to your favorites.',
             textAlign: TextAlign.center,
             style: TextStyle(
               color: Colors.white60,
               height: 1.5,
             ),
           ),
         ],
       ),
     ),
   );
 }
}