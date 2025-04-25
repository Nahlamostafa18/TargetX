import 'package:flutter/material.dart'
;
class QuantitySelector extends StatelessWidget {
  final int quantity;
  final bool inStock;
  final ValueChanged<int> onChanged;

  const QuantitySelector(
      {super.key,
        required this.quantity,
        required this.onChanged,
        required this.inStock});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: quantity > 1 ? () => onChanged(quantity - 1) : null,
            icon: const Icon(Icons.remove),
          ),
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              quantity.toString(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          IconButton(
            onPressed: inStock ? () => onChanged(quantity + 1) : null,
            icon: const Icon(Icons.add),
          ),
          const SizedBox(width: 16),
          Container(
            height: 24,
            width: 1,
            color: Colors.grey.shade200,
          ),
          const SizedBox(width: 16),
          Text(
            inStock ? 'In Stock' : 'Out of Stock',
            style: TextStyle(
              color: inStock ? Colors.green : Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
