import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? True;
  HomeProvider? False;

  @override
  Widget build(BuildContext context) {
    True = Provider.of<HomeProvider>(context, listen: true);
    False = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Permission"),
          actions: [
            IconButton(
                onPressed: () async {
                  Map<Permission, PermissionStatus> map =
                      await [Permission.location, Permission.camera].request();

                  if (await Permission.camera.isDenied) {
                    print("Camera Deny");
                  }
                  if (await Permission.location.isDenied) {
                    print("location");
                  }
                },
                icon: Icon(Icons.settings)),
          ],
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  False!.getPositon();
                },
                child: Text("Locations")),
            SizedBox(
              height: 12,
            ),
            Text("latitude: ${True?.lat}"),
            SizedBox(
              height: 5,
            ),
            Text("longitude: ${True?.lon}"),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: False!.list.length,
                  itemBuilder: (Context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Address:- ${True?.list[0]}"),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
