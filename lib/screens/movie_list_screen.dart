import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';
class MovieListScreen extends StatelessWidget {
 const MovieListScreen({super.key});
 static const List<Movie> movies = [
   Movie(
     id: 1,
     title: 'Frozen II',
     category: 'Animation • Adventure',
     year: '2019',
     rating: 'PG',
     imageUrl:
         'https://image.tmdb.org/t/p/w500/mINJaa34MtknCYl5AjtNJzWj8cD.jpg',
     description:
         'Elsa travels beyond Arendelle to discover the truth about her powers.',
   ),
   Movie(
     id: 2,
     title: 'Moana',
     category: 'Animation • Adventure',
     year: '2016',
     rating: 'PG',
     imageUrl:
         'https://image.tmdb.org/t/p/w500/9tzN8sPbyod2dsa0lwuvrwBDWra.jpg',
     description:
         'A brave young girl sails across the ocean to save her island.',
   ),
   Movie(
     id: 3,
     title: 'The Lion King',
     category: 'Animation • Drama',
     year: '2019',
     rating: 'PG',
     imageUrl:
         'https://image.tmdb.org/t/p/w500/dzBtMocZuJbjLOXvrl4zGYigDzh.jpg',
     description:
         'Simba must accept his responsibility as the rightful king.',
   ),
   Movie(
     id: 4,
     title: 'Encanto',
     category: 'Animation • Fantasy',
     year: '2021',
     rating: 'PG',
     imageUrl:
         'https://image.tmdb.org/t/p/w500/4j0PNHkMr5ax3IA8tjtxcmPU3QT.jpg',
     description:
         'A Colombian family receives magical gifts, except for Mirabel.',
   ),
   Movie(
     id: 5,
     title: 'Raya and the Last Dragon',
     category: 'Animation • Action',
     year: '2021',
     rating: 'PG',
     imageUrl:
         'https://image.tmdb.org/t/p/w500/lPsD10PP4rgUGiGR4CCXA6iY0QQ.jpg',
     description:
         'Raya searches for the last dragon to reunite her divided land.',
   ),
   Movie(
     id: 6,
     title: 'Coco',
     category: 'Animation • Family',
     year: '2017',
     rating: 'PG',
     imageUrl:
         'https://image.tmdb.org/t/p/w500/gGEsBPAijhVUFoiNpgZXqRVWJt2.jpg',
     description:
         'Miguel enters the Land of the Dead to discover his family history.',
   ),
   Movie(
     id: 7,
     title: 'Toy Story 4',
     category: 'Animation • Comedy',
     year: '2019',
     rating: 'G',
     imageUrl:
         'https://image.tmdb.org/t/p/w500/w9kR8qbmQ01HwnvK4alvnQ2ca0L.jpg',
     description:
         'Woody and his friends begin a new adventure with Forky.',
   ),
   Movie(
     id: 8,
     title: 'Luca',
     category: 'Animation • Fantasy',
     year: '2021',
     rating: 'PG',
     imageUrl:
         'https://image.tmdb.org/t/p/w500/8tABCBpzu3mZbzMB3sRzMEHEvJi.jpg',
     description:
         'Two sea monsters experience an unforgettable summer in Italy.',
   ),
   Movie(
     id: 9,
     title: 'Turning Red',
     category: 'Animation • Comedy',
     year: '2022',
     rating: 'PG',
     imageUrl:
         'https://image.tmdb.org/t/p/w500/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg',
     description:
         'A teenager transforms into a giant red panda when emotional.',
   ),
   Movie(
     id: 10,
     title: 'Big Hero 6',
     category: 'Animation • Action',
     year: '2014',
     rating: 'PG',
     imageUrl:
         'https://image.tmdb.org/t/p/w500/2mxS4wUimwlLmI1xp6QW6NSU361.jpg',
     description:
         'A young inventor and his robot form a team of superheroes.',
   ),
 ];
 @override
 Widget build(BuildContext context) {
   return CustomScrollView(
     slivers: [
       SliverAppBar(
         expandedHeight: 215,
         pinned: true,
         backgroundColor: const Color(0xFF040714),
         flexibleSpace: FlexibleSpaceBar(
           background: Container(
             decoration: const BoxDecoration(
               gradient: LinearGradient(
                 begin: Alignment.topRight,
                 end: Alignment.bottomLeft,
                 colors: [
                   Color(0xFF0063E5),
                   Color(0xFF0E2A5A),
                   Color(0xFF040714),
                 ],
               ),
             ),
             child: SafeArea(
               child: Padding(
                 padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Row(
                       children: [
                         Icon(
                           Icons.auto_awesome,
                           color: Colors.white,
                           size: 30,
                         ),
                         SizedBox(width: 8),
                         Text(
                           'Disney+',
                           style: TextStyle(
                             fontSize: 28,
                             fontWeight: FontWeight.bold,
                             letterSpacing: 1,
                           ),
                         ),
                       ],
                     ),
                     const Spacer(),
                     const Text(
                       'Movies for every moment',
                       style: TextStyle(
                         fontSize: 23,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     const SizedBox(height: 6),
                     Text(
                       'Choose a movie and add it to your favorites.',
                       style: TextStyle(
                         color: Colors.white.withValues(alpha: 0.75),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
         ),
       ),
       SliverPadding(
         padding: const EdgeInsets.fromLTRB(16, 22, 16, 20),
         sliver: SliverToBoxAdapter(
           child: Row(
             children: [
               Container(
                 width: 4,
                 height: 25,
                 decoration: BoxDecoration(
                   color: const Color(0xFF0063E5),
                   borderRadius: BorderRadius.circular(10),
                 ),
               ),
               const SizedBox(width: 10),
               const Text(
                 'Recommended for You',
                 style: TextStyle(
                   fontSize: 21,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ],
           ),
         ),
       ),
       SliverPadding(
         padding: const EdgeInsets.fromLTRB(16, 0, 16, 25),
         sliver: SliverGrid(
           delegate: SliverChildBuilderDelegate(
             (context, index) {
               return MovieCard(movie: movies[index]);
             },
             childCount: movies.length,
           ),
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             mainAxisSpacing: 18,
             crossAxisSpacing: 14,
             childAspectRatio: 0.56,
           ),
         ),
       ),
     ],
   );
 }
}