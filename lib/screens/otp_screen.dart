import 'package:flutter/material.dart';
import '../models/app_models.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';
import '../widgets/custom_button.dart';

class OTPScreen extends StatefulWidget {
  final UserRole role;
  final VoidCallback onBack;
  final ValueChanged<AccountType> onVerify;

  const OTPScreen({
    super.key,
    required this.role,
    required this.onBack,
    required this.onVerify,
  });

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  AccountType _accountType = AccountType.firstTime;
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
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
            BackBar(onBack: widget.onBack, step: 'Step 2 of 2'),
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
                        color: AppColors.orange50,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(Icons.lock_outline, size: 28, color: AppColors.orange500),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Verify your number',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: AppColors.slate900,
                        letterSpacing: -0.8,
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: const TextSpan(
                        text: 'Enter the 4-digit code sent to ',
                        style: TextStyle(fontSize: 14, color: AppColors.slate500, height: 1.5),
                        children: [
                          TextSpan(
                            text: '+91 98765 43210',
                            style: TextStyle(
                              color: AppColors.slate800,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(text: '.'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // 4-digit OTP row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) {
                        return Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: AppColors.slate200, width: 1.5),
                          ),
                          alignment: Alignment.center,
                          child: TextField(
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: AppColors.indigo950,
                            ),
                            decoration: const InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                            ),
                            onChanged: (val) {
                              if (val.isNotEmpty && index < 3) {
                                _focusNodes[index + 1].requestFocus();
                              } else if (val.isEmpty && index > 0) {
                                _focusNodes[index - 1].requestFocus();
                              }
                            },
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 20),
                    const Text(
                      'Resend code in 00:24',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: AppColors.orange500,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Prototype Testing Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.indigo50.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.indigo200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'PROTOTYPE ROUTE',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                              color: AppColors.indigo800,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Choose an account state to test both OTP branches.',
                            style: TextStyle(fontSize: 12, color: AppColors.slate500),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(14),
                                  onTap: () => setState(() => _accountType = AccountType.firstTime),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    decoration: BoxDecoration(
                                      color: _accountType == AccountType.firstTime
                                          ? AppColors.indigo950
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'First-time user',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                        color: _accountType == AccountType.firstTime
                                            ? Colors.white
                                            : AppColors.slate500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(14),
                                  onTap: () => setState(() => _accountType = AccountType.returning),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    decoration: BoxDecoration(
                                      color: _accountType == AccountType.returning
                                          ? AppColors.indigo950
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Returning user',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                        color: _accountType == AccountType.returning
                                            ? Colors.white
                                            : AppColors.slate500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(
                                isAdmin ? Icons.apartment : Icons.school,
                                size: 14,
                                color: AppColors.indigo800,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '${isAdmin ? "ADMIN" : "STUDENT"} → ${_accountType == AccountType.firstTime ? "Profile setup" : "Dashboard landing"}',
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.indigo800,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),
                    CustomButton(
                      label: 'Verify & Continue',
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
                      onPressed: () => widget.onVerify(_accountType),
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
