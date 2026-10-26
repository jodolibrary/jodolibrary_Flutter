import 'package:flutter/material.dart';
import '../models/app_models.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';
import '../widgets/custom_button.dart';

class MobileScreen extends StatefulWidget {
  final UserRole role;
  final VoidCallback onBack;
  final VoidCallback onContinue;

  const MobileScreen({
    super.key,
    required this.role,
    required this.onBack,
    required this.onContinue,
  });

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isAdmin = widget.role == UserRole.admin;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            BackBar(onBack: widget.onBack, step: 'Step 1 of 2'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.indigo50,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        isAdmin ? Icons.apartment : Icons.school,
                        size: 28,
                        color: AppColors.indigo950,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'What’s your\nmobile number?',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: AppColors.slate900,
                        height: 1.15,
                        letterSpacing: -0.8,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'We’ll send a one-time password to verify your ${isAdmin ? "owner" : "student"} account.',
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.slate500,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 36),

                    // Phone input
                    const Text(
                      'Mobile number',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: AppColors.slate700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: AppColors.slate200, width: 1.5),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            decoration: const BoxDecoration(
                              border: Border(right: BorderSide(color: AppColors.slate200)),
                            ),
                            child: const Text(
                              '+91',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: AppColors.slate800,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: _phoneController,
                              autofocus: true,
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.5,
                                color: AppColors.slate900,
                              ),
                              decoration: const InputDecoration(
                                hintText: '98765 43210',
                                hintStyle: TextStyle(
                                  color: AppColors.slate300,
                                  fontWeight: FontWeight.w700,
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                                border: InputBorder.none,
                                counterText: '',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),
                    CustomButton(
                      label: 'Get OTP',
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
                      onPressed: () {
                        widget.onContinue();
                      },
                    ),

                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.slate50,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: AppColors.slate100),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.shield, color: AppColors.emerald600, size: 18),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Your number is private and only used for account access and important updates.',
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.slate500,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
