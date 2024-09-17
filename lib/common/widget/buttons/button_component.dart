import 'package:adms/utils/helper/import.app.path.dart';
import '../boder/gradient.border.dart';
import '../text/gradient.text.dart';


class ButtonComponent extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final bool? isfull;
  const ButtonComponent(
    this.text, {
    Key? key,
    this.onPressed,
    this.buttonColor,
    this.textColor,
    this.width,
    this.height,
    this.fontSize,
    this.isfull,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(TColor.kcPrimaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: fontSize ?? 14,
                color: textColor ?? Colors.white,
              ),
            ),
            //const Expanded(child: horizontalSpaceSmall),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: TColor.kcPrimaryColor,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 12,
                    ),
                  )),
            )
          ],
        ),
      ),
      if (isfull == false)
        Positioned.fill(
            child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(24),
          ),
        )),
    ]);
  }
}

class ButtonBackComponent extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final bool? canDoAction;
  const ButtonBackComponent(
    this.text, {
    Key? key,
    this.onPressed,
    this.buttonColor,
    this.textColor,
    this.fontSize,
    this.canDoAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          //elevation: MaterialStateProperty.all(elevation),

          side: MaterialStateProperty.all(
            const BorderSide(
              color: TColor.kcPrimaryColor,
              width: 1.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //const Expanded(child: horizontalSpaceSmall),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                  padding: const EdgeInsets.only(left: 4),
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: TColor.kcPrimaryColor,
                      width: 1.5,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: TColor.kcPrimaryColor,
                      size: 12,
                    ),
                  )),
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: fontSize ?? 14,
                color: textColor ?? TColor.kcPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}


class SimpleButton extends StatelessWidget {
  const SimpleButton({Key? key, required this.text, this.onPressed, this.buttonColor, this.textColor, this.fontSize, this.canDoAction}) : super(key: key);

  final String text;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final bool? canDoAction;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: canDoAction == true ? onPressed : null,
          child: GradientBorderContainer(
            borderWidth: 1,
            gradient: TColor.linearcolor2,
            child: Container(
              padding: const EdgeInsets.only(
                  top: 8, bottom: 8, left: 10, right: 10
              ),
              decoration: BoxDecoration(
                gradient: TColor.linearcolor2,
                borderRadius: BorderRadius.circular(24),
              ),
              child:  Text(
                text,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize ?? 17,
                  color: textColor ??  Colors.white,
                ),
              ),
            ),
          ),
        ),
        if (canDoAction == false)
          Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    width: 1,
                    color: Colors.transparent
                  )
                ),
              )),
      ],
    );
  }
}

class LineaNextButton extends StatelessWidget {
  const LineaNextButton({Key? key, required this.text, this.onPressed, this.buttonColor, this.textColor, this.fontSize, this.canDoAction}) : super(key: key);

  final String text;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final bool? canDoAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  canDoAction == true ? onPressed : null,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 8, bottom: 8, left: 10, right: 10
            ),
            decoration: BoxDecoration(
                gradient: TColor.linearcolor2,
                borderRadius: BorderRadius.circular(24)
            ),
            child:  Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: fontSize ?? 16,
                      color: textColor ??  Colors.white,
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Container(
                    height: 21,
                    width: 21,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                            color: Colors.white,
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 12,
                    ),
                  )
                ],
              ),
            ),
          ),
          if (canDoAction == false)
            Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(24),
                  ),
                )),
        ],
      ),
    );
  }
}

class LinearBackButton extends StatelessWidget {
  const LinearBackButton({Key? key, required this.text, this.onPressed, this.buttonColor, this.textColor, this.fontSize, this.canDoAction}) : super(key: key);

  final String text;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final bool? canDoAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  canDoAction == true ? onPressed : null,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 8, bottom: 8, left: 10, right: 10
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: TColor.kcPrimaryColor,
              )
            ),
            child:  Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 21,
                    width: 21,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                            color: TColor.kcPrimaryColor,
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios_sharp,
                        color: TColor.kcPrimaryColor,
                        size: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  GradientText(
                    text, gradient: TColor.linearcolor2,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize ?? 16,
                    color: textColor ?? TColor.kcPrimaryColor,
                  ),),

                ],
              ),
            ),
          ),
          if (canDoAction == false)
            Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(24),
                  ),
                )),
        ],
      ),
    );
  }
}

class OutlineNextButton extends StatelessWidget {
  const OutlineNextButton({Key? key, required this.text, this.onPressed, this.buttonColor, this.textColor, this.fontSize, this.canDoAction}) : super(key: key);

  final String text;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final bool? canDoAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  canDoAction == true ? onPressed : null,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 8, bottom: 8, left: 10, right: 10
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: TColor.kcPrimaryColor,
                )
            ),
            child:  Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  GradientText(
                    text, gradient: TColor.linearcolor2,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: fontSize ?? TSizes.ft14,
                      color: textColor ?? TColor.kcPrimaryColor,
                    ),),
                  const SizedBox(width: 5,),
                  Container(
                    height: 21,
                    width: 21,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                            color: TColor.kcPrimaryColor,
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: TColor.kcPrimaryColor,
                        size: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (canDoAction == false)
            Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(24),
                  ),
                )),
        ],
      ),
    );
  }
}


class SimpleOutlineNextButton extends StatelessWidget {
  const SimpleOutlineNextButton({Key? key, required this.text, this.onPressed, this.buttonColor, this.textColor, this.fontSize, this.canDoAction}) : super(key: key);

  final String text;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final bool? canDoAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  canDoAction == true ? onPressed : null,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 8, bottom: 8, left: 10, right: 10
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: TColor.kcPrimaryColor,
                )
            ),
            child:  Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  GradientText(
                    text, gradient: TColor.linearcolor2,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: fontSize ?? TSizes.ft14,
                      color: textColor ?? TColor.kcPrimaryColor,
                    ),),
                ],
              ),
            ),
          ),
          if (canDoAction == false)
            Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(24),
                  ),
                )),
        ],
      ),
    );
  }
}



class ButtonNextComponent extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final bool? isfull;
  const ButtonNextComponent(
    this.text, {
    Key? key,
    this.onPressed,
    this.buttonColor,
    this.textColor,
    this.width,
    this.height,
    this.fontSize,
    this.isfull,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(TColor.kcPrimaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        child: Container(
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize ?? 16,
                  color: textColor ?? Colors.white,
                ),
              ),
              //const Expanded(child: horizontalSpaceSmall),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: TColor.kcPrimaryColor,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 12,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
      if (isfull == false)
        Positioned.fill(
            child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(24),
          ),
        )),
    ]);
  }
}
