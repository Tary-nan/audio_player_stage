import 'dart:io';

import 'package:audio_player_stage/demo.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'demo_data.dart';
import 'form_inputs/checkbox_input.dart';
import 'form_inputs/credit_card_input.dart';
import 'form_mixin.dart';
import 'form_page.dart';
import 'components/section_separator.dart';
import 'components/section_title.dart';
import 'styles.dart';
import 'components/submit_button.dart';
import 'form_inputs/text_input.dart';

class PlantFormPayment extends StatefulWidget {
  final double pageSize;

  const PlantFormPayment({Key key, this.pageSize}) : super(key: key);
  @override
  _PlantFormPaymentState createState() => _PlantFormPaymentState();
}

class _PlantFormPaymentState extends State<PlantFormPayment> /*with FormMixin*/ {
  final _formKey = GlobalKey<FormState>();
  // CreditCardNetwork _cardNetwork;

  // SharedFormState sharedState;
  // Map<String, String> get values => sharedState.valuesByName;

  @override
  void initState() {
    // sharedState = Provider.of<SharedFormState>(context, listen: false);
    super.initState();
  }

  File _image;
  bool _loadImage = false;
  // final picker = ImagePicker();
  Future getImageFromFils() async {
    try {
      setState(() {
        _loadImage = true;
      });
      // final pickedFile = await picker.getImage(source: ImageSource.gallery);
      // _image = File(pickedFile.path);
      print("Image From Galerie ${_image}");
      setState(() {
        _loadImage = false;
      });
    } catch (error) {
      print("Error to get Image from fils ${error.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuilding payments @ ${DateTime.now().millisecondsSinceEpoch}");
    return FormPage(
      formKey: _formKey,
      pageSizeProportion: widget.pageSize ?? 0.85,
      title: 'Soumettre',
      children: [

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            /*Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FAProgressBar(
                              progressColor: accanceColor,
                              currentValue: 100,
                              displayText: '%',
                              animatedDuration: Duration(seconds: 1),
                              maxValue: 100,
                            ),
                          ),*/
            /*Padding(
                            padding: EdgeInsets.all(8.0),
                            child: new LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width/1.1,
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 2000,
                              percent: 1.0,
                              center: Text("100.0%", style: TextStyle(
                                color: Colors.white
                              ),),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: accanceColor,
                            ),
                          ),*/

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Felicitations votre annonce est complète !!!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                    fontFamily: 'BAARS',
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
                padding: EdgeInsets.all(12),
                child: Text(
                  "Dernière petite chose : enrichissez la avec des recommandations d'amis, de collègues ou d'anciens élèves..."
                  "Plus vous en avez, plus elle sera appreciée et mieux elle sera positionnée .",
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                )),
            SizedBox(
              height: 16,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.2), width: 1)),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Styles.accanceColor,
                        shape: BoxShape.circle,)
                        // image: DecorationImage(
                        //     image: AssetImage('assets/images/books.jpg'),
                        //     fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'DAGOUAGA',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 18,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                        color: Styles.accanceColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      '100frs/h',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                        child: Text(
                      'Simplissime, demandez des recommandations à vos amis via :',
                      style: TextStyle(
                          fontFamily: 'BAARS',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black54),
                    )),
                  ),
                  // SocialBtn("SMS", Icons.message, Colors.green),
                  // SocialBtn("Mail", Icons.mail, Colors.pink),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(left: 10),
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(59, 89, 152, 1),
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'f',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Facebook',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'BAARS',
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                  // SocialBtn("Messenger", Icons.message,
                  //     Color.fromRGBO(93, 153, 251, 1)),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(left: 10),
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                          color: Styles.accanceColor,
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 18,
                            width: 18,
                            color: Colors.white,
                            child: Center(
                                child: Text(
                              'in',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Styles.accanceColor,
                                  fontSize: 15),
                            )),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Linkedin',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'BAARS',
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
            
             ],
        ),
     
        // TextInput(
        //     key: ValueKey(FormKeys.ccName), label: 'Card Name', helper: 'Cardholder Name', onValidate: onItemValidate, onChange: (String key, String value){
        //           print(key);
        //          print(value);


        //     },),
      
        _buildSubmitButton()
      ],
    );
  }

  onItemValidate(String key, bool isValid, {String value}){
    print("////////////////////////");
    print(key);
    print(isValid);
    print(value);

  }

  // @override
  // void onItemValidate(String key, bool isValid, {String value}) {
  //   validInputsMap[key] = isValid;
  //   values[key] = value;

  //   Future.delayed(
  //     Duration(milliseconds: 500),
  //     () {
  //       if (this.mounted)
  //         setState(() {
  //           formCompletion = super.countValidItems() / validInputsMap.length;
  //           if (formCompletion == 1) isFormErrorVisible = false;
  //         });
  //     },
  //   );
  // }

  // Widget _buildShippingSection() {
  //   return Column(children: <Widget>[
  //     Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Container(constraints: BoxConstraints(minWidth: 85), child: Text('Contact', style: Styles.orderLabel)),
  //         Text(values[FormKeys.email], overflow: TextOverflow.clip, style: Styles.orderPrice),
  //       ],
  //     ),
  //     Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 12.0),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: <Widget>[
  //           Container(constraints: BoxConstraints(minWidth: 85), child: Text('Ship to', style: Styles.orderLabel)),
  //           Text(_getShippingAddress(), overflow: TextOverflow.clip, style: Styles.orderPrice),
  //         ],
  //       ),
  //     ),
  //     Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Container(constraints: BoxConstraints(minWidth: 85), child: Text('Method', style: Styles.orderLabel)),
  //         Text('FREE', overflow: TextOverflow.clip, style: Styles.orderPrice),
  //       ],
  //     )
  //   ]);
  // }

  // String _getShippingAddress() {
  //   String aptNumber = values[FormKeys.apt].isNotEmpty ? '#${values[FormKeys.apt]} ' : '';
  //   String address = values[FormKeys.address];
  //   String country = values[FormKeys.country];
  //   String city = values[FormKeys.city];
  //   String countrySubdivision = values[CountryData.getSubdivisionTitle(country)] ?? '';
  //   String postalCode = values[FormKeys.postal];
  //   return '$aptNumber$address\n$city, $countrySubdivision ${postalCode.toUpperCase()}\n${country.toUpperCase()}';
  // }

  // Widget _buildInputWithButton() {
  //   return Row(
  //     children: <Widget>[
  //       Expanded(
  //           flex: 4,
  //           child: TextInput(
  //             helper: '000 000 000 XX',
  //             type: InputType.number,
  //             onValidate: (){},
  //             isRequired: false,
  //             isActive: false,
  //           )),
  //       Expanded(
  //         flex: 2,
  //         child: Padding(
  //           padding: const EdgeInsets.only(bottom: 26.0, left: 12),
  //           child: MaterialButton(
  //             disabledColor: Styles.lightGrayColor,
  //             elevation: 0,
  //             color: Styles.secondaryColor,
  //             height: 56,
  //             child: Text('Apply', style: Styles.submitButtonText),
  //             onPressed: null,
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  Widget _buildSubmitButton() {
    return SubmitButton(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Soumettre ', style: Styles.submitButtonText),
            Text('complet', style: Styles.submitButtonText),
          ],
        ),
      ),
      percentage: 1,
      isErrorVisible: false,
      onPressed: _handleSubmit,
    );
  }

  void _handleSubmit() {
    // if (_formKey.currentState.validate() && formCompletion == 1) {
    // } else
      // setState(() => isFormErrorVisible = true);
  }

  // void _handleItemChange(CreditCardNetwork cardNetwork) {
  //   setState(() => _cardNetwork = cardNetwork);
  // }

  // @override
  // void onItemChange(String name, String value) => values[name] = value;
}