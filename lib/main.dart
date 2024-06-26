import 'package:flutter/material.dart';

import 'dart:math';

import 'package:flutter/rendering.dart';
//debugPaintSizeEnabled = true; //把隱藏的框架用虛線表示出來

import 'package:flutter_application_1/BLOC/post_provider.dart';
import 'package:flutter_application_1/post_detail.dart';


import 'package:http/http.dart' as http;//因為要用http.get

import 'dart:convert';//因為要用json.decode,轉換資料格式

import 'sqliteHelper.dart';//資料庫module


//連接網路下載圖片，第二次開啟app時，不用網路也能看到圖片(有判斷是否已經下載過讀片)
import 'cache_image.dart';
//自己寫的半殘版
import 'package:cached_network_image/cached_network_image.dart';
//官方的


import 'package:video_player/video_player.dart';

//import 'package:provider/provider.dart'; //另外寫在flutter_provider_test

import 'JSON_Serialize_module_manual.dart';

import 'serialize module/JSON_Serialize_module_Auto.dart';

import 'BLOC/post_bloc.dart';

// void main() => runApp(MaterialApp(
//       home: MyApptogglebutton(),
//     ));


//BLOC的PostProvider放在MaterialApp上面，讓所有的widget都可以使用
void main() => runApp(
    PostProvider(
      child: MaterialApp(
        home: HomePageimage(),
      )));

// void main(){
//   return runApp(MaterialApp());
// }

//切換頁面
//--------------------------------------------------
// void main() => runApp(MaterialApp(
//       initialRoute: '/',//從根開始
//       routes: {
//       '/': (context){return  MyAppchangepage();},
//       '/page2': (context){return Page2();}},
//     ));
//--------------------------------------

//statefulwidget 模板
// class MyApp extends StatefulWidget {
//   @override
//   _MAppState createState() => _MAppState();
// }
// class _MAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text(''),
//       ),
//       body: Container(),
//     );
//   }
// }


class HomePagecubes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyApp Demo'),
      ),
      body: Row(
        children: <Widget>[
          const Text(
            'Demo',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
                color: Colors.green,
                fontStyle: FontStyle.italic),
          ),
          Container(
            color: Colors.greenAccent,
            width: 20.0,
          ),
          Container(
            color: Colors.red,
            width: 100.0,
            height: 100.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            color: Colors.blue,
            width: 100.0,
            height: 100.0,
          )
        ],
      ),
    );
  }
}


//按按鈕隨機切換顏色
//-------------------------------------
class HomePagechagecolorcubes extends StatefulWidget {
  @override
  HomePage2State createState() => HomePage2State();
}
class HomePage2State extends State<HomePagechagecolorcubes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.forward),
          onPressed: () {
            setState(() {});
          }),
      appBar: AppBar(
        title: const Text('MyApp Demo'),
      ),
      body: Row(
        children: <Widget>[
          Container(
            color: getColor(),
            width: 100.0,
            height: 100.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            color: getColor(),
            width: 100.0,
            height: 100.0,
          )
        ],
      ),
    );
  }

  Color getColor() {
    return Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255));
  }
}
//-------------------------------------


class HomePagtextincube extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyApp Demo'),
        ),
        body: Container(
          margin: const EdgeInsets.all(30.0),
          padding: const EdgeInsets.all(30.0),
          decoration: const BoxDecoration(
            color: Colors.black12,
            shape: BoxShape.circle,
            //borderRadius: BorderRadius.circular(10.0),
          ),
          // width: 100.0,
          // height: 200.0,
          constraints: const BoxConstraints(
            minWidth: 200.0,
            minHeight: 200.0,
          ),

          // color: Colors.yellowAccent,
          //因為會跟decoration有衝突

          child: const Text('My Cotainer Demo'),
        ));
  }
}

class HomePagecard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyApp Demo'),
        ),
        body: const SizedBox(
          width: 100.0,
          height: 50.0,
          child: Card(
            child: Text(
              'card demo',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ));
  }
}

class HomePageinputtext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    //為了讓外部event也可以取得TextFiel的文字

    return Scaffold(
        appBar: AppBar(
          title: const Text('TextField Demo'),
        ),
        body: TextField(
          controller: controller,
          // onChanged: (text){
          //   print('onChanged');
          //   print(text);
          // },
          onEditingComplete: () {
            print('onEditingComplete');
            print(controller.text);
          },
          // onSubmitted: (text){
          //   print('onSubmitted');
          //   print(text);
          // },
          decoration: InputDecoration(
              icon: const Icon(Icons.calendar_today),
              labelText: '日期',
              //suffix: Icon(Icons.close), //focus才會出現
              //suffixIcon: Icon(Icons.remove),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent)),
              helperText: '日期格式: YYYY/MM/DD',
              hintText: '輸入位置',
              suffix: IconButton(
                  onPressed: () {
                    FocusScope.of(context)
                        .requestFocus(FocusNode()); //讓鍵盤可以收起，專換focus達到此效果
                  },
                  icon: const Icon(Icons.close))),
        ));
  }
}

