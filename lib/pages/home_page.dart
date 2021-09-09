import 'package:flutter/material.dart';
import 'package:netdemo/model/post_model.dart';
import 'package:netdemo/services/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   String data = '';

  void  _apiPostList(){
    Network.GET(Network.API_List, Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

   void  _apiDelete( Post post ){
     Network.Del(Network.API_Delete + post.id.toString(), Network.paramsEmpty()).then((response) => {
       print(response),
       _showResponse(response),
     });
   }

   void  _apiUdateList(Post post){
     Network.PUT(Network.API_Update + post.id.toString(), Network.paramsUpdate(post)).then((response) => {
       print(response),
       _showResponse(response),
     });
   }

   void  _apiPostCreate( Post post){
     Network.POST(Network.API_Create, Network.paramsCreate(post)).then((response) => {
       print(response),
       _showResponse(response),
     });
   }

   void _showResponse( String response){
   setState(() {
     data = response ;
   });
   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post  = new Post( id : 32);
    _apiDelete(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(  data != null ? data : "No Data" ),
      ),
    );
  }
}
