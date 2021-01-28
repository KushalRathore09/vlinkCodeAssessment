import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterData extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => FilterDataState() ;

}
class FilterDataState extends State<FilterData>{
   bool _isSelected = false ;
   List<String>locationData = [
     "West Des Moines",
     "Chicago,IL ",
     "Phoenix, AZ",
     "Dallas , TX",
     "San Diego , CA",
     "San Fransisco , CA",
     "New York"
   ];

   //List<String>trainer = [];

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Sort and Filters",style: TextStyle(fontSize: 20.0,color: Colors.black,),),backgroundColor:Colors.white ,
        actions: [
          InkWell(
              onTap: ()=> Navigator.of(context).pop(),
              child: Icon(Icons.cancel,color: Colors.grey,))
        ],),
      body: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap:(){
                  setState(() {
                    if(_isSelected = false){
                      _isSelected = true ;
                    }
                    else{
                      _isSelected = false ;
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: new BorderRadius.all(Radius.circular(1.0)),
                      border: Border.all(
                          color: Colors.white, width: 0.5)),
                  child: Row(
                    children: [
                      _isSelected ? Container(
                        height: 50,
                        width: 10,
                        color: Colors.red[400],
                      ) : Container(),
                      Text("Sort By",style: TextStyle(fontSize: 17.0,color:Colors.black,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap:() {},
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: new BorderRadius.all(Radius.circular(1.0)),
                      border: Border.all(
                          color: Colors.white, width: 0.5)),
                  child: Row(
                    children: [
                      _isSelected ? Container(
                        height: 50,
                        width: 10,
                        color: Colors.red[400],
                      ) : Container(),
                      Text("Location",style: TextStyle(fontSize: 17.0,color:Colors.black,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: new BorderRadius.all(Radius.circular(1.0)),
                      border: Border.all(
                          color: Colors.white, width: 0.5)),
                  child: Row(
                    children: [
                      _isSelected ? Container(
                        height: 50,
                        width: 10,
                        color: Colors.red[400],
                      ): Container(),
                      Text("Training Name",style: TextStyle(fontSize: 17.0,color:Colors.black,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){

                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: new BorderRadius.all(Radius.circular(1.0)),
                      border: Border.all(
                          color: Colors.white, width: 0.5)),
                  child: Row(
                    children: [
                      _isSelected ? Container(
                        height: 50,
                        width: 10,
                        color: Colors.red[400],
                      ) :Container(),
                      Text("Trainer",style: TextStyle(fontSize: 17.0,color:Colors.black,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [

            ],
          )
        ],
      ),
    );
  }

}