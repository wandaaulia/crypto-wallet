class Coin {
  String id;
  String? name;
  String? nameBase;
  String? imgLarge;
  double? market_rank;
  double? current_price;
  double? price_change_24h;
  double? total_suply;
  double? max_suply;
  

  Coin({required this.id, this.name, this.nameBase, this.imgLarge, this.market_rank,this.current_price, this.price_change_24h, this.total_suply, this.max_suply});

  factory Coin.getDetailCoin(Map<String, dynamic> object) {

    return Coin(
      id: object['id'],
      name: object['name'],
      nameBase: object['symbol'],
      imgLarge: object["image"]["large"],
      market_rank: object["market_cap_rank"],
      current_price: object["market_data"]["current_price"]["idr"],
      price_change_24h: object["market_data"]["price_change_percentage_24h"],
      total_suply: object["market_data"]["total_suply"],
      max_suply: object["market_data"]["max_supply"],
    );


  }}

  