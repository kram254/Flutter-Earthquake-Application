import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kario_fade/modules/global.dart';
import 'package:kario_fade/modules/weather.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Karios Weather',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: MyHomePage(title:'KarioWeather'),
          );
        }
      
      }
      
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}): super(key: key);
  final title;

  _MyHomePageState createState()=> _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  fetchPosts() async{

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.title),
      ),

      body: Container(
        child: FutureBuilder(
           
           future: fetchPosts(),

           builder: (BuildContext context, AsyncSnapshot snapshot){
             if(snapshot.data==null ){
               return Container(
                 child: Center(
                   child: CircularProgressIndicator(),
                 ),
               );
              }
              else if(snapshot.data!=null){
                if(snapshot.data=="Sorry for the Inconvinience, Server Under Maintainance"){
                   return Container(
                    child: Center(
                      child: Text(snapshot.data),
                    ),
                   );
              }
              else return ListView.builder(
          itemBuilder: (BuildContext context, int index){
            
            return Container(
               decoration: BoxDecoration(
                 boxShadow: <BoxShadow>[
                   BoxShadow(
                  color: Color(0xFFE0E0E0),
                  offset: Offset(0.5,0.5),
                  blurRadius: 10.0,
                   )
                 ],
                 shape: BoxShape.rectangle,
                 color: Color(0xFFFAFAFA),
                 borderRadius: BorderRadius.all(Radius.circular(10))
               ),

            margin: EdgeInsets.all(8),   
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Container(
            width: MediaQuery.of(context).size.width/6,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/19 ),
                child: Text("1",style: TextStyle(color:Colors.white, fontSize: 16, fontWeight: FontWeight.bold ),
                )
              ),
            ),
            ),
               
               Container(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Text("KarioWorld",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                     Text("15km from my home", style: TextStyle(fontSize:12)),
                     ],
                 )
               )

              ],
            ),
            );
          }
          );
             }
           }, 
        )
        ),
      );
  }

}
   

