


class DetailsList{
  List<BookDetailListItem> detailsList;

  DetailsList({this.detailsList});

  factory DetailsList.fromJSON(Map<dynamic,dynamic> json){
    return DetailsList(
        detailsList: parserecipes(json)
    );
  }

  static List<BookDetailListItem> parserecipes(recipeJSON){
    var rList=recipeJSON['browseRecipes'] as List;
    List<BookDetailListItem> recipeList=rList.map((data) => BookDetailListItem.fromJson(data)).toList();
    return recipeList;
  }
}


class BookDetailListItem {
  String imageUrl;
  String pdf;
  String title;

  BookDetailListItem({this.title,this.pdf,this.imageUrl});




  factory BookDetailListItem.fromJson(Map<dynamic,dynamic> parsedJson) {
//    print(parsedJson);
    return BookDetailListItem(title:parsedJson['title'],pdf: parsedJson['pdf'],imageUrl:parsedJson['image']);
  }




}