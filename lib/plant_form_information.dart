import 'package:audio_player_stage/components/section_separator.dart';
import 'package:audio_player_stage/demo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/scheduler.dart' show timeDilation;

import 'components/section_title.dart';
import 'components/stack_pages_route.dart';
import 'components/submit_button.dart';
import 'demo_data.dart';
import 'form_inputs/text_input.dart';
import 'form_mixin.dart';
import 'form_page.dart';
import 'plant_form_payment.dart';
import 'plant_form_summary.dart';
import 'styles.dart';

class PlantFormInformation extends StatefulWidget {
  final double pageSize;
  final bool isHidden;

  const PlantFormInformation({Key key, this.pageSize, this.isHidden = false}) : super(key: key);

  @override
  _PlantFormInformationState createState() => _PlantFormInformationState();
}

class _PlantFormInformationState extends State<PlantFormInformation> with FormMixin {
  final _formKey = GlobalKey<FormState>();
  bool isSelected = false;
  bool singleCourMode = false;
  bool multiCourMode = false;
  String radioItem = '';
  String radioItem1 = '';
  String radioItem2 = '';

  bool isOffert = true;
  bool isDomicile = false;
  bool isStudent = true;
  bool isWebcam = false;

    List<String> categories = [
    '1 H',
    '45 M',
  ];
  String _chosenValue = '1 H';

  SharedFormState formState;
  Map<String, String> get values => formState.valuesByName;

  @override
  void initState() {
    super.initState();
    formState = Provider.of<SharedFormState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return FormPage(
      formKey: _formKey,
      isHidden: widget.isHidden,
      pageSizeProportion: widget.pageSize ?? 0.85,
      title: 'annonce etape 2',
      children: <Widget>[
        FormSectionTitle("Quel type de cours souhaitez-vous donner?"),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,        
              children: <Widget>[
                Flexible(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        singleCourMode = !singleCourMode;
                      });
                    },
                    child: Card(
                      elevation: singleCourMode ? 15 : 0,
                      color: singleCourMode ? Styles.secondaryColor: Styles.darkGrayColor.withOpacity(.3),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: MediaQuery.of(context).size.height / 8,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(Icons.person, color: singleCourMode ? Colors.white : Colors.white),
                            Text('Cours individuel',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto'
                                ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        multiCourMode = !multiCourMode;
                      });
                    },
                    child: Card(
                      elevation: multiCourMode ? 15 : 0,
                      color: multiCourMode ? Styles.secondaryColor : Styles.darkGrayColor.withOpacity(.3),
                      child: Container(
                        // alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: MediaQuery.of(context).size.height / 8,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(Icons.people,color: singleCourMode ? Colors.white : Colors.white),
                            Text('Cours en groupe',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Separator(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            FormSectionTitle("Ou se deroule les cours"),
            Container(
              padding: EdgeInsets.only(top:10),
              color: Colors.white.withOpacity(.5),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
                      border: Border.all(color: Color(0xffd4d4d4)),
                      borderRadius: BorderRadius.all(Radius.circular(7),
                      ),
                    ),
                    child: CheckboxListTile(    
                      title: const Text("je peux encadrer l'élève à mon domicile"),
                      value: isDomicile,
                      onChanged: (bool value) {
                        setState(() {
                          isDomicile = value;
                        });
                      },),
                  ),
                  SizedBox(height:10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
                      border: Border.all(color: Color(0xffd4d4d4)),
                      borderRadius: BorderRadius.all(Radius.circular(7),
                      ),
                    ),
                    child: CheckboxListTile(    
                      title: const Text("je peux me déplacer chez l'élève"),
                      value: isStudent,
                      onChanged: (bool value) {
                        setState(() {
                          isStudent = value;
                        });
                      },),
                  ),
                  SizedBox(height:10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
                      border: Border.all(color: Color(0xffd4d4d4)),
                      borderRadius: BorderRadius.all(Radius.circular(7),
                      ),
                    ),
                    child: CheckboxListTile(    
                      title: const Text("je peux donner des cours par webcam"),
                      value: timeDilation != .3,
                      onChanged: (bool value) {
                        setState(() {
                          timeDilation = value ? 3.0 : .3;
                        });
                      },),
                  ),
                ],
              ),
            ),
            ],),//


           Separator(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children :[
            FormSectionTitle("Votre tarrif et votre numéro ?"),
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 20),
                    height: MediaQuery.of(context).size.height / 12,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          bottomLeft: Radius.circular(7),
                        )),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          hintText: '2500', border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                      color: Styles.accanceColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )),
                  child: Text(
                    'Frs/h',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),

              ]
            ),

           Separator(),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            FormSectionTitle("Offrir Son premier Cour "),

            // Container(
            //     padding: EdgeInsets.all(20),
            //     child: Text(
            //       "Offrir son premier cour histoir de donné confiance ,bien possé les bases du cour avec votre éleve ",
            //       style: TextStyle(color: Colors.grey, fontSize: 13),
            //     )),
            Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
                border: Border.all(color: Color(0xffd4d4d4)),
                borderRadius: BorderRadius.all(Radius.circular(7),)
              ),
              child: CheckboxListTile(    
                      title: const Text("Oui je souhaite offrir ma premierre sceance de cour"),
                      value: isOffert,
                      onChanged: (bool value) {
                        setState(() {
                          isOffert = value;
                        });
                      },),
            ),
            SizedBox(height:10),
            Container(
              // padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 12,
                      decoration: BoxDecoration(
                          // color: Styles.accanceColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          )),
                      child: Text(
                          "premier cour offert pour ",style:TextStyle(color: Styles.secondaryColor),),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
                          border: Border.all(color: Color(0xffd4d4d4)),
                          borderRadius: BorderRadius.all(Radius.circular(7),)
                        ),
                      child: Center(
                        child: DropdownButton<String>(
                          value: _chosenValue,
                          // underline: Container(), // this is the magic
                          items: <String>[
                            '00 H',
                            '1 H',
                            '45 M',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    color: Styles.accanceColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                          onChanged: (String value) {
                            setState(() {
                              _chosenValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),]),

        SubmitButton(
            isErrorVisible: isFormErrorVisible,
            child: Text('Next', style: Styles.submitButtonText),
            onPressed: () => _handleSubmit(context)),
      ],
    );
  }



  TextInput _buildText(String key, {String title, bool required = false, InputType type = InputType.text}) {
    title = title ?? _snakeToTitleCase(key);
    if (!validInputsMap.containsKey(key)) validInputsMap[key] = !required;
    
    return TextInput(
      key: ValueKey(key),
      helper: title,
      type: type,
      initialValue: _getFormValue(key),
      onValidate: onItemValidate,
      onChange: onItemChange,
      isRequired: required,
    );
  }

  @override
  void onItemValidate(String key, bool isValid, {String value}) {

  }

  @override
  void onItemChange(String key, String value) {
    values[key] = value;
  }

  String _snakeToTitleCase(String value) {
    String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
    List<String> words = value.split("_");
    words = words.map((w) => capitalize(w)).toList();
    return words.join(" ");
  }

  String _getFormValue(String name) {
    return values.containsKey(name) ? values[name] : "";
  }


  void _handleSubmit(BuildContext context) {
    // if (_formKey.currentState.validate() && formCompletion == 1) {
      if(true){
      Navigator.push(
          context,
          StackPagesRoute(previousPages: [
            PlantFormSummary(isHidden: true, pageSize: .85),
            PlantFormInformation(isHidden: true, pageSize: .85),
          ], enterPage: PlantFormPayment()));
    } else
      setState(() {
        isFormErrorVisible = true;
      });
  }
}