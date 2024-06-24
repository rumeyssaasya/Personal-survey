import 'package:flutter/material.dart';
import 'package:personal_survey_homework_5/page2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key ?key }) : super(key: key);

   @override
   State<MyApp> createState() => _MyAppState();
  }
  class _MyAppState extends State<MyApp>{
    @override
    Widget build(BuildContext context){
       return MaterialApp(
         initialRoute: '/', //Hangi sayfadan başlayacağız
         routes: {
           '/':(context)=>Page1(),
           //'/secondPage':(context)=>Page2(), //sayfa2'ye ikincisayfa ismini kullanarak geçiş yapmak.
         },
         debugShowCheckedModeBanner: false //Demo yazısını kaladırır
       );
    }
}
         class Page1 extends StatefulWidget{
            Page1({Key ?key}): super(key:key);
            @override
            _Page1State createState() => _Page1State();
         }
          class _Page1State extends State<Page1>{
           String inputTextVal = '';
           TextEditingController passController = TextEditingController();
           String text='';
           bool _isChecked=false;
           bool _isSwitched=false;
           double _slideValue=0;
           var pass='';
           String _selectGender='none';
           bool _isTextEmpty=false;
           bool _isGenderEmpty =false;
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.white, //Arka plan rengini belirler
          appBar: AppBar( //app bar alanını açar
            title: Text(' Personal Survey '), //app bar için başlık yazılır
            backgroundColor: Color(
                0xffB1AFFF), //appbar arka plan rengini ayarlanır
          ),
          body: SizedBox( //app bar alt kısmı için body kısmını oluşturur
            width: MediaQuery
                .of(context)
                .size
                .width * 1, //body genişliğinin max olmasını sağlar
            child: Column( //kolon oluşturulur
              verticalDirection: VerticalDirection.down,
              //girilen bilgileri body içinde yukardan aşağı doğru sıralar
              mainAxisSize: MainAxisSize.max,
              //x ekseninde max büyüklüğü alır
              mainAxisAlignment: MainAxisAlignment.center,
              //kolonu ortalar
              crossAxisAlignment: CrossAxisAlignment.center,
              // çapraz çizgide satır ve kolon için ortalar
              children: [
                Padding( //padding text field için oluşturulur
                  padding: EdgeInsets.all(8.0),
                  //hepsi için yani tüm kenarlar için boşluk padding bırakır
                  child: TextField( //text field oluşturulur
                    cursorColor: Color(0xffBBE9FF),
                    //text field dışındaki çizgilerin rengini belirler
                    onChanged: (text) { //text değişimi sonucunda
                      setState(() {
                        pass = text; //yazılanı set eder
                        _isTextEmpty=false;
                      });
                    },
                    decoration: InputDecoration( // dekoru düzenlemek için kullanılır
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      filled: true,
                      // renk belirlemek için iç kutucuk yerinini ayarlar
                      fillColor: Color(0xffFFF6E9),
                      //rengi değiştirmek için kullanılır
                      hintText: 'Enter your name and lastname',
                      //hint olarak verilir
                      labelText: 'Name Lastname',
                      //field alanında basmadan önce text olarak gözüken kısım
                      suffixIcon: Icon(Icons.person), //sona gelen ikon
                    ),
                    controller: passController,
                    onTap: () {
                      print('Tapped to text field.');
                    },
                    //field alanına basıldığında
                    onEditingComplete: () {
                      print('Text writing is done.');
                    }, //yazı yazma bırakıldığında konsola yazar
                    //obscureText: true, pasword kullanılırken metni gizlemek için yani *** yapar
                  ),

                ),
                if (_isTextEmpty) // Eğer TextField boşsa hata mesajını göster
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Please fill the text area',
                    style: TextStyle(color: Color(0xffB1AFFF)),
                  ),
                ),
                Row(
                  children: [

                    Checkbox(value: _isChecked,
                      onChanged: (_dal) {
                        setState(() {
                          _isChecked = _dal!;
                          if (_isChecked)
                            print('Checkbox is checked.');
                        });
                      },
                      activeColor: Colors.cyan,
                      //check box rengi kutucuk dolduğundaki
                      focusColor: Colors.black45,
                    ),
                    Text('Are you an adult ? if yes check',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    //checkbox için text
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    value: _isSwitched,
                    onChanged: (SwitchData) {
                      setState(
                            () {
                          _isSwitched = SwitchData;
                        },
                      );
                    },
                    activeColor: Colors.white54,
                    title: Text(
                      'Are you smoking?',
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      'if yes switch it and how many are you smoking per a day',
                      style: TextStyle(color: Colors.black),
                    ),
                    tileColor: Color(0xffBBE9FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                Visibility(
                  visible: _isSwitched,
                  //switch olunca görünür olması için kullanılır
                  child: Slider( //switch check olunca slider açlır
                    value: _slideValue,
                    //değer atanır
                    activeColor: Colors.deepPurpleAccent,
                    //renk belirlenir
                    inactiveColor: Colors.blueGrey,
                    divisions: 40,
                    max: 40,
                    min: 0,
                    label: _slideValue.round().toString(),
                    onChanged: (slider) {
                      setState(() {
                        _slideValue = slider;
                      });
                    },
                  ),
                ),
                DropdownButton(
                  value: _selectGender,
                  onChanged: (_gender) {
                    setState(() {
                      _selectGender = _gender!;
                      _isGenderEmpty=false;
                    });
                  },
                  items: <DropdownMenuItem<String>>[
                    //drown down menu ayarlanır ve içinde ne yazılıyorsa string
                    DropdownMenuItem(
                        child: Text("Please select your gender "),
                        value: 'none'),
                    DropdownMenuItem(child: Text("Girl"), value: 'Woman'),
                    DropdownMenuItem(child: Text("Boy"), value: 'Man'),
                  ],
                ),
                if(_isGenderEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Please fill the gender area',
                      style: TextStyle(color: Color(0xffB1AFFF)),
                    ),
                  ),
                ElevatedButton( //belge gönderimi gerçekleştirmek için
                  onPressed: () {
                    setState(() {_isTextEmpty = pass.isEmpty;
                    _isGenderEmpty = _selectGender == 'none';

                    });
                    Route otherPage = MaterialPageRoute(
                        builder: (context) => Page2(
                          pass: pass,
                          isCheck:_isChecked,
                          selectGender: _selectGender,
                          isSwitched: _isSwitched,
                          slideValue: _slideValue,
                        )
                    );
                    if (!_isTextEmpty && !_isGenderEmpty) {
                      print('Survey sent');
                      Navigator.push(context, otherPage);
                    }
                  }, child: Text('Send Survey.'),

                ),
                SizedBox( //yükseklik belirlenir
                  height: 12,
                ),
                Divider(
                  height: 18,
                  color: Colors.deepPurple,
                ),
              ],
            ),
          ),
        );

      }
    }




