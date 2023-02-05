import 'dart:convert';

import 'package:admin/models/RecentFile.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';
import '../../../models/CoinData.dart';

class RecentFiles extends StatefulWidget {
  const RecentFiles({Key? key,}) : super(key: key);


  @override
  State<RecentFiles> createState() => RecentFilesState();
}

class RecentFilesState extends State<RecentFiles>{
  List<CoinData> coinDataList =[];

    Future getCoinData() async {

      final uri = Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=INR&order=market_cap_desc&per_page=10&page=1&sparkline=false");
      final body2 = {
        'vs_currency':"INR",
        'order' : 'market_cap_desc',
        'per_page':'2',
        'page':'1',
        'sparkline':false
      };

      final response = await http.get(uri);
      final responseData = json.decode(response.body);

      print(response.body);

        setState(() {

          for (Map user in responseData) {
            coinDataList.add(CoinData.fromJson(user));
          }



        });



    }


    @override
  void initState() {
    // TODO: implement initState

      getCoinData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return
      coinDataList.length >0?
      Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Price List",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            height: 500,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Symbol"),
                ),
                DataColumn(
                  label: Text("Name"),
                ),
                DataColumn(
                  label: Text("Price"),
                ),
              ],
              rows: List.generate(
                coinDataList.length,
                    (index) => recentFileDataRow(coinDataList[index]),
              ),
            ),
          ),
        ],
      ),
    ): Center(child: Text("Loading..."));
  }


}




DataRow recentFileDataRow(CoinData fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            ClipRect(
              child:  Image.network(
                fileInfo.image!,
                height: 30,
                width: 30,
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.symbol!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.name!)),
      DataCell(Text(fileInfo.currentPrice!)),
    ],
  );
}
