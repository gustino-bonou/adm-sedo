import 'package:adms/utils/helper/import.app.path.dart';
import 'package:pinput/pinput.dart';


class CustomOtpField extends StatefulWidget {
  const CustomOtpField({Key? key, required  this.pinValue, this.onCompleted, this.onChanged}) : super(key: key);

  final RxString pinValue;
  final Function()?  onCompleted;
  final Function()?  onChanged;

  @override
  State<CustomOtpField> createState() => _CustomOtpFieldState();
}

class _CustomOtpFieldState extends State<CustomOtpField> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color focusedBorderColor = TColor.kcPrimaryColor;
    Color borderColor = TColor.smallTitle.withOpacity(0.3);

    final defaultPinTheme = PinTheme(
      width: 70,
      height: 70,
      textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 16
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: borderColor),
          color: Colors.white
      ),
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              showCursor: true,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              controller: pinController,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              onClipboardFound: (value) {
                debugPrint('onClipboardFound: $value');
                pinController.setText(value);
              },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                widget.onCompleted;
              },
              onChanged: (value) {
                widget.pinValue.value = value;
                widget.onCompleted!();
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 2,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme,
              submittedPinTheme: defaultPinTheme,
            ),
          ),
        ],
      ),
    );
  }
}