import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/dashboard/business/bloc/bloc/fetch_notice_bloc.dart';
import 'package:climbapp/presentation/sign_in/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

//todo
/* 
-need to prepare full list of probable word to help
-refactoring view of autoComplete
*/
TextEditingController _searchController = TextEditingController();

class AutoCompleteTextField extends StatelessWidget {
  const AutoCompleteTextField(
      {required this.leftIcon,
      required this.hintText,
      required this.wordsLists,
      super.key});

  final Icon leftIcon;
  final String hintText;
  final List<String> wordsLists;
  static const List<String> popularString = [
    'climbing',
    'tennis',
    'padel',
    'biking'
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return popularString.where((String item) =>
            item.contains(textEditingValue.text.toLowerCase()));
      },
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubbmited) {
        return BlocBuilder<FetchNoticeBloc, FetchNoticeState>(
          builder: (context, state) {
            return CTextFormField(
              textInputWidth: MediaQuery.of(context).size.width * 0.6,
              enableBorders: false,
              hintText: hintText,
              icon: leftIcon,
              controller: _searchController,
              focusNode: focusNode,
              onChanged: (value) => context.read<FetchNoticeBloc>().add(
                    FilterNotices(
                      params: GetNoticeParams(
                        url: AppUrl.getAllFilteredNoticesURL(value),
                      ),
                    ),
                  ),
            );
          },
        );
      },
      onSelected: (option) => debugPrint(''),
    );
  }
}
