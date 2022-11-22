import 'package:flutter/material.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';
import 'package:flutter_application_1/pages/pomodoro.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: SizedBox(
            width: 90,
            child: Image.asset("assets/novalogo.jpg"),
          ),
        ),
        leading: Container(
          height: 35,
          width: 35,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage("assets/iconehome.jpg"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        actions: <Widget>[
          Container(
            width: 60,
            child: TextButton(
              child: Icon(
                Icons.search,
                color: Color(0xFFBABABA),
              ),
              onPressed: () => {},
            ),
          ),
        ],
      ),
      body: buildBody(context),
    );
  }
}

buildBody(context){
  return Container(
        color: Color(0xFFF2F3F6),
        child: ListView(
          children: <Widget>[
            cardItem(),
            cardPomo(context),
          ],
      )
  );
}
Widget cardItem() {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://super.abril.com.br/wp-content/uploads/2016/12/ada_lovelace_portrait_circa_1840.jpg?quality=70&strip=all"),
          ),
          title: Text("Ada Lovelace"),
          subtitle: Text("10/12/2021 14:57"),
          trailing: Icon(Icons.more_vert),
        ),
        Container(
          child: Image.asset("assets/post-picture-001.jpg"),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
              "Compartilhe a sua opinião com outros estudantes!!"),
        ),
        ButtonTheme(
          child: ButtonBar(
            children: <Widget>[
              TextButton(
                child: Icon(Icons.favorite),
                onPressed: () {},
              ),
              TextButton(
                child: Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ]
    )
  );
}

Widget cardPomo(context) {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: Image.asset("assets/post-picture-002.jpg"),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
              "Utilize o Método Pomodoro e potencialize seus estudos!"),
        ),
        ButtonTheme(
          child: ButtonBar(
            children: <Widget>[
              TextButton(
                child: Icon(Icons.watch_later),
                onPressed: () {},
              ),
            ],
          ),
        ),
            ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.pink[800],
              ),
              child: Text(
                'Comece Agora',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pomodoro(),
                  )
                 );
              },
            ),
      ],
    ),
  );
}