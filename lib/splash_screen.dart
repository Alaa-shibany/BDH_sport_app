// import 'package:flutter/material.dart';
// import './screens/auth_screen.dart';

// class splashScreen extends StatefulWidget {
//   static const String routName = '/splash-screen';
//   @override
//   State<splashScreen> createState() => _splashScreenState();
// }

// class _splashScreenState extends State<splashScreen> with TickerProviderStateMixin {
//   //difine the animation
//   late final AnimationController _controller  = AnimationController(
//     vsync: this,
//     duration: const Duration(seconds: 3),
//   )..repeat(reverse: true);

//   late final Animation <double> _animation = CurvedAnimation(
//     parent: _controller,
//      curve: Curves.easeIn,);

//      @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }


//   Color color =Color.fromARGB(255, 51, 44, 63) ;
//   @override
//   void initState() {
//     super.initState();
//     _navigatetohome();
//   }

//   _navigatetohome() async{
//     await Future.delayed(Duration(milliseconds: 4000), () {});
//     Navigator.of(context).pushReplacementNamed(AuthScreen.routName);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var _mediaQuery = MediaQuery.of(context);

//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 77, 46, 130),
//       body: Container(
//         height: _mediaQuery.size.height,
//         width: _mediaQuery.size.width,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//                Color.fromRGBO(87, 101,  187, 1),
//              Color.fromARGB(255, 37, 48, 106),
              
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Stack(
//           alignment: Alignment.center,
//           children: <Widget>[
//             Container(
//               width: _mediaQuery.size.width,
//               height: _mediaQuery.size.height,
//               child: Image(image: AssetImage('assets/images/light.png'),
//               color: Colors.white.withOpacity(0.05),
//               fit: BoxFit.cover,)),
           
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   alignment: Alignment.center,
//                    height: _mediaQuery.size.height/2.5,
//                    width: _mediaQuery.size.width/2.5,
//                   child: const Image (image: AssetImage('assets/images/champions1.png' ,),
//                   fit: BoxFit.cover,),
//                 ),
//                 SizedBox(height: _mediaQuery.size.height/3
//                 ),
//                 FadeTransition(
//                   opacity: _animation,
//                   child: Container (
//                     width: _mediaQuery.size.width/10,
//                     height: _mediaQuery.size.height/10,
//                     child:const Image(image: AssetImage('assets/images/weverLogo.png' ,),
//                   fit: BoxFit.fitWidth,) ,
//                   )
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ) 
//       );
//   }
// }