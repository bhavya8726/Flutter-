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

class _textState extends State<text> {

  TextEditingController controller=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController number=TextEditingController();
  TextEditingController address=TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("my_appbar"),),
        body: Form(
          key: formKey,
          child: Padding(
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
                  validator: (value){
                    if(value == null||value.isEmpty)
                    {
                      return 'plz enter your name';
                    }
                    final pattern=RegExp(r'^[a-zA-z]+$');
                    if(!pattern.hasMatch(value))
                    {
                      return 'plz enter alphabets';
                    }
                    return null;
                  },
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
                  validator: (value){
                    if(value == null||value.isEmpty)
                    {
                      return 'plz enter your email';
                    }
                    final pattern=RegExp(r'^[a-zA-Z0-9. _%+-]+@[a-zA-Z0-9]$');
                    if(!pattern.hasMatch(value))
                    {
                      return 'plz enter email';
                    }

                    return null;
                  },
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
                  validator: (value){
                    if(value == null||value.isEmpty)
                    {
                      return 'plz enter your number';
                    }
                    final pattern=RegExp(r'^[0-9]{10}$');
                    if(!pattern.hasMatch(value))
                    {
                      return 'plz enter number ans only 10 number allowed';
                    }
                    return null;
                  },
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
                  validator: (value){
                    if(value == null||value.isEmpty)
                    {
                      return 'plz enter your address';
                    }
                    final pattern=RegExp(r'^[a-zA-z0-9]+$');
                    if(!pattern.hasMatch(value))
                    {
                      return 'plz enter address';
                    }
                    return null;
                  },
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
                  if(formKey.currentState!.validate())
                  {
                    print('validated');
                  }
                  else
                  {
                    print('not validated');
                  }
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
      ),
    );
  }
}
