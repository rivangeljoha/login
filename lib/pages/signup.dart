import 'package:flutter/material.dart';
import 'package:senaflutter/constants/constants.dart';
import 'package:senaflutter/pages/entradaSena.dart';
import 'package:senaflutter/ui/widgets/custom_shape.dart';
import 'package:senaflutter/ui/widgets/customappbar.dart';
import 'package:senaflutter/ui/widgets/responsive_ui.dart';
import 'package:senaflutter/ui/widgets/textformfield.dart';



class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool checkBoxValue = false;
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
          //margin: EdgeInsets.only(bottom: 5),

          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88,
                child: CustomAppBar()),
                clipShape(),
                form(),
                acceptTermsTextRow(),
                SizedBox(height: _height/50,),
                button(),
                infoTextRow(),
                socialIconsRow(),
                signInTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large? _height/8 : (_medium? _height/7 : _height/6.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 221, 28, 182), Color.fromARGB(255, 244, 119, 211)],
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
              height: _large? _height/12 : (_medium? _height/11 : _height/10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 244, 120, 178), Color.fromARGB(255, 247, 137, 192)],
                ),
              ),
            ),
          ),
        ),
        Container(
          height: _height / 5.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.0,//La cantidad de propagación de la sombrase utiliza un valor de 0 para no aplicar propagación.
                  color: Colors.black26,// El color de la sombra. En este caso, se utiliza 
                  offset: Offset(1.0, 10.0),//El desplazamiento de la sombra en coordenadas (x, y).
                  blurRadius: 20.0),//Cuanto mayor sea el valor, más difusa será la sombra.
            ],
            color: Colors.white,
            shape: BoxShape.circle,//el contenedor adopta una forma circular.
          ),
          child: GestureDetector(// permite detectar y responder a diferentes gestos y eventos de entrada, como toques, arrastres, pulsaciones largas, entre otros
              onTap: (){
                print('Adding photo');
              },

              child: Icon(Icons.add_a_photo, size: _large? 40: (_medium? 33: 31),color:Color.fromARGB(255, 221, 28, 195),)),
        ),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left:_width/ 12.0,
          right: _width / 12.0,
          top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            lastNameTextFormField(),
            SizedBox(height: _height/ 60.0),
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            phoneTextFormField(),
            SizedBox(height: _height / 60.0),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "First Name",
    );
  }

  Widget lastNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "Last Name",
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email,
      hint: "Email ID",
    );
  }

  Widget phoneTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.number,
      icon: Icons.phone,
      hint: "Mobile Number",
    );
  }

  Widget passwordTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      obscureText: true,
      icon: Icons.lock,
      hint: "Password",
    );
  }

  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: Color.fromARGB(255, 241, 139, 210),
              value: checkBoxValue,
              onChanged: (bool? newValue) {
                if (newValue != null) {
                setState(() {
                  checkBoxValue = newValue;
                });
              }}),
          Text(
            "I accept all terms and conditions",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: _large? 12: (_medium? 11: 10)),
          ),
        ],
      ),
    );
  }

Widget button() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      padding: EdgeInsets.all(0.0),
      
    ),
    onPressed: () {
      print("Routing to your account");
    },
    child: Container(
      alignment: Alignment.center,
      width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(
          colors: <Color>[Color.fromARGB(255, 248, 134, 232), Color.fromARGB(255, 12, 116, 34)],
        ),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Text(
        'SIGN UP',
        style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10)),
      ),
    ),
  );
}
//   Widget button() {
//     return RaisedButton(
//       elevation: 0,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
//       onPressed: () {
//         print("Routing to your account");
//       },
//       textColor: Colors.white,
//       padding: EdgeInsets.all(0.0),
//       child: Container(
//         alignment: Alignment.center,
// //        height: _height / 20,
//         width:_large? _width/4 : (_medium? _width/3.75: _width/3.5),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(20.0)),
//           gradient: LinearGradient(
//             colors: <Color>[Colors.orange[200]!, Colors.pinkAccent],
//           ),
//         ),
//         padding: const EdgeInsets.all(12.0),
//         child: Text('SIGN UP', style: TextStyle(fontSize: _large? 14: (_medium? 12: 10)),),
//       ),
//     );
//   }

  Widget infoTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 60.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Or create using social media",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: _large? 12: (_medium? 11: 10)),
          ),
        ],
      ),
    );
  }

  Widget socialIconsRow() {
    return Container(
      margin: EdgeInsets.only( bottom: 15, top: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/googlelogo.png"),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/fblogo.jpg"),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/twitterlogo.jpg"),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      //margin: EdgeInsets.only(top: _height ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(SIGN_IN);
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w800, color: Color.fromARGB(255, 221, 28, 160), fontSize: 19),
            ),
          ), SizedBox(
            width: 30,
          ),
          GestureDetector(
            
            onTap:(){
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=> EntradaSena()),);
              print("siguiente");
            } , 
            child: Text('Next-View',
            style: TextStyle(fontWeight: FontWeight.w800, color: Color.fromARGB(255, 221, 28, 176), fontSize: 19),
            ),
          )

        ],
      ),
    );
  }
}
