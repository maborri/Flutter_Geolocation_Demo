import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Menu Driver'),
      ),
      body: Container(
        color: Color(0xfff5f5f5),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 14.0),
                child: Text(
                  'YOUR ROUTE:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 8,
                      child: Container(
                        padding: const EdgeInsets.all(24.0),
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 6.0),
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Bk Demo 1',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  VerticalDivider(
                                    color: Colors.black,
                                  ),
                                  Row(
                                    children: [
                                      Text('ViewMap'),
                                      SizedBox(width: 6.0),
                                      Icon(Icons.map_rounded),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      elevation: 8,
                      child: Container(
                        padding: const EdgeInsets.all(24.0),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 6.0),
                            Text(
                              'Order No. 2',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Divider(),
                            SizedBox(height: 12.0),
                            Row(
                              children: [
                                Text('Order Status: '),
                                Text(
                                  'Pickup',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.0),
                            Text('Company: Some Company '),
                            SizedBox(height: 12.0),
                            Text('Customer Name: John Doe'),
                            SizedBox(height: 12.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RaisedButton(
                                  color: Colors.orangeAccent[100],
                                  onPressed: () {},
                                  child: Text('View Map'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RaisedButton(
                                  color: Colors.orangeAccent[100],
                                  onPressed: () {},
                                  child: Text('View Details'),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RaisedButton(
                                  color: Colors.orangeAccent[400],
                                  onPressed: () {},
                                  child: Text('End Delivery'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
