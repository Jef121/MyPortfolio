import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  State<Home> createState() => _MyHomeState();
}

class Order {
  Order({this.item, this.quantity});
  String? item;
  int? quantity;
}

class _MyHomeState extends State<Home> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  final Order _order = Order();

  String? _validateItemRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Item Required';
    }
    return null;
  }

  String? _validateItemCount(String? value) {
    if (value == null || value.isEmpty) {
      return 'At least one item is required';
    }

    final int? valueAsInteger = int.tryParse(value);
    if (valueAsInteger == null || valueAsInteger <= 0) {
      return 'At least one item is required';
    }

    return null; // Validation passed
  }

  void _submitOrder() {
    if (_formStateKey.currentState != null && _formStateKey.currentState!.validate()) {
      _formStateKey.currentState!.save();
      print('Order Item: ${_order.item}');
      print('Order Quantity: ${_order.quantity}');
    } else {
      print('Form is not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formStateKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Espresso',
                    labelText: 'Item',
                  ),
                  validator: (value) => _validateItemRequired(value),
                  onSaved: (value) => _order.item = value,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: '3',
                    labelText: 'Quantity',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) => _validateItemCount(value),
                  onSaved: (value) => _order.quantity = int.tryParse(value ?? '0'),
                ),
                const SizedBox(height: 16),
                const Divider(
                  height: 32.0,
                  color: Colors.black,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen, // Set background color here
                  ),
                  onPressed: _submitOrder,
                  child: const Text('Save'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
