//structure
class Movie {
 final int id;
 final String title;
 final String category;
 final String year;
 final String rating;
 final String imageUrl;
 final String description;
 const Movie({
   required this.id,
   required this.title,
   required this.category,
   required this.year,
   required this.rating,
   required this.imageUrl,
   required this.description,
 });
}