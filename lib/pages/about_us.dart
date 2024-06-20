// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de nosotros'),
      ),
      backgroundColor: Color.fromARGB(255, 240, 240, 99),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            // Section: Litle Big Pet
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Litle Big Pet',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
            ),

            // Container div
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sub-container 1
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      '"Nuestras mascotas son lo más importante en nuestras vidas y aquí encontrarás los mejores productos para consentirlas"',
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // Sub-container 2
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 20.0),
                    margin: EdgeInsets.only(top: 1.0, bottom: 20.0),
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Sobre Little Big Pet',
                          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '¿No te gusta ese color? ¿Es demasiado pequeño o grande para tu mascota? ¿Quieres algo totalmente único? No te preocupes, nosotros mismos elaboramos nuestros productos, los hacemos personalizados y totalmente a tu gusto',
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),

                  // Sub-container 4 (Valores)
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 40.0, 20.0),
                    width: MediaQuery.of(context).size.width * 0.8,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Valores',
                          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.black),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Nuestros valores fundamentales guían cada decisión que tomamos y reflejan quiénes somos como empresa:\n\n'
                          'Compromiso con la Calidad: Nos comprometemos a ofrecer productos de la más alta calidad para asegurar la salud y el bienestar de tus mascotas. Cada producto que seleccionamos cumple con nuestros estrictos estándares de calidad.\n\n'
                          'Pasión por los Animales: Amamos a los animales tanto como tú. Nuestra pasión por los animales impulsa todo lo que hacemos, desde la selección de productos hasta el servicio al cliente excepcional que brindamos.\n\n'
                          'Transparencia y Confianza: Creemos en la transparencia en cada interacción. Estamos aquí para responder tus preguntas y proporcionarte la información que necesitas para tomar decisiones informadas sobre el cuidado de tus mascotas.\n\n'
                          'Excelencia en el Servicio al Cliente: Tu satisfacción es nuestra prioridad número uno. Nos esforzamos por ofrecerte una experiencia de compra personalizada y un servicio al cliente excepcional en cada visita.',
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),

                  // Sub-container 3 (Sus inicios)
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 40.0, 20.0),
                    width: MediaQuery.of(context).size.width * 0.6,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Sus inicios',
                          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.black),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'La marca nace en 2020, como parte de un proyecto estudiantil. En 2021 Karina Villa tomó el nombre Little Big Pet para empezar un negocio prometedor. Empezó confeccionando ropa para mascotas y juguetes, luego decidió aventurarse haciendo camas que sean fáciles de dar mantenimiento. Karina pasó los siguientes tres años perfeccionando su técnica, es así como ideó un mecanismo de cierres que permiten desarmar las camas para facilitar la limpieza de estas.',
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),

                  // Sub-container 5
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'En Little Big Pet, no solo nos dedicamos a proporcionarte los mejores productos para tus mascotas, sino que también nos comprometemos a ser tu socio de confianza en el cuidado y la felicidad de tus amigos peludos.',
                      style: TextStyle(fontSize: 18.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}


