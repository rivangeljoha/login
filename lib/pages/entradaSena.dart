import 'package:flutter/material.dart';
//import 'package:senaflutter/constants/constants.dart';
import 'package:senaflutter/ui/widgets/custom_shape.dart';
import 'package:senaflutter/ui/widgets/customappbar.dart';
import 'package:senaflutter/ui/widgets/responsive_ui.dart';
//import 'package:senaflutter/ui/widgets/textformfield.dart';


class EntradaSena extends StatefulWidget {

  @override
  _EntradaSenaState createState() =>  _EntradaSenaState();
}

class _EntradaSenaState extends State<EntradaSena> {
  List <String> _sede =[' ','Centro comercio y servicios','Centro Tele-informática y producción industrial',];
  List <String> _area =[' ','TICS','Cocina','Diseño'];
  List <String> _infraestructura =[' ','software 1','software2','Tics','Teatro'];
  
  String? _selectedSede;
  String? _selectedArea;
  String? _selectedInfraestructura;

  late double _height;
  late double _width;
  late double _pixelRatio;
  late bool _large;
  late bool _medium;
  
  @override
  Widget build(BuildContext context) {
    

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,

          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88,
                child: CustomAppBar()),
                clipShape(),
                listPrincipal(),
                
            

              ],
            ),
          ),
        ),
      ),
    );
  }


Widget clipShape() {
    //double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
             // margin: EdgeInsets.only(bottom:_height/120),
              height:_large? _height/4 : (_medium? _height/7 : _height/3),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 28, 221, 86), Color.fromARGB(255, 12, 116, 34)],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              // margin: EdgeInsets.only(bottom:_height/120),
              height: _large? _height/4.5 : (_medium? _height/11.3 : _height/4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 28, 221, 86), Color.fromARGB(255, 12, 116, 34)],
                ),
              ),
            ),
          ),
        ),
        Container(
          
          height: _height /7,
          alignment: Alignment.topCenter,
          child: Image.asset('assets/images/logo-sena-blanco.png',),padding: EdgeInsets.only(bottom: 10),

          
        )
      ]
    );
  }


Widget listPrincipal() {
  return Container(
    
      margin: EdgeInsets.only(
          left:_width/ 12.0,
          right: _width / 12.0,
          
          ),
    child: SingleChildScrollView(
      child:Column(
        children: <Widget>[
          Text('Principal',
          style: TextStyle(fontSize: 50,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 12, 116, 34)),
          ),
          SizedBox(height: _height / 30.0),
          sedeText(),
          SizedBox(height: _height / 60.0),
          areaText(),
          SizedBox(height: _height / 60.0),
          infraestructuraText(),
        ],
      ),
      
    ),
  );
}

  Widget sedeText() {
  return Container(
    child: DropdownButtonFormField<String>(
        value: _selectedSede,
        onChanged: (String? newValue) {
          setState(() {
            _selectedSede = newValue;
          });
        },
        hint: Text('Selecciona una sede',),
        
        items: _sede.map((name) {
          return DropdownMenuItem<String>(
            child: Text(name),
            value: name,
          );
        }).toList(),
      ),
  );
}

  Widget areaText() {
  return Container(
    child: DropdownButtonFormField<String>(
        value: _selectedArea,
        onChanged: (String? newValue) {
          setState(() {
            _selectedArea = newValue;
          });
        },
        hint: Text('Selecciona una area',),
        
        items: _area.map((name) {
          return DropdownMenuItem<String>(
            child: Text(name),
            value: name,
          );
        }).toList(),
      ),
  );
}
  Widget infraestructuraText() {
  return Container(
    child: DropdownButtonFormField<String>(
        value: _selectedInfraestructura,
        onChanged: (String? newValue) {
          setState(() {
            _selectedInfraestructura = newValue;
          });
        },
        hint: Text('Selecciona una infraestructura',),
        
        items: _infraestructura.map((name) {
          return DropdownMenuItem<String>(
            child: Text(name),
            value: name,
          );
        }).toList(),
      ),
  );
}
}