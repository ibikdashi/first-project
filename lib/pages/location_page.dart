import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:linkable/linkable.dart';
import 'Services/assets.dart';
import 'Services/location_const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_whatsapp/open_whatsapp.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  Completer<GoogleMapController> _controller =Completer();
  final List<Marker> _markers = [];
  static final CameraPosition _klebanon = CameraPosition(
      target: LatLng(33.888630, 35.495480),
      zoom: 8);
  static final CameraPosition _kKalmoun =CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(34.38668688427941, 35.78944614554344),
      tilt: 59.440717697143555,
      zoom: 10);
  static final CameraPosition _kRafid =CameraPosition(
    //bearing: 192.8334901395799,
      target: LatLng(33.561059, 35.828203),
      tilt: 59.440717697143555,
      zoom: 10);
  static final CameraPosition _kHO =CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(33.8798177563203, 35.5030985419656),
      tilt: 59.440717697143555,
      zoom: 12);
  void _onMapCreated(GoogleMapController controller) {_controller.complete(controller);}
  int k=0;
  void initState() {
    // TODO: implement initState
    super.initState();
    for (LatLng markerLocation in markerLocations) {

      if(k < branchname.length){
        _markers.add(Marker(
          markerId: MarkerId(markerLocations.indexOf(markerLocation).toString()),
          //position: LatLng(33.874052, 35.496465),
          position: markerLocation,
          draggable: false,
          infoWindow: InfoWindow(title: branchname[k], snippet: snippet[k]),
        ),);
        k++;
      }
    }
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  initialCameraPosition: _klebanon,
                  onMapCreated: _onMapCreated,
                  markers: Set.from(_markers),
                ),
              ),
              Divider(),
              Expanded(
                flex: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height-300,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: _goToHO,
                          child: Text('المركز الرئيسي',style:kLabelMapTextStyle ,),
                        ),
                        boxproduct(' شارع غريغوريس حداد،بربور، بيروت'),
                        Column(
                          children: [
                            PhoneBox(data:'هاتف:',number1:hophoneNumber[0],number2: hophoneNumber[1],number3: hophoneNumber[2],),
                          ],
                        ),
                        boxproduct('فاكس:  009611661631'),
                        // boxproduct('صندوق البريد 11-350 بيروت، لبنان'),
                        Divider(),
                        TextButton(
                          onPressed: _goToKalmoun,
                          child: Text('فرع القلمون - لبنان الشمالي',style:kLabelMapTextStyle ,),
                        ),
                        boxproduct('القلمون، لبنان '),
                        Text("هاتف:"+kalamounphoneNumber[0],textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: kLabelPhoneTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatButton.icon(onPressed:() {
                              FlutterOpenWhatsapp.sendSingleMessage('+96181250869', " ");},icon:FaIcon(FontAwesomeIcons.whatsapp,color: Colors.green,),label:Text("Whatsapp",textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: kLabelPhoneTextStyle,),),
                          ],
                        ),
                        Divider(),
                        TextButton(
                          onPressed: _goToRafid,
                          child: Text('مركز الرفيد- البقاع',style:kLabelMapTextStyle ,),
                        ),
                        boxproduct('الرفيد، لبنان'),
                        FlatButton.icon(onPressed:() {
                  FlutterOpenWhatsapp.sendSingleMessage(rafidinphoneNumber[0], "سلام عليك ");},icon:FaIcon(FontAwesomeIcons.whatsapp,color: Colors.green,),label:Text("Whatsapp",textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: kLabelPhoneTextStyle,),),
                        //Divider(),
                        // TextButton(
                        //   onPressed: _goToNorth,
                        //   child: Text('مركز الرفيد ',style:kLabelMapTextStyle ,),
                        // ),
                        // boxproduct('مبنى محمد حربا، الطابق الأول مستديرة النور، شارع البولفارد - طرابلس، لبنان'),
                        // PhoneBox(data: 'هاتف:',number1: tripoliphoneNumber[0],number2: tripoliphoneNumber[1],number3: tripoliphoneNumber[2],),
                        // Divider(),
                        // TextButton(
                        //     onPressed: _goToBikaa,
                        //     child: Text('المدينة الكشفية التربوية في البرجين',style:kLabelMapTextStyle ,),),
                        // boxproduct('برجين، لبنان '),
                        // PhoneBox(data: 'هاتف:',number1: tyrphoneNumber[0],number2: tyrphoneNumber[1]),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _goToKalmoun() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kKalmoun));
  }

  // Future<void> _goToAll() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_klebanon));
  // }

  // Future<void> _goToRafid() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kBikaa));
  // }

  Future<void> _goToRafid() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kRafid));
  }

  Future<void> _goToHO() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kHO));
  }

}
class PhoneBox extends StatelessWidget {
  PhoneBox({this.data,this.number1,this.number2, this.number3});
  final String number1;
  final String number2;
  final String number3;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Linkable(
                text:
                  number1.isNotEmpty? number1:"",
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: kLabelPhoneTextStyle,
              ),
              SizedBox(height: 20,),
              Linkable(
                text:
                    number3,
                  // number3.isNotEmpty?number3:"",
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: kLabelPhoneTextStyle,
              ),
              FlatButton.icon(onPressed:() {
                FlutterOpenWhatsapp.sendSingleMessage(hophoneNumber[1], "سلام عليك ");},icon:FaIcon(FontAwesomeIcons.whatsapp,color: Colors.green,),label:Text("Whatsapp",textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: kLabelPhoneTextStyle,),),
            ],
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            data,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: kLabelPhoneTextStyle,
          ),
        ],
      ),
    );
  }
}