import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/movie.dart';
import '../providers/favorites_provider.dart';
class MovieCard extends StatelessWidget {
 final Movie movie;
 const MovieCard({
   super.key,
   required this.movie,
 });
 @override
 Widget build(BuildContext context) {
   final favoritesProvider = Provider.of<FavoritesProvider>(context);
   final bool isFavorite = favoritesProvider.isFavorite(movie);
   return Container(
     decoration: BoxDecoration(
       color: const Color(0xFF13151D),
       borderRadius: BorderRadius.circular(14),
       border: Border.all(
         color: isFavorite
             ? const Color(0xFF0063E5)
             : Colors.white.withValues(alpha: 0.08),
         width: isFavorite ? 1.5 : 1,
       ),
       boxShadow: [
         BoxShadow(
           color: Colors.black.withValues(alpha: 0.3),
           blurRadius: 12,
           offset: const Offset(0, 6),
         ),
       ],
     ),
     clipBehavior: Clip.antiAlias,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Expanded(
           child: Stack(
             fit: StackFit.expand,
             children: [
               Image.network(
                 movie.imageUrl,
                 fit: BoxFit.cover,
                 errorBuilder: (context, error, stackTrace) {
                   return Container(
                     decoration: const BoxDecoration(
                       gradient: LinearGradient(
                         begin: Alignment.topLeft,
                         end: Alignment.bottomRight,
                         colors: [
                           Color(0xFF0063E5),
                           Color(0xFF0E2A5A),
                         ],
                       ),
                     ),
                     child: const Center(
                       child: Icon(
                         Icons.movie,
                         size: 55,
                         color: Colors.white,
                       ),
                     ),
                   );
                 },
               ),
               Positioned(
                 top: 8,
                 right: 8,
                 child: Material(
                   color: Colors.black.withValues(alpha: 0.65),
                   shape: const CircleBorder(),
                   child: IconButton(
                     onPressed: () {
                       favoritesProvider.toggleFavorite(movie);
                       final message = isFavorite
                           ? '${movie.title} removed from favorites'
                           : '${movie.title} added to favorites';
                       ScaffoldMessenger.of(context)
                         ..hideCurrentSnackBar()
                         ..showSnackBar(
                           SnackBar(
                             duration: const Duration(seconds: 1),
                             content: Text(message),
                           ),
                         );
                     },
                     icon: Icon(
                       isFavorite
                           ? Icons.favorite
                           : Icons.favorite_border,
                       color: isFavorite
                           ? Colors.redAccent
                           : Colors.white,
                     ),
                   ),
                 ),
               ),
               Positioned(
                 bottom: 8,
                 left: 8,
                 child: Container(
                   padding: const EdgeInsets.symmetric(
                     horizontal: 8,
                     vertical: 4,
                   ),
                   decoration: BoxDecoration(
                     color: Colors.black.withValues(alpha: 0.75),
                     borderRadius: BorderRadius.circular(5),
                   ),
                   child: Text(
                     movie.rating,
                     style: const TextStyle(
                       fontSize: 11,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
               ),
             ],
           ),
         ),
         Padding(
           padding: const EdgeInsets.fromLTRB(11, 11, 11, 4),
           child: Text(
             movie.title,
             maxLines: 1,
             overflow: TextOverflow.ellipsis,
             style: const TextStyle(
               fontSize: 15,
               fontWeight: FontWeight.bold,
             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 11),
           child: Text(
             '${movie.year} • ${movie.category}',
             maxLines: 1,
             overflow: TextOverflow.ellipsis,
             style: const TextStyle(
               color: Colors.white60,
               fontSize: 10,
             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.fromLTRB(11, 7, 11, 11),
           child: SizedBox(
             width: double.infinity,
             child: FilledButton.icon(
               onPressed: () {
                 favoritesProvider.toggleFavorite(movie);
               },
               style: FilledButton.styleFrom(
                 backgroundColor: isFavorite
                     ? const Color(0xFF252833)
                     : const Color(0xFF0063E5),
                 padding: const EdgeInsets.symmetric(vertical: 9),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(7),
                 ),
               ),
               icon: Icon(
                 isFavorite
                     ? Icons.check
                     : Icons.add,
                 size: 17,
               ),
               label: Text(
                 isFavorite ? 'Added' : 'Favorite',
                 style: const TextStyle(
                   fontSize: 12,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
           ),
         ),
       ],
     ),
   );
 }
}