class HomePagelistview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyApp Demo'),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            //動態產生,scroll的時候才會產生新的
            return Card(
              child: Container(
                height: 150,
                color: Colors.yellowAccent,
                child: Text('$index'),
              ),
            );
          },
        )
        // ListView(
        //     children: List.generate(10, (index){//需要設定數量
        //     return Card(child: Container(
        //       height: 150,
        //       color: Colors.greenAccent,
        //       child: Text('$index'),
        //     ),
        //   );
        //   }
        // ),
        // )
        );
  }
}

class HomePageimage extends StatelessWidget {
  final String bannerimg =
      'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Projects/Outlet/Amazon_OutletDeals_Desktop_TW.jpg';
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = true; //把隱藏的框架用虛線表示出來
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyApp Demo'),
      ),
      // body: Image.asset('lib/images/loyalty.jpg'),
      body: Image.network(
        bannerimg,
        height: 100.0,
        alignment: Alignment.bottomCenter,
        //fit: BoxFit.cover,
      ), //Image.network是一個box，裡面再跑NetworkImage
    );
  }
}

class HomePagegridview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyApp Demo'),
        ),
        body:
            // GridView.count(
            //   // scrollDirection: ,//調整排列方向，預設直向
            //   crossAxisCount: 2,//決定寬度(幾個方塊)
            //   childAspectRatio: 2/3,//只能調整寬長比，寬是固定的
            //   children: List.generate(100, (index) {
            //     return Card(
            //         child: Container(
            //           color: Colors.green,
            //           child: Text('Index:$index'),
            //     )
            //   );
            //   }),
            // )
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  //調整寬度
                  maxCrossAxisExtent: 400,
                  // childAspectRatio: 2/3,
                ),
                // const SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 2,
                //   childAspectRatio: 2/3,
                //   ),
                itemBuilder: (context, index) {
                  return Card(
                      child: Container(
                    color: Colors.green,
                    child: Text('Index:$index'),
                  ));
                }));
  }
}


//--------------------------------------------
//點選底下icon做畫面切換
class changscreenMyApp extends StatefulWidget {//點擊icon畫面切換
  @override
  _MAppState createState() => _MAppState();
}

class _MAppState extends State<changscreenMyApp> {//點擊icon畫面切換
  int index = 0;
  List<Widget> pages = [
    Container(color: Colors.red),
    Container(color: Colors.yellow,),
    Container(color: Colors.blue,),
    Container(color: Colors.green,),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyApp Demo'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (int idx){
          setState(() {
            index = idx;
          });
        },
        items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.add,color: Colors.black87,), 
          label: 'Add',
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle,color: Colors.black87,), 
          label: 'Account'
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.close,color: Colors.black87,), 
          label: 'Close'),
        BottomNavigationBarItem(
          icon: Icon(Icons.build,color: Colors.black87,),
          label: 'Build'),
      ],
       selectedLabelStyle:  const TextStyle ( // 選中狀態下
        color: Colors.blue,
        fontSize: 20, 
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle( // 未選中狀態下
        color: Colors.grey, 
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      ),
      body: pages[index],
    );
  }
}
//--------------------------------------------


//----------------------------------------------------------
//從 Page2 返回時，Page1 中的 _displayText 變數將更新為 Page2 返回的值
class MyAppchangepage extends StatefulWidget {
  @override
  _MApp2State createState() => _MApp2State();
}

class _MApp2State extends State<MyAppchangepage> {
  // 全局變數用來存儲要顯示在body中的值
  String _displayText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page1'),),
      body: Container(
        color: Colors.red,
        child: Text(_displayText),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        // Navigator.pushNamed(context, '/page2');
        
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context){
            return Page2(textData: _displayText);
        })).then((value){
            // 接收從 Page2 返回的 value
            setState(() {
            _displayText = value ?? ''; // 如果 value 為 null，則設置為空字符串
        });
      });
    }));
  }
}
class Page2 extends StatelessWidget {
  final String? textData;//安全性null修正: String 要?//被聲明為選擇性的
  Page2({Key? key,@required this.textData}):super(key: key);//安全性null修正: Key 要?
  //key 參數是選擇性的// textData 參數使用了 @required 註釋，表示這個參數是必需的，不能是空值
  //選擇性 Key 主要用於特殊情況，例如動態生成小部件列表時，可以將它們與特定的 Key 關聯
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page2'),),
      body: SizedBox.expand(child: Container(
        color: Colors.green,
        child: Text('$textData'),//安全性null修正: $textData略過默認允許null
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pop(context,'ppppppp');
      },),
    );
  }
}
//---------------------------------------------------


