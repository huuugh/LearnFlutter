import 'package:flutter/material.dart';

class MyListPage extends StatefulWidget{

  final String title;
  MyListPage({this.title}) : super();

  @override
  State<StatefulWidget> createState() {
    return new PageList();
  }
}

class PageList extends State<MyListPage>{

  final List<String> items=<String>['A','B','C','D','E','F','G','H','J'];

  void _finish(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:new AppBar(leading: new IconButton(icon: new Icon(Icons.arrow_back),
          onPressed:()=> _finish(context)),
        centerTitle: true,
        title: new Text("FlutterList"),
      ),
      body: Builder(builder: (context)=>ListView.builder(itemBuilder: (BuildContext context,int index){
        return GestureDetector(
          child: buildListTile(items[index]),
          onTap: ()=>_toast(context,items[index]),
        );
      },itemCount: items.length,),),
    );
  }

  Widget buildListTile(String item){
    return new ListTile(
      isThreeLine: false,//子item的是否为三行
      dense: true,
      leading: new CircleAvatar(child: new Text(item),),//左侧首字母图标显示，不显示则传null
      title: new Text('子item的标题',textAlign: TextAlign.left,),//子item的标题
      subtitle: new Text('子item的内容',textAlign: TextAlign.left,),//子item的内容
      trailing: new Icon(Icons.arrow_right,color: Colors.grey,),//显示右侧的箭头，不显示则传null
    );
  }

  void _toast(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text(msg),
    ));
  }
}
