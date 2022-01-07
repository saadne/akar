class HouseModel {
  String? uid;
  String? region;
  String? city;
  int? price;
  int? rooms;
  int? kitchen;
  int? bathroom;
  int? garage;
  int? surface;
  String? meubler;
  int? floorNumber;
  String? description;
  String? addedBy;

  HouseModel(
      {this.uid,
      this.region,
      this.city,
      this.price,
      this.rooms,
      this.kitchen,
      this.bathroom,
      this.garage,
      this.meubler,
      this.floorNumber,
      this.description,
      // ignore: non_constant_identifier_names
      this.addedBy});

  factory HouseModel.fromMap(map) {
    return HouseModel(
        uid: map['uid'],
        region: map['region'],
        city: map['city'],
        price: map['price'],
        rooms: map['rooms'],
        kitchen: map['kitchen'],
        bathroom: map['bathroom'],
        garage: map['garage'],
        meubler: map['meubler'],
        floorNumber: map['floorNumber'],
        description: map['description'],
        addedBy: map['addedBy']);
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'region': region,
      'city': city,
      'price': price,
      'rooms': rooms,
      'kitchen': kitchen,
      'bathroom': bathroom,
      'garage': garage,
      'meubler': meubler,
      'floorNumber': floorNumber,
      'description': description,
      'addedBy': addedBy
    };
  }
}
