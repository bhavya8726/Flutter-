import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(text());
}

class text extends StatefulWidget {
  const text({super.key});

  @override
  State<text> createState() => _textState();
}
TextEditingController controller=TextEditingController();
TextEditingController email=TextEditingController();
TextEditingController number=TextEditingController();
TextEditingController address=TextEditingController();

class _textState extends State<text> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("my_appbar"),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                decoration:InputDecoration(
          alignLabelWithHint: true,
                  labelText: 'Name *',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                ),
                textAlign: TextAlign.center,
                controller: controller,
                onChanged: (value)
                {
                  setState(() {

                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration:InputDecoration(
                    labelText: 'email *',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                ),
                textAlign: TextAlign.center,
                controller: email,
                onChanged: (value)
                {
                  setState(() {

                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration:InputDecoration(

                    labelText: 'phone_number *',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                ),
                textAlign: TextAlign.center,
                controller: number,
                onChanged: (value)
                {
                  setState(() {

                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration:InputDecoration(

                    labelText: 'address *',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                ),
                textAlign: TextAlign.center,
                controller: address,
                onChanged: (value)
                {
                  setState(() {

                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed:(){
                setState(() {

                });
                controller.clear();
                number.clear();
                email.clear();
                address.clear();
              },child:Text("submit"))
              ],
          ),
        ),
      ),
    );
  }
}
