import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueControler = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueControler.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onSubmitted: (_) => _submitForm(),
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              onSubmitted: (_) => _submitForm(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: valueControler,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Row(children: [
              Text('Nenhuma data selecionada!'),
              FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () {},
                  child: Text(
                    'Selecionar data',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ]),
            Container(
                color: Theme.of(context).primaryColor,
                height: 40,
                width: double.infinity,
                child: FlatButton(
                    onPressed: _submitForm,
                    child: Text(
                      'Nova Transação',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.button?.color),
                    )))
          ],
        ),
      ),
    );
  }
}
