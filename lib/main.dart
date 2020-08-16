import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizbrain.dart';
Quizbrain quizbrain=Quizbrain();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  build(context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title:Text('True and False questions',
          style:TextStyle(fontSize: 25.0),),
          backgroundColor: Colors.pink,
          centerTitle: true,),
      body:Quizpage(),
    ),);
  }
}
class Quizpage extends StatefulWidget{
  _Quizpage createState() => _Quizpage();
}
class _Quizpage extends State<Quizpage>
{
List<Icon> score=[];
  void check(bool useranswer){
    bool correctanswer =quizbrain.getanswer();
    setState(() {
      if(quizbrain.finished()==true){
        Alert(           context: context, 
           title: 'Finished!', 
        desc: 'You\'ve reached the end of the quiz.',
        ).show();
     quizbrain.reset();
     score=[];

      }

      else{
        if(correctanswer==useranswer){
          score.add(Icon(
            Icons.check,
           color: Colors.green,
           ),);
      }
      else{
         score.add(Icon(
            Icons.close,
           color:Colors.red,
         ),);
      }
      quizbrain.nextquestion();
      }

      
    });
  }
  build(context){
    return Column(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:<Widget>[
        Expanded(
          child:Padding(
            padding:EdgeInsets.all(4.0),
          child:Center(
            child:Text(
              quizbrain.getquestiontext(),
              textAlign: TextAlign.center,
              style:TextStyle(
                fontSize: 25.0,
                color: Colors.white,),
              
          ),),),),
          SizedBox(
            height:2.0,),
            Expanded(
              child:Padding(
                padding: EdgeInsets.all(50.0),
              child:FlatButton(
                color:Colors.green,
                onPressed: () {
                  check(true);
                },
                child:Text('True',
                style:TextStyle(
                  fontSize: 25.0,
                  color:Colors.white,),),
                
             ), ),),
            Expanded(
              child:Padding(padding:EdgeInsets.all(50.0),
              child:FlatButton(
                color:Colors.red,
                onPressed: () {
                  check(false);
                },
                child:Text('False',
                style:TextStyle(
                  fontSize: 25.0,
                  color:Colors.white,),),
     ), ),),
     Row(
       children:score,
     ),],);
  }

}