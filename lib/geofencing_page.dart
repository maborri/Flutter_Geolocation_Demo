import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geofence_flutter/geofence_flutter.dart';
import 'package:menu_demo/login_page.dart';

class GeofencingPage extends StatefulWidget {
  GeofencingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GeofencingPageState createState() => _GeofencingPageState();
}

class _GeofencingPageState extends State<GeofencingPage> {
  GeofenceEvent _geofenceEvent;
  StreamSubscription<GeofenceEvent> _geofenceEventStream;
  TextEditingController _latitudeController = TextEditingController();
  TextEditingController _longitudeController = TextEditingController();
  TextEditingController _radiusController = TextEditingController();

  @override
  void dispose() {
    _geofenceEventStream.cancel();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _radiusController.dispose();
    super.dispose();
  }

  Color _getBorderColor() {
    Color color;
    switch (_geofenceEvent) {
      case GeofenceEvent.enter:
        color = Colors.green;
        break;
      case GeofenceEvent.exit:
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: 300,
                color: _getBorderColor(),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Geofence Event:  ${_geofenceEvent.toString()}',
                        ),
                        TextField(
                          controller: _latitudeController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter latitude',
                          ),
                        ),
                        TextField(
                          controller: _longitudeController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter longitude',
                          ),
                        ),
                        TextField(
                          controller: _radiusController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter radius meter',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                              child: Text("Start"),
                              onPressed: () {
                                Geofence.startGeofenceService(
                                    pointedLatitude: _latitudeController.text,
                                    pointedLongitude: _longitudeController.text,
                                    radiusMeter: _radiusController.text,
                                    eventPeriodInSeconds: 10);
                                if (_geofenceEventStream == null) {
                                  _geofenceEventStream =
                                      Geofence.getGeofenceStream()
                                          .listen((GeofenceEvent event) {
                                    setState(() {
                                      _geofenceEvent = event;
                                    });
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 200,
                child: Card(
                  child: Center(
                    child: RaisedButton(
                      child: Text('Go to UI demo >'),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => LoginPage(),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
