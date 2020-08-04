import 'package:audio_player_stage/demo_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/section_separator.dart';
import 'components/stack_pages_route.dart';
import 'components/submit_button.dart';
import 'demo.dart';
import 'form_page.dart';
import 'plant_form_information.dart';
import 'styles.dart';

class PlantFormSummary extends StatefulWidget {
   double pageSize;
   bool isHidden;

   PlantFormSummary({Key key, this.pageSize, this.isHidden = false}) : super(key: key);

  @override
  _PlantFormSummaryState createState() => _PlantFormSummaryState();
}

class _PlantFormSummaryState extends State<PlantFormSummary> {
    List<String> returnList;

    List<String> competences = [
      'JavaScript',
      'Python',
      'Html',
      'Intelligence artificielle',
      'Css',
      'PostgreSql',
      'Visual basic',
      'Flutter',
      'Golang',
      'PHP',
    ];

  @override
  Widget build(BuildContext context) {
    print("Rebuilding Summary @ ${DateTime.now().millisecondsSinceEpoch}");
    return FormPage(
      pageSizeProportion: widget.pageSize ?? 0.85,
      isHidden: widget.isHidden,
      title: "annonce etape 1".toUpperCase() ,
      children: <Widget>[
        Text(
          "Veuillez clicker sur vos compétences (5maximums)...",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 30),
        MultiSelectedChip(
          competences,
          myReturnList: (myList) {
            setState(() {
              returnList = myList;
            });
          },
        ),
        SizedBox(height: 20),
        Text(
              'Trouvons un beau titre pour votre annonce',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontFamily: 'BAARS',
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                padding: EdgeInsets.only(left: 12),
                //smargin: EdgeInsets.only(left: 15),
                height: 100,
                width: MediaQuery.of(context).size.width / 1.05,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: TextField(
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Ex: Ingénieur informatique donne des cours...',
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 18),
                    border: InputBorder.none,
                  ),
                )),
            SizedBox(
              height: 35,
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: Styles.formContainerDecoration,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Attention:',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'BAARS',
                        fontWeight: FontWeight.w600),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Votre titre est la clef de voûte de votre annonce. Bichonnez-le, il doit être accrocheur et contenir au moins 12 mots, comme'
                        'L’intitulé des matières que vous enseignez,  Vos spécificités (diplôme, méthode, etc.)',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'BAARS',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),


        SubmitButton(
          padding: EdgeInsets.symmetric(horizontal: Styles.hzPadding),
          child: Text('Next', style: Styles.submitButtonText),
          onPressed: () => _handleSubmit(context),
        ),
      ],
    );
  }

  void _handleSubmit(BuildContext context) {
    Navigator.push(
      context,
      StackPagesRoute(
        previousPages: [PlantFormSummary(pageSize: .85, isHidden: true)],
        enterPage: PlantFormInformation(),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              width: 135,
              height: 135,
              decoration: BoxDecoration(
                  border: Border.all(color: Styles.grayColor),
                  borderRadius: BorderRadius.circular(4),
                  // image: DecorationImage(image: AssetImage('images/plant_header_background.png'))
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
                  child: Center(child: Text('1', style: Styles.imageBatch)),
                )),
          ],
        ),
        SizedBox(width: 36),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Red Potted \nPlant w/ \nWhite Bowl', style: Styles.productName),
            Text('\$34.00', style: Styles.productPrice)
          ],
        )
      ],
    );
  }

  Widget _buildOrderInfo() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Subtotal', style: Styles.orderLabel),
            Text('\$34.00', style: Styles.orderPrice),
          ],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Shipping', style: Styles.orderLabel),
            Text('FREE', style: Styles.orderPrice),
          ],
        ),
      ],
    );
  }

  Widget _buildOrderTotal() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Total', style: Styles.orderTotalLabel),
          Text('\$34.00', style: Styles.orderTotal),
        ],
      ),
    );
  }

  Widget _buildOrderSpecialInstructions(BuildContext context) {
    String  name = 'Special Instructions';
    SharedFormState sharedState = Provider.of<SharedFormState>(context, listen: false);
    var values = sharedState.valuesByName;
    return TextFormField(
      onChanged: (value)=>values[FormKeys.instructions] = value,
      initialValue: values.containsKey(FormKeys.instructions)? values[FormKeys.instructions] : "",
      style: Styles.inputLabel,
      decoration: Styles.getInputDecoration(helper: name),
      minLines: 4,
      maxLines: 6,
    );
  }
}

class MultiSelectedChip extends StatefulWidget {
  final List<String> reportList;
  Function(List<String>) myReturnList;
  MultiSelectedChip(this.reportList, {this.myReturnList});

  @override
  _MultiSelectedChipState createState() => _MultiSelectedChipState();
}

class _MultiSelectedChipState extends State<MultiSelectedChip> {
  bool isSelected = false;
  String selectedChoice = "";
  List<String> selectedChoices = List();
  // this function will build and return the choice list
  _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item,style: TextStyle(color: Colors.white),),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
             selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.myReturnList(selectedChoices);
            });
          },
          selectedColor: Styles.primaryColor,
          
          backgroundColor: Colors.grey,
          
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(children: _buildChoiceList());
  }
}
