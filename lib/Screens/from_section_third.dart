import 'dart:io';
import 'package:audio_player_stage/components/button_upload_diplome.dart';
import 'package:audio_player_stage/components/button_upload_photo.dart';
import 'package:audio_player_stage/components/section_separator.dart';
import 'package:audio_player_stage/components/section_title.dart';
import 'package:audio_player_stage/components/submit_button.dart';
import 'package:audio_player_stage/form_inputs/text_input.dart';
import 'package:flutter/material.dart';

import 'form_screen.dart';
import '../styles.dart';
class ThirdStepAnnonce extends StatefulWidget {
  final double pageSize;

  const ThirdStepAnnonce({Key key, this.pageSize}) : super(key: key);
  @override
  _ThirdStepAnnonceState createState() => _ThirdStepAnnonceState();
}

class _ThirdStepAnnonceState extends State<ThirdStepAnnonce> /*with FormMixin*/ {
  final _formKey = GlobalKey<FormState>();

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


     
        // TextInput(
        //     key: ValueKey(FormKeys.ccName), label: 'Card Name', helper: 'Cardholder Name', onValidate: onItemValidate, onChange: (String key, String value){
        //           print(key);
        //          print(value);


        //     },),
        _builProfil(),
         Separator(),
         Container(
           alignment: Alignment.topLeft,
           child: FormSectionTitle('Liens chaine Youtube')),
         _buildUrlChaineYoutube(),
         Separator(),
         Container(
           alignment: Alignment.topLeft,
           child: FormSectionTitle('Uploader Diplome, curriculome vitae ou certificat')),
          Container(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width / 3,
            height: 40,
            child: ButtonUploadDiplome(title: "upload", onPressed: (){},)),
          Separator(),
        _buildSubmitButton()
      ],
    );
  }

    Widget _buildUrlChaineYoutube()=> TextInput(onValidate: null, helper: 'https://www.youtube.com', isRequired: false, onChange: null);

    Widget _builProfil() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * .3,
              height: 135,
              child: Icon(Icons.person, size: 50,),
              decoration: BoxDecoration(
                  border: Border.all(color: Styles.grayColor),
                  borderRadius: BorderRadius.circular(4),
                  //  image: DecorationImage(image: AssetImage('images/plant_header_background.png'))
                  ),
            ),
            Positioned(
                top: -10,
                right: -10,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Styles.grayColor,
                  ),
                  child: Center(child: Text('', style: Styles.imageBatch)),
                )),
          ],
        ),
        SizedBox(width: 36),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Votre\nPlus \nBeau Profil', style: Styles.productName),
            ButtonUpload(title: "Upload", onPressed: (){})
            
          ],
        )
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