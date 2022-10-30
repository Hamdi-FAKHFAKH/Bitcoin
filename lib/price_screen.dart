import 'package:bitcoin/Network.dart';
import 'package:bitcoin/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'erreurPage.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  bool b = true;
  String selectedItem = 'AUD';
  String valueBTC = '?';
  String valueETH = '?';
  String valueLTC = '?';
  List<Text> getPickerItems() {
    List<Text> list = [];
    for (String i in currenciesList) {
      list.add(Text(i));
    }
    return list;
  }

  void getdata(inputU) async {
    var data = await Network.getData(
        'https://rest.coinapi.io/v1/exchangerate/$inputU/$selectedItem?apiKey=AAA6EFFD-10C8-42A8-B772-F1AA4F6AD21B');
    if (data == null && b == true) {
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Error2Screen();
        },
      ));
      setState(() {
        b = false;
      });
    }
    setState(() {
      double val = data["rate"];
      if (inputU == 'BTC') {
        valueBTC = val.toStringAsFixed(0);
      } else if (inputU == 'ETH') {
        valueETH = val.toStringAsFixed(0);
      } else if (inputU == 'LTC') {
        valueLTC = val.toStringAsFixed(0);
      }
    });
  }

  @override
  void initState() {
    CoinData.setItems();
    getdata('BTC');
    getdata('ETH');
    getdata('LTC');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CardCoin(
                unit: 'BTC',
                selectedItem: selectedItem,
                value: valueBTC,
              ),
              CardCoin(
                unit: 'ETH',
                selectedItem: selectedItem,
                value: valueETH,
              ),
              CardCoin(
                unit: 'LTC',
                selectedItem: selectedItem,
                value: valueLTC,
              ),
              const SizedBox(
                height: 225,
              ),
              Container(
                  height: 150.0,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 30.0),
                  color: Colors.lightBlue,
                  child: CupertinoPicker(
                    itemExtent: 30,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        b = true;
                        selectedItem = currenciesList[index];
                        getdata('BTC');
                        getdata('ETH');
                        getdata('LTC');
                      });
                    },
                    children: getPickerItems(),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class CardCoin extends StatelessWidget {
  const CardCoin(
      {required this.selectedItem, required this.value, required this.unit});
  final String value;
  final String unit;
  final String selectedItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $unit = $value $selectedItem',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
// DropdownButton<String>(
// value: selectedItem,
// items: KdropdownItems,
// onChanged: (value) {
// setState(() {
// selectedItem = value;
// });
// },
// ),
