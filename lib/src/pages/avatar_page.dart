import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(4.5),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://dam.smashmexico.com.mx/wp-content/uploads/2018/05/24100112/Stan-Lee.jpg'),
              radius: 24.3,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child:FadeInImage(
          image: NetworkImage('https://staticpasa2.cdnstatics2.com/static/upl/img//44MX07/sliderImgPrincipal_170_1-slider-png2-enciclopedia_marvel-584x584_1542305134542.png'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        ),
      )
    );
  }
}