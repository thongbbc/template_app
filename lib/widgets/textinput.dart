import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<TextInput> {
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.supervised_user_circle,
            color: Colors.white,
          ),
          SizedBox(width: 15),
          Expanded(
            child: TextFormField(
              controller: _controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Username",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white54),
                labelStyle: TextStyle(color: Colors.white54),
                suffixIcon: _controller.text.length > 0
                    ? IconButton(
                        onPressed: () => _controller.clear(),
                        icon: Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
