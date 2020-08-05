import 'package:audio_player_stage/components/section_separator.dart';
import 'package:audio_player_stage/components/section_title.dart';
import 'package:audio_player_stage/demo_data.dart';
import 'package:audio_player_stage/form_inputs/multi_selected_chip.dart';
import 'package:audio_player_stage/form_inputs/text_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return FormPage(
      pageSizeProportion: widget.pageSize ?? 0.85,
      isHidden: widget.isHidden,
      title: "annonce etape 1",
      children: <Widget>[
        TextInput(onValidate: null, label: "Specialité", helper: "Rechercher votre Specialité", ),
        FormSectionTitle("Veuillez clicker sur vos compétences (5maximums)..."),
        MultiSelectedChip(
          competences,
          myReturnList: (myList) {
            setState(() {
              returnList = myList;
            });
          },
        ),
        Separator(),
        FormSectionTitle("Trouvons un beau titre pour votre annonce"),
            TextFormField(
              maxLines: 6,
              minLines: 4,
              style: Styles.inputLabel,
              decoration:Styles.getInputDecoration(helper: "Ex: Ingénieur informatique donne des cours..."),
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



  // Widget _buildOrderSpecialInstructions(BuildContext context) {
  //   String  name = 'Special Instructions';
  //   SharedFormState sharedState = Provider.of<SharedFormState>(context, listen: false);
  //   var values = sharedState.valuesByName;
  //   return TextFormField(
  //     onChanged: (value)=>values[FormKeys.instructions] = value,
  //     initialValue: values.containsKey(FormKeys.instructions)? values[FormKeys.instructions] : "",
  //     style: Styles.inputLabel,
  //     decoration: Styles.getInputDecoration(helper: name),
  //     minLines: 4,
  //     maxLines: 6,
  //   );
  // }
}

