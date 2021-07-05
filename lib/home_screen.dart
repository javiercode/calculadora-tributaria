import 'package:calculadora_tributaria/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model/homelist.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  {
  double servicio =0;
  double bienes =0;
  double alquiler =0;
  double viatico =0;
  double totalLiquido =0;
  double totalCosto =0;
  final serviciosController = TextEditingController();
  final bienesController = TextEditingController();
  final alquilerController = TextEditingController();
  final viaticoController = TextEditingController();

  final serviciosTotalController = TextEditingController();
  final bienesTotalController = TextEditingController();
  final alquilerTotalController = TextEditingController();
  final viaticoTotalController = TextEditingController();

  onServicioChange() {
    this.servicio = double.parse(serviciosController.text);
    double total = 0;
    print(this.servicio);
    if(this.servicio != null){
      total = ((this.servicio)/0.845);
      serviciosTotalController.value = TextEditingValue(text: total.toStringAsFixed(2));
    }
  }

  onBienChange() {
    print(bienesController.text);
    if(bienesController.text!=null){
      this.bienes = double.parse(bienesController.text);
      double total = 0;
      print(this.bienes);
      if(this.bienes != null){
        total = ((this.bienes)/0.92);
        bienesTotalController.value = TextEditingValue(text: total.toStringAsFixed(2));
      }
    }
  }

  onAlquilerChange() {
    // this.alquiler = double.parse(alquilerController.text);
    double total = 0;
    // if(this.alquiler null){
    //   total = ((this.alquiler)/0.84);
    //   alquilerTotalController.value = TextEditingValue(text: total.toStringAsFixed(2));
    // }
  }

  onViaticoChange() {
    // this.viatico = double.parse(viaticoController.text);
    double total = 0;
    // if(this.viatico != null){
    //   total = ((this.viatico)/0.84);
    //   viaticoTotalController.value = TextEditingValue(text: total.toStringAsFixed(2));
    // }
  }

  @override
  void initState() {
    super.initState();
    serviciosController.addListener(this.onServicioChange);
    bienesController.addListener(this.onBienChange());
    // alquilerController.addListener(this.onAlquilerChange());
    // viaticoController.addListener(this.onViaticoChange());
  }

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Tributaria'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: ancho*0.3,
                    child: new Text(
                      'Servicios',
                      style: TextStyle(
                        fontSize: 22,
                        color: AppTheme.darkText,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  new Flexible (
                    child: new TextFormField(
                    controller: serviciosController,
                    decoration: const InputDecoration(
                        hintText: '',
                        labelText: 'Liquido Pagable.',
                      ),
                    keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: ancho*0.3,
                    child: new TextFormField(
                      controller: serviciosTotalController,
                      enabled: false,
                      decoration: const InputDecoration(
                        hintText: '0.0',
                        labelText: 'Total Costo',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  // new Text('${this.servicio}')
                ],
              ),
            ),
            Expanded(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: ancho*0.3,
                    child: new Text(
                      'Compra de Bienes',
                      style: TextStyle(
                        fontSize: 22,
                        color: AppTheme.darkText,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  new Flexible (
                    child: new TextFormField(
                    controller: bienesController,
                    decoration: const InputDecoration(
                        hintText: '',
                        labelText: 'Liquido Pagable',
                      ),
                    keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: ancho*0.3,
                    child: new TextFormField(
                      controller: bienesTotalController,
                      enabled: false,
                      decoration: const InputDecoration(
                        hintText: '0.0',
                        labelText: 'Total Costo',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  // new Text('${this.servicio}')
                ],
              ),
            ),
            Expanded(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: ancho*0.3,
                    child: new Text(
                      'Alquileres',
                      style: TextStyle(
                        fontSize: 22,
                        color: AppTheme.darkText,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  new Flexible (
                    child: new TextFormField(
                    controller: alquilerController,
                    decoration: const InputDecoration(
                        hintText: '',
                        labelText: 'Liquido Pagable.',
                      ),
                    keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: ancho*0.3,
                    child: new TextFormField(
                      controller: alquilerTotalController,
                      enabled: false,
                      decoration: const InputDecoration(
                        hintText: '0.0',
                        labelText: 'Total Costo',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  // new Text('${this.servicio}')
                ],
              ),
            ),
            Expanded(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: ancho*0.3,
                    child: new Text(
                      'Viaticos',
                      style: TextStyle(
                        fontSize: 22,
                        color: AppTheme.darkText,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  new Flexible (
                    child: new TextFormField(
                    controller: viaticoController,
                    decoration: const InputDecoration(
                        hintText: '',
                        labelText: 'Liquido Pagable.',
                      ),
                    keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: ancho*0.3,
                    child: new TextFormField(
                      controller: viaticoTotalController,
                      enabled: false,
                      decoration: const InputDecoration(
                        hintText: '0.0',
                        labelText: 'Total Costo',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  // new Text('${this.servicio}')
                ],
              ),
            ),
          ]
        )
      ),
    );
  }
}
