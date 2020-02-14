import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class DatePickerPage extends StatefulWidget {
  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {

  DateTime _dateTime = DateTime.now();

  _showDatePicker() {

    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme.Default,
      minDateTime: DateTime.parse('1980-01-26'),
      maxDateTime: DateTime.parse('2100-01-26'),
      initialDateTime: _dateTime,
      dateFormat: 'yyyy年M月d日    EEE,H时:m分',
      pickerMode: DateTimePickerMode.datetime,
      locale: DateTimePickerLocale.zh_cn,
      onCancel: (){
        debugPrint('onCancel');
      },
      onChange: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日期演示界面'),
      ),

      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[

          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              InkWell(

                child: Row(

                  children: <Widget>[

                    Text("${formatDate(_dateTime, [yyyy, '年', mm, '月', dd, '日', '', HH, '时', nn, '分'])}"),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                onTap: _showDatePicker,
              )
            ],
          )
        ],
      ),
    );
  }
}