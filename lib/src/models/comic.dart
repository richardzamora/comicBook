class Comic{

  String imageUrl;
  String date;
  String name;
  Comic({this.imageUrl, this.date, this.name});

  @override
  String toString() {
  return 'name: $name  - date: $date  - imageUrl: $imageUrl';
   }
}