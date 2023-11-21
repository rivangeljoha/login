import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: height/12, // esto le coloca el tamaño al appbar
        width: width,
        padding: EdgeInsets.only(left: 15, top: 25,),// espacio de 15 unidades en la parte izq y arriba de 25
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:[Color.fromARGB(255, 240, 151, 233), Color.fromARGB(255, 239, 97, 189)]
          ),
        ),
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.arrow_back,),
                onPressed: (){
                  print("pop");
                  Navigator.of(context).pop();
            })
          ],
        ),
      ),
    );
  }
}
