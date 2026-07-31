//app state
import 'package:flutter/material.dart';
import '../models/movie.dart';
class FavoritesProvider extends ChangeNotifier {
 final List<Movie> _favoriteMovies = [];
 List<Movie> get favoriteMovies => List.unmodifiable(_favoriteMovies);
 int get favoriteCount => _favoriteMovies.length;
 bool isFavorite(Movie movie) {
   return _favoriteMovies.any(
     (favoriteMovie) => favoriteMovie.id == movie.id,
   );
 }
 void addToFavorites(Movie movie) {
   if (!isFavorite(movie)) {
     _favoriteMovies.add(movie);
     notifyListeners();
   }
 }
 void removeFromFavorites(Movie movie) {
   _favoriteMovies.removeWhere(
     (favoriteMovie) => favoriteMovie.id == movie.id,
   );
   notifyListeners();
 }
 void toggleFavorite(Movie movie) {
   if (isFavorite(movie)) {
     removeFromFavorites(movie);
   } else {
     addToFavorites(movie);
   }
 }
 void clearFavorites() {
   _favoriteMovies.clear();
   notifyListeners();
 }
}