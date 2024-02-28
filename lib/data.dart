class Article {
  final String title;
  final String image;
  final String location;
  final String author;
  final int likes;
  final int comments;
  final int shares;
  final int ratting;
  bool isLiked = false;

  Article(this.title, this.image, this.comments, this.likes, this.isLiked,
      this.location, this.shares, this.author,this.ratting);
}

List<Article> articles = [
  Article(
      'Japan\'s second largest metropolitan area',
      'https://sakura.co/wp-content/uploads/2023/03/Sakuraco_osaka6-1.jpg',
      100,
      32000,
      true,
      'Osaka Japan',
      50,
      'Hussain Mustafa',4),
  Article(
      'Known as the sleepless town for obvious reasons',
      'https://cdn.cheapoguides.com/wp-content/uploads/sites/2/2023/06/Kabukicho-Street_Aimee-Gardner-1024x600.jpg',
      300,
      50000,
      true,
      'Kabuikicho Japan',
      1250,
      'Tim Salvatore',3),
  Article(
      'Japan\'s second largest metropolitan area',
      'https://i.insider.com/5d264d1fb44ce765c0045293?width=700',
      200,
      10000,
      true,
      'Tokyo Japan',
      1000,
      'Ely Marya',2),
];