//----------------------------------------------------------
//運用api,還有和Http網路連接
//有兩種方法，//是FutureBuilder
class Myhomeapi extends StatefulWidget {
  @override
  _MhomeapiState createState() => _MhomeapiState();
}

class _MhomeapiState extends State<Myhomeapi> {
  final String host = 'https://jsonplaceholder.typicode.com/posts';
  List datas=[];
  @override
  void initState(){
    super.initState();
  }

  // getData()async{
  //   var response = await http.get(Uri.parse(host));
  //   print(response.body);
  // }

  getData(){
    http.get(Uri.parse(host)).then((response){
      setState(() {
        datas = jsonDecode(response.body);
      });
      //print(datas.length);
    });
  }

  // getData(){
  //   return http.get(Uri.parse(host));
  // }


  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Http+FutterBuilder'),
      ),
      // body: 
      // FutureBuilder(
      //   future: getData(),
      //   builder: (context,snap){
      //   if(!snap.hasData){
      //     return Container();
      //   }

      //   http.Response response = snap.data as http.Response;
      //   List datas = jsonDecode(response.body);

      //   return ListView.builder(
      //   itemCount: datas.length,
      //   itemBuilder: (context,idx){
      //     var data = datas[idx];
      //     return ListTile(
      //       title: Text(data['title']),
      //       subtitle: Text(data['body']),
      //       );
      //   },
      // );
      // }),
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context,idx){
          var data = datas[idx];
          return ListTile(
            title: Text(data['title']),
            subtitle: Text(data['body']),
            );
        },
      )
    );
  }
}
// -----------------------------------------------------


//-------------------------------------------------------------
//資料庫的使用
class MyAppsql extends StatefulWidget {
  @override
  _MAppsqlState createState() => _MAppsqlState();
}

class _MAppsqlState extends State<MyAppsql> {
  final String url = 'https://jsonplaceholder.typicode.com/posts';
  final sqlhelp = SqliteHelper();

  getallpost()async{
    await sqlhelp.open();
    return await sqlhelp.queryall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //網路上抓資料寫進資料庫
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.http),
        onPressed: ()async{
          await sqlhelp.open();
          var response = await http.get(Uri.parse(url));//因為是非同步，所以要加await
          List datas = jsonDecode(response.body);//必須轉換格式
          datas.forEach((element) async {
            return await sqlhelp.insert(element);
          });
          // datas.forEach((element) async => sqlhelp.insert(element));
          setState(() {
            
          });
      }),
      appBar: AppBar(
        title: Text('Sqlite in flutter'),
      ),
      body: FutureBuilder(
        //抓取資料庫的資料呈現出來
        future: getallpost(),
        builder: (context,snapshot){//AsyncSnapshot 是一個用於表示異步操作快照的物件
          if(snapshot.hasData){
            List datas = snapshot.data as List;
            return ListView.builder(
              itemCount: datas.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: ()async{//游標點下去就進行刪除
                    await sqlhelp.delere(datas[index]['id']);
                    setState(() {
                      //資料更動後，記得更新畫面
                    });
                  },
                  child:ListTile(
                    title: Text(datas[index]['title']),),);
            });
          }
          return Container();
      }),
    );
  }
}
//---------------------------------------------------------


//---------------------------------------------------------
//連接網路下載圖片，第二次開啟app時，不用網路也能看到圖片(有判斷是否已經下載過讀片)
//自己寫的半殘版
class MyAppnowifiimage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CacheImage("https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Projects/Outlet/Amazon_OutletDeals_Desktop_TW.jpg"  ),
      ),
    );
  }
}
//----------------------------------------------------------


//---------------------------------------------------------
//連接網路下載圖片，第二次開啟app時，不用網路也能看到圖片(有判斷是否已經下載過讀片)
//官方的
class MyAppnowifiimageofficial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CachedNetworkImage(imageUrl: 'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Projects/Outlet/Amazon_OutletDeals_Desktop_TW.jpg',
        placeholder: (context,url) => new CircularProgressIndicator(),
        errorWidget: (context,url,error) => new Icon(Icons.error)),
        ),);
  }
}
//----------------------------------------------------------


