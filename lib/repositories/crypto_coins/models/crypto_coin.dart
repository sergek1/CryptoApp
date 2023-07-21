import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable{
  final String name;
  final double priceInUSD;
  final String imageUrl;

  CryptoCoin(
      {required this.imageUrl, required this.name, required this.priceInUSD});

  @override
  List<Object?> get props => [name, priceInUSD, imageUrl];
}
