import 'package:audio_player_stage/components/section_separator.dart';
import 'package:audio_player_stage/components/section_title.dart';
import 'package:audio_player_stage/components/stack_pages_route.dart';
import 'package:audio_player_stage/components/submit_button.dart';
import 'package:audio_player_stage/form_inputs/multi_selected_chip.dart';
import 'package:audio_player_stage/form_inputs/text_input.dart';
import 'package:flutter/material.dart';

import '../styles.dart';
import 'form_screen.dart';
import 'from_section_secondary.dart';

class FirstStepAnnonce extends StatefulWidget {

   double pageSize;
   bool isHidden;

   FirstStepAnnonce({Key key, this.pageSize, this.isHidden = false}) : super(key: key);

  @override
  _FirstStepAnnonce createState() => _FirstStepAnnonce();
}

class _FirstStepAnnonce extends State<FirstStepAnnonce> {
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
        previousPages: [FirstStepAnnonce(pageSize: .85, isHidden: true)],
        enterPage: SecondStepAnnonce(),
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

