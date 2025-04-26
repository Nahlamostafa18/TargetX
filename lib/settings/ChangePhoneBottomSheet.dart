import 'package:flutter/material.dart';
class ChangePhoneBottomSheet extends StatefulWidget {
  const ChangePhoneBottomSheet({Key? key}) : super(key: key);

  @override
  _ChangePhoneBottomSheetState createState() => _ChangePhoneBottomSheetState();
}

class _ChangePhoneBottomSheetState extends State<ChangePhoneBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _currentCtrl = TextEditingController();
  final _newCtrl     = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _currentCtrl.dispose();
    _newCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    // TODO: call your change-phone API here
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _loading = false);
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Phone number successfully updated')),
    );
  }

  String? _validatePhone(String? v) {
    if (v == null || v.isEmpty) return 'Please enter a phone number';
    final digitsOnly = v.replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.length < 10) return 'Must be at least 10 digits';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Change Phone Number',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Form(
            key: _formKey,
            child: Column(
              children: [
                // Current Phone
                TextFormField(
                  controller: _currentCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Current Phone',
                    hintText: '+20 1XXXXXXXXX',
                  ),
                  validator: _validatePhone,
                ),
                const SizedBox(height: 12),
                // New Phone
                TextFormField(
                  controller: _newCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'New Phone',
                    hintText: '+20 1XXXXXXXXX',
                  ),
                  validator: _validatePhone,
                ),
                const SizedBox(height: 12),
                // Confirm New Phone
                TextFormField(
                  controller: _confirmCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Confirm New Phone',
                    hintText: '+20 1XXXXXXXXX',
                  ),
                  validator: (v) {
                    if (v != _newCtrl.text) return 'Phone numbers do not match';
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _submit,
                    child: _loading
                        ? const SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                        : const Text('Update Phone'),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
