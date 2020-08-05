import 'package:audio_player_stage/demo.dart';
import 'package:audio_player_stage/form_inputs/checkbox_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/scheduler.dart' show timeDilation;

import 'components/section_title.dart';
import 'components/stack_pages_route.dart';
import 'components/submit_button.dart';
import 'demo_data.dart';
import 'form_inputs/dropdown_menu.dart';
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

    List<String> categories = [
    '1 H',
    '45 M',
  ];
  String _chosenValue = '1 H';

  SharedFormState formState;
  Map<String, String> get values => formState.valuesByName;
  String get _selectedCountry => _getFormValue(FormKeys.country);

  //String _country;
  ValueNotifier<String> _country;
  String _countrySubdivisionKey;
  List<String> _countries;

  @override
  void initState() {
    super.initState();
    _countries = CountryData.getCountries();
    formState = Provider.of<SharedFormState>(context, listen: false);
    if (!values.containsKey(FormKeys.country)) {
      // if not value, set default country
      _country = ValueNotifier(_countries[2]);
      values[FormKeys.country] = _country.value;
    }
    _updateCountrySubdivision(_selectedCountry);
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuilding information @ ${DateTime.now().millisecondsSinceEpoch}");
    return FormPage(
      formKey: _formKey,
      isHidden: widget.isHidden,
      pageSizeProportion: widget.pageSize ?? 0.85,
      title: 'annonce etape 2',
      children: <Widget>[
        FormSectionTitle("Quel type de cours souhaitez-vous donner?"),
            SizedBox(height: 15),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      color: singleCourMode ? Colors.green : Styles.darkGrayColor.withOpacity(.3),
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
                      color: multiCourMode ? Colors.green : Styles.darkGrayColor.withOpacity(.3),
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

            SizedBox(height: 20),

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
                      value: timeDilation != .1,
                      onChanged: (bool value) {
                        setState(() {
                          timeDilation = value ? 1.0 : .1;
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
                      value: timeDilation != .2,
                      onChanged: (bool value) {
                        setState(() {
                          timeDilation = value ? 2.0 : .2;
                        });
                      },),
                  ),
                  // SizedBox(height:10),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
                  //     border: Border.all(color: Color(0xffd4d4d4)),
                  //     borderRadius: BorderRadius.all(Radius.circular(7),
                  //     ),
                  //   ),
                  //   child: CheckboxListTile(    
                  //     title: const Text("je peux donner des cours par webcam"),
                  //     value: timeDilation != .3,
                  //     onChanged: (bool value) {
                  //       setState(() {
                  //         timeDilation = value ? 3.0 : .3;
                  //       });
                  //     },),
                  // ),
                ],
              ),
            ),
            ],),//


            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children :[
            FormSectionTitle("Votre tarrif et votre numéro ?"),
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 20),
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.width / 1.8,
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

            SizedBox(
              height: 20,
            ),

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
            ),

              ]
            ),

 

        SubmitButton(
            // isErrorVisible: isFormErrorVisible,
            child: Text('Next', style: Styles.submitButtonText),
            percentage: formCompletion,
            onPressed: () => _handleSubmit(context)),
      ],
    );
  }
  
  DropdownMenu _buildSubdivisionDropdown() {
    return DropdownMenu(
        key: ValueKey(_countrySubdivisionKey),
        label: _countrySubdivisionKey,
        defaultOption: _getFormValue(_countrySubdivisionKey),
        options: CountryData.getSubdivisionList(_countrySubdivisionKey),
        onValidate: onItemValidate);
  }

  List<Widget> _buildCountrySpecificFormElements() {
    var postalTitle = _selectedCountry == "United States" ? "Zip Code" : "Postal Code";
    List<Widget> elements = [];
    switch (_selectedCountry) {
      case 'United States':
      case 'Canada':
        elements = [
          _buildText(FormKeys.firstName),
          _buildText(FormKeys.lastName, required: true),
          _buildText(FormKeys.address, required: true),
          _buildText(FormKeys.apt, title: "Apartment, suite, etc."),
          _buildText(FormKeys.city, required: true),
          _buildSubdivisionDropdown(),
          _buildText(FormKeys.postal, title: postalTitle, required: true),
        ];
        break;
      case 'Japan':
        elements = [
          _buildText(FormKeys.company),
          _buildText(FormKeys.lastName, required: true),
          _buildText(FormKeys.firstName),
          _buildText(FormKeys.postal, title: postalTitle, required: true),
          _buildSubdivisionDropdown(),
          _buildText(FormKeys.city, required: true),
          _buildText(FormKeys.address, required: true),
          _buildText(FormKeys.apt, title: "Apartment, suite, etc."),
        ];
        break;
      case 'France':
        elements = [
          _buildText(FormKeys.firstName),
          _buildText(FormKeys.lastName, required: true),
          _buildText(FormKeys.company),
          _buildText(FormKeys.address, required: true),
          _buildText(FormKeys.apt, title: "Apartment, suite, etc."),
          _buildText(FormKeys.postal, title: postalTitle, required: true),
          _buildText(FormKeys.city, required: true),
        ];
        break;
    }
    return elements;
  }

  TextInput _buildText(String key, {String title, bool required = false, InputType type = InputType.text}) {
    title = title ?? _snakeToTitleCase(key);
    // Register the input validity
    if (!validInputsMap.containsKey(key)) validInputsMap[key] = !required;
    return TextInput(
      key: ValueKey(key),
      helper: title,
      type: type,
      initialValue: _getFormValue(key),
      onValidate: onItemValidate,
      onChange: onItemChange,
      isRequired: required,
      valueNotifier: _country,
    );
  }

  @override
  void onItemValidate(String key, bool isValid, {String value}) {
    // update the input validity
    validInputsMap[key] = isValid;
    bool hasChanged = values[key] != value;
    values[key] = value;
    // on country updated
    if (key == FormKeys.country && hasChanged) {
      _country.value = value;
      validInputsMap.clear();
      _updateCountrySubdivision(value);
      onItemChange(key, value);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        formCompletion = countValidItems() / validInputsMap.length;
        if (formCompletion == 1) isFormErrorVisible = false;
      });
    });
  }

  @override
  //Update cached values each time the form changes
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

  void _updateCountrySubdivision(String country) {
    //Invalidate input maps
    validInputsMap.clear();
    //Get the key for this country
    _countrySubdivisionKey = CountryData.getSubdivisionTitle(country);
    //Select default is nothing is currently set
    if (!values.containsKey(_countrySubdivisionKey) && _countrySubdivisionKey.isNotEmpty) {
      values[_countrySubdivisionKey] = CountryData.getSubdivisionList(_countrySubdivisionKey)[0];
    }
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