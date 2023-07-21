class Place{
  late String name;
  late String address;
  late String placeId;


  Place({required this.name,required this.address,required this.placeId
  });
  @override
  String toString(){
    return 'Hospital:{name:$name, address:$address, id:$placeId';
  }

  Place.fromJason(Map<String,dynamic>jason){
    name = jason['name'];
    address = jason['vicinity'];
    placeId = jason['place_id'];
  }



}