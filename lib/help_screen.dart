import 'package:calculadora_tributaria/app_theme.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final List<List<String>> dataList = [
    <String>['Rose', 'SunFlower'],
    <String>['SUV', 'CityCar', 'Jeep'],
  ];
  bool showCancel = false;
  String inputText = "";
  final _rate = 6.96;
  final _euroController = TextEditingController();
  final _usdController = TextEditingController();
  final _euroFocusNode = FocusNode();
  final _usdFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _euroController.addListener(this.onEuroChange);
    _usdController.addListener(this.onUSDChange);
  }

  onEuroChange() {
    if (_euroFocusNode.hasFocus) {
      final euro = double.tryParse(_euroController.text);

      if (euro != null) {
        final usd = euro * _rate;
        print(usd);
        _usdController.value = TextEditingValue(text: usd.toStringAsFixed(2));
      }
    }
  }

  onUSDChange() {
    if (_usdFocusNode.hasFocus) {
      final usd = double.tryParse(_usdController.text);

      if (usd != null) {
        final euro = usd / _rate;
        _euroController.value = TextEditingValue(text: euro.toStringAsFixed(2));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cambio de Dolar'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Cambio: 1 Bs = ${this._rate}',
                    style: Theme.of(context).textTheme.title),
                SizedBox(height: 20),
                TextField(
                  controller: _euroController,
                  focusNode: _euroFocusNode,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'BS', border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
                TextField(
                    controller: _usdController,
                    focusNode: _usdFocusNode,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'USD', border: OutlineInputBorder()))
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _usdFocusNode.dispose();
    _euroFocusNode.dispose();
    _usdController.dispose();
    _euroController.dispose();
    super.dispose();
  }
}
