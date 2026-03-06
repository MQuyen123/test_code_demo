import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/router/app_router.dart';
import 'cubit/pin_cubit.dart';
import 'cubit/pin_state.dart';

class PinEntryScreen extends StatelessWidget {
  const PinEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PinCubit(ServiceLocator.getExhibitByPin),
      child: const _PinEntryView(),
    );
  }
}

class _PinEntryView extends StatefulWidget {
  const _PinEntryView();

  @override
  State<_PinEntryView> createState() => _PinEntryViewState();
}

class _PinEntryViewState extends State<_PinEntryView> {
  String _pin = '';

  void _onKeypadTap(String value) {
    if (_pin.length < 2) {
      setState(() => _pin += value);
    }
  }

  void _onDelete() {
    if (_pin.isNotEmpty) {
      setState(() => _pin = _pin.substring(0, _pin.length - 1));
    }
  }

  void _onLookup() {
    context.read<PinCubit>().lookupPin(_pin);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PinCubit, PinState>(
      listener: (context, state) {
        if (state is PinSuccess) {
          setState(() => _pin = '');
          Navigator.pushNamed(context, AppRouter.detail,
              arguments: state.exhibit);
        } else if (state is PinError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.primary,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.surface,
        appBar: AppBar(
          title: const Text('NHẬP MÃ SỐ'),
        ),
        body: Column(
          children: [
            const Spacer(),
            const Text(
              'Nhập số trên biển báo hiện vật',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _PinDigit(_pin.isNotEmpty ? _pin[0] : ''),
                const SizedBox(width: 16),
                _PinDigit(_pin.length > 1 ? _pin[1] : ''),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
              decoration: BoxDecoration(
                color: AppColors.cardBg,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _KeypadButton(
                            text: '1', onTap: () => _onKeypadTap('1')),
                        _KeypadButton(
                            text: '2', onTap: () => _onKeypadTap('2')),
                        _KeypadButton(
                            text: '3', onTap: () => _onKeypadTap('3')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _KeypadButton(
                            text: '4', onTap: () => _onKeypadTap('4')),
                        _KeypadButton(
                            text: '5', onTap: () => _onKeypadTap('5')),
                        _KeypadButton(
                            text: '6', onTap: () => _onKeypadTap('6')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _KeypadButton(
                            text: '7', onTap: () => _onKeypadTap('7')),
                        _KeypadButton(
                            text: '8', onTap: () => _onKeypadTap('8')),
                        _KeypadButton(
                            text: '9', onTap: () => _onKeypadTap('9')),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _KeypadButton(
                        text: 'R',
                        onTap: () => _onKeypadTap('R'),
                        color: AppColors.surface,
                      ),
                      _KeypadButton(
                        text: '0',
                        onTap: () => _onKeypadTap('0'),
                      ),
                      _KeypadButton(
                        text: '⌫',
                        onTap: _onDelete,
                        color: AppColors.surface,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _pin.length == 2 ? _onLookup : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.gold,
                        foregroundColor: AppColors.primaryDark,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        disabledBackgroundColor: Colors.grey.shade300,
                      ),
                      child: const Text(
                        'Tra cứu',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PinDigit extends StatelessWidget {
  final String digit;
  const _PinDigit(this.digit);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: digit.isEmpty ? AppColors.divider : AppColors.gold,
          width: 2,
        ),
      ),
      child: Text(
        digit,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryDark,
        ),
      ),
    );
  }
}

class _KeypadButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const _KeypadButton({
    required this.text,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? AppColors.surface,
          shape: BoxShape.circle,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
