import 'package:baby/secrate_page/secret_gallery.dart';
import 'package:flutter/material.dart';

class SecreteHome extends StatefulWidget {
  const SecreteHome({Key? key}) : super(key: key);

  @override
  State<SecreteHome> createState() => _SecreteHomeState();
}

class _SecreteHomeState extends State<SecreteHome> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Secret'),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.all(30.0),
        child: Column(
          children: [
            SizedBox(height: 50,),
            InkWell(
              onTap: ()async{
                await Navigator.push(context, MaterialPageRoute(builder: (context)=>SecretGallery()));
              },
              child: Card(
                elevation: 50,
                shadowColor: Colors.black,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: const Center(child: Text(
                      'Gallery',style: TextStyle(fontStyle: FontStyle.italic,fontSize: 30.0),)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
