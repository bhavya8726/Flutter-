import 'package:flutter/material.dart';
void main()
{
  runApp(login());
}

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  TextEditingController name=TextEditingController();
  TextEditingController password=TextEditingController();
  final formKey = GlobalKey<FormState>();
 var obsurePassword=true;
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
            controller: name,
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
                  obscureText: obsurePassword,
                  decoration:InputDecoration(
                    suffixIcon: IconButton(
                      icon:Icon (obsurePassword ? Icons.visibility_off:Icons.visibility),
                      onPressed:(){
                        setState(() {
                          obsurePassword=!obsurePassword;
                        });
                      } ,
                    ),
                      labelText: 'password *',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                ),
                  textAlign: TextAlign.center,
                  controller: password,
                  validator: (value){
                    if(value == null||value.isEmpty)
                    {
                      return 'plz enter your password';
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

                },child:Text("submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}