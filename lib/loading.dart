import 'package:bitcoin/Network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getdata() async {
    var data = await Network.getData(
        'https://rest.coinapi.io/v1/exchangerate/BTC/AUD?apiKey=211014A8-F386-4F6E-9362-4309CA6BA4D4');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Center(
        child: CupertinoActivityIndicator(
          color: Colors.black,
          radius: 45,
        ),
      ),
    );
  }
}
