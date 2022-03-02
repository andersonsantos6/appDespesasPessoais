import 'package:despesas_pessoais/components/adaptative_button.dart';
import 'package:despesas_pessoais/components/adaptative_date_picker.dart';
import 'package:despesas_pessoais/components/adaptative_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();

  final _valueControler = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueControler.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              AdaptativeTextField(
                  formController: _titleController,
                  onSubmitted: (_) => _submitForm(),
                  label: 'Título',
                  inputTypeAdaptativeForm: TextInputType.text),
              AdaptativeTextField(
                  formController: _valueControler,
                  onSubmitted: (_) => _submitForm(),
                  label: 'Valor (R\$)',
                  inputTypeAdaptativeForm: TextInputType.number),
              AdaptativeDatePicker(
                  selectedDate: _selectedDate,
                  onDateChanged: (newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                  }),
              Container(
                color: Theme.of(context).primaryColor,
                height: 40,
                width: double.infinity,
                child: AdaptativeButton(
                  label: 'Nova Transação',
                  onPressed: _submitForm,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
