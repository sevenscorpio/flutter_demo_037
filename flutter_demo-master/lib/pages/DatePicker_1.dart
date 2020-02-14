
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class DatePickerPage extends StatefulWidget {
  DatePickerPage({Key key}) : super(key: key);

  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  var _nowDate = DateTime.now();

  var _nowTime = TimeOfDay(hour: 12, minute: 30);

  _showDatePicker() async {
    // showDatePicker(
    //   context: context,
    //   initialDate: _nowDate,
    //   firstDate: DateTime(1980),
    //   lastDate: DateTime(2100),
    // ).then((result){
    //   print(result);
    // });

    var result = await showDatePicker(
      context: context,
      initialDate: _nowDate,
      firstDate: DateTime(1980),
      lastDate: DateTime(2100),
    );

    print(result);

    setState(() {
      _nowDate = result;
    });
  }

  _showTimePicker() async{

    var result = await showTimePicker(
      context: context,
      initialTime: _nowTime,

    );

    setState(() {
      _nowTime = result;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(formatDate(
        _nowDate, [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('datePickerPage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(formatDate(_nowDate, [yyyy, '年', mm, '月', dd, '日'])),
                Icon(Icons.arrow_drop_down),
              ],
            ),
            onTap: _showDatePicker,
          ),

          SizedBox(width: 40,),

          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('${_nowTime.format(context)}'),
                Icon(Icons.arrow_drop_down),
              ],
            ),
            onTap: _showTimePicker,
          ),
            ],
          )
        ],
      ),
    );
  }
}
