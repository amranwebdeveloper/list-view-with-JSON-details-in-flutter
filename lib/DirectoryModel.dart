class DirectoryModel{
  int? id;
  String? image;
  String? title;
  String? location;
  String? price;
  String? currency;
  String? details;
  DirectoryModel(
      {
    this.id,
        this.image,
        this.title,
        this.details,
        this.location,
        this.price,
        this.currency
    });
  DirectoryModel.fromJson(Map<String, dynamic> json){
    id        =json['id'];
    image     =json['image'];
    title     =json['title'];
    details   =json['details'];
    location  =json['location'];
    price     =json['price'];
    currency  =json['currency'];
  }
}