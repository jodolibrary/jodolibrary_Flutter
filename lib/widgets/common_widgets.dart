import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BackBar extends StatelessWidget {
  final VoidCallback onBack;
  final String step;

  const BackBar({
    super.key,
    required this.onBack,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onBack,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColors.slate100,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.arrow_back, size: 20, color: AppColors.slate800),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.indigo50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              step.toUpperCase(),
              style: const TextStyle(
                color: AppColors.indigo800,
                fontWeight: FontWeight.w800,
                fontSize: 10,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormFieldWidget extends StatelessWidget {
  final String label;
  final String placeholder;
  final String? prefix;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const FormFieldWidget({
    super.key,
    required this.label,
    required this.placeholder,
    this.prefix,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: AppColors.slate700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.slate200),
          ),
          child: Row(
            children: [
              if (prefix != null) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: const BoxDecoration(
                    border: Border(right: BorderSide(color: AppColors.slate200)),
                  ),
                  child: Text(
                    prefix!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: AppColors.slate800,
                    ),
                  ),
                ),
              ],
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  keyboardType: keyboardType,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.slate900,
                  ),
                  decoration: InputDecoration(
                    hintText: placeholder,
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.slate400,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SelectorWidget extends StatelessWidget {
  final String label;
  final List<String> items;
  final String value;
  final ValueChanged<String> onChanged;

  const SelectorWidget({
    super.key,
    required this.label,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: AppColors.slate700,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: items.map((item) {
            final isSelected = item == value;
            return InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => onChanged(item),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.indigo950 : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? AppColors.indigo950 : AppColors.slate200,
                  ),
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: isSelected ? Colors.white : AppColors.slate600,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class PhotoUploadWidget extends StatefulWidget {
  final bool isStudent;

  const PhotoUploadWidget({super.key, this.isStudent = false});

  @override
  State<PhotoUploadWidget> createState() => _PhotoUploadWidgetState();
}

class _PhotoUploadWidgetState extends State<PhotoUploadWidget> {
  bool uploaded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => uploaded = !uploaded),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: uploaded ? AppColors.emerald50 : AppColors.indigo50,
              border: Border.all(
                color: uploaded ? AppColors.emerald500 : AppColors.indigo300,
                width: 2,
              ),
            ),
            child: Icon(
              uploaded
                  ? Icons.check
                  : (widget.isStudent ? Icons.school : Icons.apartment),
              size: 38,
              color: uploaded ? AppColors.emerald600 : AppColors.indigo800,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.orange500,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.orange500.withOpacity(0.35),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(Icons.camera_alt, color: Colors.white, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}
