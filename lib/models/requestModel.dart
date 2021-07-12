/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
class RequestModel {
  String id_order;
  String phone_user;
  String category;
  String min_price;
  String max_price;
  String min_space;
  String max_space;
  String lat;
  String lng;
  String city;
  String nighborhood;
  String road;
  String type_aqar;
  String interface;
  String plan;
  String age_of_real_estate;
  String apartements;
  String floor;
  String lounges;
  String rooms;
  String stores;
  String street_width;
  String toilets;
  String trees;
  String wells;
  String furnished;
  String kitchen;
  String family;
  String elevater;
  String car_entrance;
  String appendix;
  String celler;
  String driver_room;
  String maid_room;
  String swimming_pool;
  String football_court;
  String volleyball_court;
  String amusement_park;
  String verse;
  String duplex;
  String hall_staircase;
  String conditioner;
  // ignore: sort_constructors_first
  RequestModel({
    this.id_order,
    this.phone_user,
    this.category,
    this.min_price,
    this.max_price,
    this.min_space,
    this.max_space,
    this.lat,
    this.lng,
    this.city,
    this.nighborhood,
    this.road,
    this.type_aqar,
    this.interface,
    this.plan,
    this.age_of_real_estate,
    this.apartements,
    this.floor,
    this.lounges,
    this.rooms,
    this.stores,
    this.street_width,
    this.toilets,
    this.trees,
    this.wells,
    this.furnished,
    this.kitchen,
    this.family,
    this.elevater,
    this.car_entrance,
    this.appendix,
    this.celler,
    this.driver_room,
    this.maid_room,
    this.swimming_pool,
    this.football_court,
    this.volleyball_court,
    this.amusement_park,
    this.verse,
    this.duplex,
    this.hall_staircase,
    this.conditioner,
  });
  // ignore: sort_constructors_first
  RequestModel.fromJson(Map<String, dynamic> json) {
    id_order = json['id_order'];
    phone_user = json['phone_user'];
    category = json['category'];
    min_price = json['min_price'];
    max_price = json['max_price'];
    min_space = json['min_space'];
    max_space = json['max_space'];
    lat = json['lat'];
    lng = json['lng'];
    city = json['city'];
    nighborhood = json['nighborhood'];
    road = json['road'];
    type_aqar = json['type_aqar'];
    interface = json['interface'];
    plan = json['plan'];
    age_of_real_estate = json['age_of_real_estate'];
    apartements = json['apartements'];
    floor = json['floor'];
    lounges = json['lounges'];
    rooms = json['rooms'];
    stores = json['stores'];
    street_width = json['street_width'];
    toilets = json['toilets'];
    trees = json['trees'];
    wells = json['wells'];
    furnished = json['furnished'];
    kitchen = json['kitchen'];
    family = json['family'];
    elevater = json['elevater'];
    car_entrance = json['car_entrance'];
    appendix = json['appendix'];
    celler = json['celler'];
    driver_room = json['driver_room'];
    maid_room = json['maid_room'];
    swimming_pool = json['swimming_pool'];
    football_court = json['football_court'];
    volleyball_court = json['volleyball_court'];
    amusement_park = json['amusement_park'];
    verse = json['verse'];
    duplex = json['duplex'];
    hall_staircase = json['hall_staircase'];
    conditioner = json['conditioner'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_order'] = id_order;
    data['phone_user'] = phone_user;
    data['category'] = category;
    data['min_price'] = min_price;
    data['max_price'] = max_price;
    data['min_space'] = min_space;
    data['max_space'] = max_space;
    data['lat'] = lat;
    data['lng'] = lng;
    data['city'] = city;
    data['nighborhood'] = nighborhood;
    data['road'] = road;
    data['type_aqar'] = type_aqar;
    data['interface'] = interface;
    data['plan'] = plan;
    data['age_of_real_estate'] = age_of_real_estate;
    data['apartements'] = apartements;
    data['floor'] = floor;
    data['lounges'] = lounges;
    data['rooms'] = rooms;
    data['stores'] = stores;
    data['street_width'] = street_width;
    data['toilets'] = toilets;
    data['trees'] = trees;
    data['wells'] = wells;
    data['furnished'] = furnished;
    data['kitchen'] = kitchen;
    data['family'] = family;
    data['elevater'] = elevater;
    data['car_entrance'] = car_entrance;
    data['appendix'] = appendix;
    data['celler'] = celler;
    data['driver_room'] = driver_room;
    data['maid_room'] = maid_room;
    data['swimming_pool'] = swimming_pool;
    data['football_court'] = football_court;
    data['volleyball_court'] = volleyball_court;
    data['amusement_park'] = amusement_park;
    data['verse'] = verse;
    data['duplex'] = duplex;
    data['hall_staircase'] = hall_staircase;
    data['conditioner'] = conditioner;

    return data;
  }
}