//---------------------------------------------------------
//影片撥放器
class MyAppvideo extends StatefulWidget {
  @override
  _MAppvideoState createState() => _MAppvideoState();
}
class _MAppvideoState extends State<MyAppvideo> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController=VideoPlayerController.networkUrl(
        Uri.parse('https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_5mb.mp4')
      );
      //因為回傳值是futrue builder，有無執行都是空值，所以使用stateful widget
      _videoPlayerController.initialize().then((_){
        setState(() {
          
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Video Player Demo'),
      ),
      body: //_videoPlayerController.value.isInitialized?
        AspectRatio( //控制影片比例
          aspectRatio: 1280/720,//原影片比例
          //_videoPlayerController.value.aspectRatio,//依據原始影片比例
          child: 
            //VideoPlayer(_videoPlayerController)//單純播放的框框

            Stack(//把不同的widget疊在一起
              children: <Widget>[
                VideoPlayer(_videoPlayerController),
                Positioned(
                  bottom: 0,//放在底部，指定子部件相對於 Stack 底部的偏移量為 0
                  child: Row(children: <Widget>[
                    GestureDetector(
                      child: const Icon(
                        Icons.play_arrow,
                        size: 40.0,
                        color: Colors.black,),
                      onTap: () {
                        setState(() {
                          _videoPlayerController.play();
                        });
                    },),//偵測滑鼠點到的位置
                    GestureDetector(
                      child: const Icon(
                        Icons.pause,
                        size: 40.0,
                        color: Colors.black,),
                      onTap: () {
                        setState(() {
                          _videoPlayerController.pause();
                        });
                    },)
                  ],),)
            ],)
          )
        //:Container(),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.play_arrow),
      //   onPressed: (){
      //     setState(() {
      //       _videoPlayerController.play();
      //     });
      //   },
      // ),
    );
  }
}
//----------------------------------------------------------


//---------------------------------------------------------
//取得parent的資料，資料必須在同一棵樹裡
//provider 提供只要在同一棵樹裡的widget都可以取得資料
//另外寫在flutter_provider_test
//----------------------------------------------------------


//---------------------------------------------------------
// PART1 (手動)
//json序列化(JSON Serialize)(JSON物件化)
//=>把json抓到的東西(list的map)變成獨立的一個class、物件
//=>運用在api資料複雜度高
//套用JSON_Serialize_module.dart這個自己寫的module
//避免ListTile Text出現空值
//不用記住key值(可能欄位很多，很多不同api)

//更詳細的futerbuilder用法
class Myhomeapijsonmanual extends StatefulWidget {
  @override
  _MhomeapijsonmanualState createState() => _MhomeapijsonmanualState();
}

class _MhomeapijsonmanualState extends State<Myhomeapijsonmanual> {
  final String host = 'https://jsonplaceholder.typicode.com/posts';
  List datas=[];
  @override
  void initState(){
    super.initState();
  }

  
  getData(){
    return http.get(Uri.parse(host));
  }


  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Http+FutterBuilder'),
      ),
      body: 
      FutureBuilder(
        future: getData(),
        builder: (context,snap){
        
        if(!snap.hasData){
          return Container();
        }
        
        http.Response response = snap.data as http.Response;
        List datas = jsonDecode(response.body);
        //把資料轉換成list，裡面有map物件(key-value的一種組合)

        return ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context,idx){
          Postmanual data =Postmanual.fromMap(datas[idx]);//不須去記住key值
          return ListTile(
            //用key的方式取到資料
            //Text裡面不能為空值
            title: Text(data.title),
            subtitle: Text(data.body),
            );
        },
      );
      }),
    );
  }
}
//----------------------------------------------------------


//---------------------------------------------------------
// PART2 (自動)
//json序列化(JSON Serialize)
class Myhomeapijsonauto extends StatefulWidget {
  @override
  _MhomeapijsonautoState createState() => _MhomeapijsonautoState();
}

class _MhomeapijsonautoState extends State<Myhomeapijsonauto> {
  final String host = 'https://jsonplaceholder.typicode.com/posts';
  List datas=[];
  @override
  void initState(){
    super.initState();
  }

  
  getData(){
    return http.get(Uri.parse(host));
  }


  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Http+FutterBuilder'),
      ),
      body: 
      FutureBuilder(
        future: getData(),
        builder: (context,snap){
        
        if(!snap.hasData){
          return Container();
        }
        
        http.Response response = snap.data as http.Response;
        List datas = jsonDecode(response.body);
        //把資料轉換成list，裡面有map物件(key-value的一種組合)

        return ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context,idx){
          //----------------------------------------------------
          //和上一個差在這裡(fromMap改成fromJson)
          Post data =Post.fromJson(datas[idx]);//不須去記住key值
          //----------------------------------------------------
          return ListTile(
            //用key的方式取到資料
            //Text裡面不能為空值
            title: Text(data.title),
            subtitle: Text(data.body),
            );
        },
      );
      }),
    );
  }
}
//----------------------------------------------------------


