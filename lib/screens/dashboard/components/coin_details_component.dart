
import 'package:admin/models/CoinData.dart';
import 'package:flutter/material.dart';

class CoinDetailsComponent extends StatefulWidget {
   CoinDetailsComponent({Key? key,
     this.coinData

  }) : super(key: key);
  CoinData? coinData;

  @override
  State<CoinDetailsComponent> createState() => _CoinDetailsComponentState();
}

class _CoinDetailsComponentState extends State<CoinDetailsComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(widget.coinData!.name.toString()),),
    );
  }
}
