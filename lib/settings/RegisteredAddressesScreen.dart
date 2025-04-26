import 'package:flutter/material.dart';

import 'model/Address.dart';

class RegisteredAddressesScreen extends StatefulWidget {
  const RegisteredAddressesScreen({Key? key}) : super(key: key);

  @override
  _RegisteredAddressesScreenState createState() => _RegisteredAddressesScreenState();
}

class _RegisteredAddressesScreenState extends State<RegisteredAddressesScreen> {
  final List<Address> _addresses = [
    Address(
      label: 'Home',
      street: '123 Nile St.',
      city: 'Cairo',
      zip: '11511',
      phone: '+20 100 123 4567',
    ),
    Address(
      label: 'Office',
      street: '45 Tahrir Square',
      city: 'Giza',
      zip: '12611',
      phone: '+20 122 234 5678',
    ),
  ];

  void _showAddressForm({Address? address, int? index}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          top: 16,
          left: 16,
          right: 16,
        ),
        child: AddEditAddressSheet(
          address: address,
          onSave: (addr) {
            setState(() {
              if (index == null) {
                _addresses.add(addr);
              } else {
                _addresses[index] = addr;
              }
            });
          },
        ),
      ),
    );
  }

  void _deleteAddress(int index) {
    setState(() => _addresses.removeAt(index));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Address deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Addresses'),
        centerTitle: true,
      ),
      body: _addresses.isEmpty
          ? const Center(child: Text('No addresses added yet.'))
          : ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _addresses.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          final addr = _addresses[i];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              title: Text(addr.label, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                '${addr.street}, ${addr.city}, ${addr.zip}\nPhone: ${addr.phone}',
              ),
              isThreeLine: true,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _showAddressForm(address: addr, index: i),
                    tooltip: 'Edit',
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteAddress(i),
                    tooltip: 'Delete',
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddressForm(),
        icon: const Icon(Icons.add_location_alt),
        label: const Text('Add Address'),
      ),
    );
  }
}

/// 3) Bottom-sheet for Adding / Editing an Address
class AddEditAddressSheet extends StatefulWidget {
  final Address? address;
  final void Function(Address) onSave;

  const AddEditAddressSheet({
    Key? key,
    this.address,
    required this.onSave,
  }) : super(key: key);

  @override
  _AddEditAddressSheetState createState() => _AddEditAddressSheetState();
}

class _AddEditAddressSheetState extends State<AddEditAddressSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _labelCtrl;
  late final TextEditingController _streetCtrl;
  late final TextEditingController _cityCtrl;
  late final TextEditingController _zipCtrl;
  late final TextEditingController _phoneCtrl;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    final a = widget.address;
    _labelCtrl  = TextEditingController(text: a?.label);
    _streetCtrl = TextEditingController(text: a?.street);
    _cityCtrl   = TextEditingController(text: a?.city);
    _zipCtrl    = TextEditingController(text: a?.zip);
    _phoneCtrl  = TextEditingController(text: a?.phone);
  }

  @override
  void dispose() {
    _labelCtrl.dispose();
    _streetCtrl.dispose();
    _cityCtrl.dispose();
    _zipCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    final newAddr = Address(
      label: _labelCtrl.text,
      street: _streetCtrl.text,
      city: _cityCtrl.text,
      zip: _zipCtrl.text,
      phone: _phoneCtrl.text,
    );
    widget.onSave(newAddr);

    setState(() => _loading = false);
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          widget.address == null
              ? 'Address added'
              : 'Address updated',
        ),
      ),
    );
  }

  String? _notEmpty(String? v) => (v == null || v.trim().isEmpty) ? 'Required' : null;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        Text(
          widget.address == null ? 'Add Address' : 'Edit Address',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _labelCtrl,
                decoration: const InputDecoration(labelText: 'Label (e.g. Home, Office)'),
                validator: _notEmpty,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _streetCtrl,
                decoration: const InputDecoration(labelText: 'Street Address'),
                validator: _notEmpty,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _cityCtrl,
                decoration: const InputDecoration(labelText: 'City'),
                validator: _notEmpty,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _zipCtrl,
                decoration: const InputDecoration(labelText: 'ZIP / Postal Code'),
                validator: _notEmpty,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _phoneCtrl,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (v) {
                  if (v == null || v.trim().length < 10) {
                    return 'Enter a valid phone';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _loading ? null : _save,
                  child: _loading
                      ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                      : Text(widget.address == null ? 'Add' : 'Save'),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}