//---------------------------------------------------------
//togglebutton 用法
class MyApptogglebutton extends StatefulWidget {
  @override
  _MApptogglebuttonState createState() => _MApptogglebuttonState();
}
class _MApptogglebuttonState extends State<MyApptogglebutton> {

  List<String> toggleItem = [
    '又來了',
    '又去了',
    '又壞了',
    '又好了'
  ]; 

  List<bool> isSelected = [
    false,
    false,
    false,
    false
  ];

  String selectText = '';
  
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(title: const Text('ToggleButtons'),),
      body:
      Column(children: <Widget>[
        ToggleButtons(
          selectedBorderColor: Colors.lightBlue,

          isSelected: isSelected,
          onPressed: (index){
            isSelected[index] = isSelected[index]?false:true;
            selectText = '';
            //讓被選中的變為false，不被選中變true
            for(int i=0;i < toggleItem.length;i++){
              if(isSelected[i]) selectText = '$selectText${toggleItem[i]},';
            }
            setState(() {
            
            });
          },

          children: List.generate(toggleItem.length, (index){
            return Text(toggleItem[index]);
          }), 
          ),
          SelectableText(selectText)
      ],)
    );
  }
}
//-----------------------------------------------------

//---------------------------------------------------------
//使用BLOC讓運作層和UI層分開(以JSON Serialize作範例)
//InheritedWidget 使不同的檔案可以共用同樣的物件(以BLOC/post_provider.dart作範例)
//把PostProvider放在MaterialApp上面，所有的widget都可以使用
//同時在另一個檔案post_detail.dart也可使用
//* 點擊標題，跳出另外一頁並顯示這個標題的內容(標題放到appbar上)
//* post_detail.dart的畫面是點擊後跳出來的畫面
//有用到BLOC folder(post_bloc.dart、post_provider.dart)和post_detail.dart
class MyhomeBLOC extends StatefulWidget {
  @override
  _MhomeBLOCState createState() => _MhomeBLOCState();
}

class _MhomeBLOCState extends State<MyhomeBLOC> {
  
  PostBloc _postbloc = PostBloc();

  List datas=[];
  @override
  void initState(){
    super.initState();
  }

  //是 State 對象的一個生命周期方法，它會在依賴的資料發生變化時被調用
  //資料或設置發生變化時執行必要的操作，以確保界面的同步性
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _postbloc = PostProvider.of(context);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http+FutterBuilder'),
      ),
      body: 
      FutureBuilder(
        future: _postbloc.getData(),
        builder: (context,snap){
        
        if(!snap.hasData){
          return Container();
        }
        
        http.Response response = snap.data as http.Response;
        List datas = jsonDecode(response.body);
        //把資料轉換成list，裡面有map物件(key-value的一種組合)

        return ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context,idx){
          //----------------------------------------------------
          //和上一個差在這裡(fromMap改成fromJson)
          Post data =Post.fromJson(datas[idx]);//不須去記住key值
          //----------------------------------------------------
          return InkWell( //可以按下去的事件
            onTap: (){//被按到的post存到bloc
              _postbloc.selectedPost = data;
              //存好就傳到post_detail.dart的畫面
              
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PostDetail()));
              //.push()這行程式碼的作用是在當前畫面之上打開一個新的畫面，
              //新畫面的內容由 PostDetail 組件來定義。(MaterialPageRoute 來定義新的畫面。)
              //當新畫面推送到導航堆疊中後，用戶可以在新畫面上進行操作，
              //並且可以使用導航返回到前一個畫面。
            },
            child: ListTile(
              //用key的方式取到資料
              //Text裡面不能為空值
              title: Text(data.title),
              //subtitle: Text(data.body),
            ));
        },
      );
      }),
    );
  }
}


//---------------------------------------------------------
//bloc_pattern 狀態管理
//另外寫在flutter_bloc_pattern_test
//利用bloc_pattern(這個別人寫好的package)的blocProvider，讓不同的檔案可以共用同樣的物件
//實現相同的值可以呈現在不同頁面
//---------------------------------------------------------