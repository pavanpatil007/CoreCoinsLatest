class CoinData{
  final String? name;
  final String? symbol;
  final String? image;
  final String? currentPrice;
  final String? priceChangePercentage;
  CoinData({this.name, this.symbol,this.image, this.currentPrice,this.priceChangePercentage

});

  factory CoinData.fromJson(Map<dynamic, dynamic> json) {
    return CoinData(
        name: json['name'].toString(),
        symbol: json['symbol'].toString(),
        image: json['image'].toString(),
        currentPrice: json['current_price'].toString(),
        priceChangePercentage: json['price_change_percentage_24h'].toString(),
    );

  }
}