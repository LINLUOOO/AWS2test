import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/resource.dart';
import 'package:frontend/util/url_launch_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

class resourcedetail extends StatefulWidget {
  final Resource _resource;
  const resourcedetail(this._resource);

  @override
  _resourcedetailState createState() => _resourcedetailState(_resource);
}

class _resourcedetailState extends State<resourcedetail> {
  var _resourceState;
  _resourcedetailState(this._resourceState);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBaorder: true,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            leading: BackButton(color: Colors.black),
            centerTitle: true,
            title:
                Text("Resource Details", style: TextStyle(color: Colors.black)),
            backgroundColor: Color.fromARGB(255, 135, 193, 218),
            brightness: Brightness.light,
//            backgroundColor: Colors.transparent,
            elevation: 0.5,
          )),
      body: new Builder(builder: (BuildContext context) {
        return new Container(
            margin: const EdgeInsets.all(8.0),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            child: _buildCard(_resourceState.name, _resourceState.website));
      }),
    );
  }

  Widget _buildCard(String name, String url) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          children: [
            TableRow(children: [
              ListTile(
                title: Text(name,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Arial",
                        fontWeight: FontWeight.bold)),
              ),
            ]),
            url != null
                ? TableRow(children: [
                    ListTile(
                        title: Text(url.toString(),
                            style:
                                TextStyle(fontSize: 17.5, fontFamily: "Arial")),
                        trailing: url.startsWith('https://')
                            ? Icon(Icons.public)
                            : null,
                        onTap: () {
                          launchURL(url);
                        }),
                  ])
                : TableRow(children: [
                    ListTile(
                      title: Text("No details yet",
                          style:
                              TextStyle(fontSize: 17.5, fontFamily: "Arial")),
                    ),
                  ]),
          ],
        ));
  }
}
