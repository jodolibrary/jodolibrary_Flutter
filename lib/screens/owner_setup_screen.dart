import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';
import '../widgets/custom_button.dart';

class OwnerSetupScreen extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onComplete;

  const OwnerSetupScreen({
    super.key,
    required this.onBack,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.slate50,
      body: SafeArea(
        child: Column(
          children: [
            BackBar(onBack: onBack, step: 'Owner setup'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: const [
                          PhotoUploadWidget(isStudent: false),
                          SizedBox(height: 12),
                          Text(
                            'Add owner photo',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: AppColors.indigo950,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Tap to upload · JPG or PNG',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.slate400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Set up your library',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: AppColors.slate900,
                        letterSpacing: -0.6,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Just the essentials for now. You can add more details later.',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.slate500,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 24),

                    const FormFieldWidget(
                      label: 'Owner name',
                      placeholder: 'Enter your full name',
                    ),
                    const SizedBox(height: 16),
                    const FormFieldWidget(
                      label: 'Library name',
                      placeholder: 'e.g. Saraswati Study Hub',
                    ),
                    const SizedBox(height: 16),
                    const FormFieldWidget(
                      label: 'Full address / area',
                      placeholder: 'e.g. Boring Road, Patna',
                    ),
                    const SizedBox(height: 16),
                    const FormFieldWidget(
                      label: 'Total seat capacity',
                      placeholder: 'e.g. 60',
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 28),
                    CustomButton(
                      label: 'Complete Setup',
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
                      onPressed: onComplete,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
