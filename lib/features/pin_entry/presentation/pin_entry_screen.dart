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
                  for (var i = 0; i < 3; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var j = 1; j <= 3; j++)
                            _KeypadButton(
                              text: '${i * 3 + j}',
                              onTap: () => _onKeypadTap('${i * 3 + j}'),
                            ),
                        ],
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _KeypadButton(
                        text: '⌫',
                        onTap: _onDelete,
                        color: AppColors.surface,
                      ),
                      _KeypadButton(
                        text: '0',
                        onTap: () => _onKeypadTap('0'),
                      ),
                      _KeypadButton(
                        text: '→',
                        onTap: _onLookup,
                        color: AppColors.gold,
                        textColor: Colors.white,
                      ),
                    ],
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
  final Color? textColor;

  const _KeypadButton({
    required this.text,
    required this.onTap,
    this.color,
    this.textColor,
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
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: textColor ?? AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
