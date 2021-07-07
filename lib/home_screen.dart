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

  final totalCostoController = TextEditingController();
  final totalLiquidoController = TextEditingController();

  final iueController = TextEditingController();
  final iuController = TextEditingController();
  final itController = TextEditingController();
  final rcIvaController = TextEditingController();

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  double toDouble(String numero){
    if(isNumeric(numero)){
      return double.parse(numero);
    }
    return 0.0;
  }

  void calculaTotales(){
    this.totalLiquido = toDouble(this.servicio.toString()) + toDouble(this.bienes.toString())
        + toDouble(this.alquiler.toString()) + toDouble(this.viatico.toString());
    totalLiquidoController.value = TextEditingValue(text: this.totalLiquido.toStringAsFixed(2));

    this.totalCosto = toDouble(serviciosTotalController.text) + toDouble(bienesTotalController.text)
        + toDouble(alquilerTotalController.text) + toDouble(viaticoTotalController.text);
    totalCostoController.value = TextEditingValue(text: this.totalCosto.toStringAsFixed(2));

    double iue = (toDouble(serviciosTotalController.text) * 0.125);
    iueController.value =  TextEditingValue(text: iue.toStringAsFixed(2));

    double iu = (toDouble(bienesTotalController.text) * 0.05);
    iuController.value =  TextEditingValue(text: iu.toStringAsFixed(2));

    double it = (toDouble(serviciosTotalController.text) + toDouble(bienesTotalController.text)
        +toDouble(alquilerTotalController.text)) * 0.03;
    itController.value =  TextEditingValue(text: it.toStringAsFixed(2));

    double rcIva = (toDouble(viaticoTotalController.text) + toDouble(alquilerTotalController.text)) * 0.13;
    rcIvaController.value =  TextEditingValue(text: rcIva.toStringAsFixed(2));
  }

  onServicioChange() {
    double total = 0;
    this.servicio = 0;
    if(isNumeric(serviciosController.text)){
      this.servicio = double.parse(serviciosController.text);
      if(this.servicio != null){
        total = ((this.servicio)/0.845);
      }
    }
    serviciosTotalController.value = TextEditingValue(text: total.toStringAsFixed(2));
    calculaTotales();
  }

  onBienChange() {
    double total = 0;
    this.bienes = 0;
    if(isNumeric(bienesController.text)){
      this.bienes = double.parse(bienesController.text);
      if(this.bienes != null){
        total = ((this.bienes)/0.92);
      }
    }
    bienesTotalController.value = TextEditingValue(text: total.toStringAsFixed(2));
    calculaTotales();
  }

  onAlquilerChange() {
    double total = 0;
    this.alquiler = 0;
    if(isNumeric(alquilerController.text)){
      this.alquiler = double.parse(alquilerController.text);
      if(this.alquiler != null){
        total = ((this.alquiler)/0.84);
      }
    }
    alquilerTotalController.value = TextEditingValue(text: total.toStringAsFixed(2));
    calculaTotales();
  }

  onViaticoChange() {
    double total = 0;
    this.viatico = 0;
    if(isNumeric(viaticoController.text)){
      this.viatico = double.parse(viaticoController.text);
      if(this.viatico != null){
        total = ((this.viatico)/0.87);
      }
    }
    viaticoTotalController.value = TextEditingValue(text: total.toStringAsFixed(2));
    calculaTotales();
  }

  @override
  void initState() {
    super.initState();
    serviciosController.addListener(this.onServicioChange);
    bienesController.addListener(this.onBienChange);
    alquilerController.addListener(this.onAlquilerChange);
    viaticoController.addListener(this.onViaticoChange);

    serviciosTotalController.value = TextEditingValue(text: "0.00");
    bienesTotalController.value = TextEditingValue(text: "0.00");
    alquilerTotalController.value = TextEditingValue(text: "0.00");
    viaticoTotalController.value = TextEditingValue(text: "0.00");

    iueController.value = TextEditingValue(text: "0.00");
    iuController.value = TextEditingValue(text: "0.00");
    itController.value = TextEditingValue(text: "0.00");
    rcIvaController.value = TextEditingValue(text: "0.00");
  }

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Recibo de prestación'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Icon(Icons.accessibility_new_sharp),
                  Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Text('RECIBO DE PRESTACIÓN DE SERVICIOS Y/O COMPRA DE BIENES',
                          )
                        ],
                      )
                  )
                ]
            ),
            new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded (
                    child: new TextFormField(
                      maxLines: 3,
                      decoration: const InputDecoration(
                        hintText: '',
                        labelText: 'Recibi de:',
                      ),
                    ),
                  ),
                ]
            ),
            new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded (
                    child: new TextFormField(
                      maxLines: 3,
                      decoration: const InputDecoration(
                        hintText: '',
                        labelText: 'La suma de:',
                      ),
                    ),
                  ),
                ]
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: ancho*0.55,
                  child: new TextFormField(
                    maxLines: 2,
                    decoration: const InputDecoration(
                      hintText: '',
                      labelText: 'SERVICIOS',
                    ),
                  ),
                ),
                new Flexible (
                  child: new TextFormField(
                  controller: serviciosController,
                  decoration: const InputDecoration(
                      hintText: '',
                      labelText: 'Liquido Pagable',
                    ),
                  keyboardType: TextInputType.number,
                  ),
                ),
                Visibility(
                  visible: false,
                  child: SizedBox(
                    width: ancho*0.2,
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
                ),
                // new Text('${this.servicio}')
              ],
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: ancho*0.55,
                  child: new TextFormField(
                    maxLines: 2,
                    decoration: const InputDecoration(
                      hintText: '',
                      labelText: 'COMPRA',
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
                Visibility(
                  visible: false,
                  child: SizedBox(
                    width: ancho*0.2,
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
                ),
                // new Text('${this.servicio}')
              ],
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: ancho*0.55,
                  child: new TextFormField(
                    maxLines: 2,
                    decoration: const InputDecoration(
                      hintText: '',
                      labelText: 'ALQUILER',
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
                Visibility(
                  visible: false,
                  child:SizedBox(
                    width: ancho*0.2,
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
                ),
                // new Text('${this.servicio}')
              ],
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: ancho*0.55,
                  child: new TextFormField(
                    maxLines: 2,
                    decoration: const InputDecoration(
                      hintText: '',
                      labelText: 'VIÁTICO',
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
                Visibility(
                  visible: false,
                  child: SizedBox(
                    width: ancho*0.2,
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
                ),
                // new Text('${this.servicio}')
              ],
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.accessibility_new_sharp),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Text('RETENCIONES IMPOSITIVAS',
                        style: TextStyle(
                        fontSize: 20,
                        color: AppTheme.darkText,
                        fontWeight: FontWeight.w700,
                      ),

                      )
                    ],
                  )
                )
              ]
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: ancho*0.6,
                  child: new Text(
                    'IUE 12,5% (Bs)',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppTheme.darkText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // new Flexible (
                Expanded(
                  child: new TextFormField(
                    controller: iueController,
                    enabled: false,
                    decoration: const InputDecoration(
                      hintText: '0.00',
                      labelText: 'Prestación de servicios',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                // new Text('${this.servicio}')
              ],
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: ancho*0.6,
                  child: new Text(
                    'IU 5% (Bs)',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppTheme.darkText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // new Flexible (
                Expanded(
                  child: new TextFormField(
                    controller: iuController,
                    enabled: false,
                    decoration: const InputDecoration(
                      hintText: '0.00',
                      labelText: 'Compra de bienes y materiales',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                // new Text('${this.servicio}')
              ],
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: ancho*0.6,
                  child: new Text(
                    'IT 3% (Bs)',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppTheme.darkText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // new Flexible (
                Expanded(
                  child: new TextFormField(
                    controller: itController,
                    enabled: false,
                    decoration: const InputDecoration(
                      hintText: '0.00',
                      labelText: 'Transacciones',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                // new Text('${this.servicio}')
              ],
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: ancho*0.6,
                  child: new Text(
                    'RC-IVA 13% (Bs)',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppTheme.darkText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // new Flexible (
                Expanded(
                  child: new TextFormField(
                    controller: rcIvaController,
                    enabled: false,
                    decoration: const InputDecoration(
                      hintText: '0.00',
                      labelText: 'Alquileres, viáticos',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                // new Text('${this.servicio}')
              ],
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: ancho*0.3,
                  child: new Text(
                    'TOTALES',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppTheme.darkText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                new Flexible (
                  child: new TextFormField(
                    controller: totalLiquidoController,
                    enabled: false,
                    decoration: const InputDecoration(
                      hintText: '0.00',
                      labelText: 'Liquido Pagable.',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  width: ancho*0.3,
                  child: new TextFormField(
                    controller: totalCostoController,
                    enabled: false,
                    decoration: const InputDecoration(
                      hintText: '0.00',
                      labelText: 'Total Costo',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                // new Text('${this.servicio}')
              ],
            ),
          ]
        )
      ),
    );
  }
}
