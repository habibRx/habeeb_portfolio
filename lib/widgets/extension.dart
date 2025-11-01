
import 'dart:math';

import 'package:flutter/material.dart';

extension BuildContextExtention on BuildContext {

  /// Retrieve the current theme data from the context.
  ///
  /// Usage:
  /// ```dart
  /// ColorScheme colorScheme = context.colorScheme;
  /// ```
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Retrieve the current theme data from the context.˚
  ///
  /// Usage:
  /// ```dart
  /// ThemeData colorScheme = context.colorScheme;
  /// ```
  ThemeData get theme => Theme.of(this);

  /// Retrieve the current text theme from the context.
  ///
  /// Usage:
  /// ```dart
  /// ColorScheme colorScheme = context.theme;
  /// ```
  TextTheme get textTheme => Theme.of(this).textTheme;

  dynamic get focus => FocusScope.of(this).nextFocus();
  dynamic get removeFocus => FocusScope.of(this).unfocus();

  Size get viewSize => MediaQuery.of(this).size;


  SnackBar successSnackBar(String message) {
    return SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      duration: const Duration(seconds: 2),
    );
  }

  SnackBar errorSnackBar(String message) {
    return SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      duration: const Duration(seconds: 3),
    );
  }

  SnackBar loadingSnackBar(String message, void Function()? onTap) {
    return SnackBar(
      content: Row(
        children: [
          const CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      duration: const Duration(minutes: 1), // Long duration for loading
    );
  }

  SnackBar actionSnackBar(String message, SnackBarAction? action) {
    return SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.deepPurple,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      action: action,
      duration: const Duration(seconds: 4),
    );
  }

}

extension AddWalletBottomSheet on Widget {



  Future<T?> asDialog<T>(BuildContext context,
      {String? title, void Function()? onClose, bool isDismissible = true}) {
    return showDialog<T>(
        context: context, builder: (BuildContext context) => this);
  }

  Widget get withHorViewPadding {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.viewPaddingHorizontal),
      child: this,
    );
  }

  Widget get withVertViewPadding {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppConstants.viewPaddingVertical),
      child: this,
    );
  }

  Widget get withSmallVertPadding {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppConstants.smallPaddingVertical),
      child: this,
    );
  }
  Widget get withViewPadding {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.viewPaddingHorizontal,
          vertical: AppConstants.viewPaddingVertical),
      child: this,
    );
  }

  Widget get withContentPadded {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 12),
      child: this,
    );
  }

  Widget get withExtraContextPadded {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 24),
      child: this,
    );
  }

//Fot test purposes only
  Widget get visualize {
    return Container(
      color: Colors
          .primaries[Random().nextInt(Colors.primaries.length)], // Random color
      child: this,
    );
  }
}



class AppConstants {
  AppConstants._();

  static const String appName = 'What\'s My PNL';
  static const String ecobookName = 'Ecobook';
  static const String appDomain = 'https://ecomoto.io';
  static const String appHostName = 'ecomoto.io';
  static const String appDescription = 'Vehicle Rental';
  static const double viewPaddingHorizontal = 16;
  static const double viewPaddingGrid = 10;
  static const double viewPaddingVertical = 20;
  static const double smallPaddingVertical = 10;
  static const double transactionTimeout = 120;
  static const double transactionConfirmationTimeout = 120;
  static const double scrollUnderElevation = 5;
  static const String appErrorMessage = 'Please try again';
  static const String rentVehicleErrorMessage =
      'You cannot rent a vehicle because you do not meet the minimum age requirement.';
  static const String rentOwnVehicleErrorMessage =
      'Oops! You cannot rent a vehicle that you own. Please choose a different vehicle to proceed.';

  static const String appCurrency = "\$";
  static const double distanceToUnlockVehicle = 15.0;
  static const double endTripParkingLocationRadius = 20;
  static const double endTripParkingLocation = 30;

  static const double authenticationMaxWidth = 660.0;
  static const double viewMaxWidth = 660.0;

  static const double estimatedAverageEfficiency = 3.5;

  static const double fabPadding = 20.0;
  static const bool isManualDriverLicenseVerification = true;

  static const Duration vehicleVideoDuration = Duration(minutes: 1);
  static const Duration feedVideoDuration = Duration(minutes: 3);
  static const int maximumVideoFileSizeMB = 15;
  static const EdgeInsets contentPadding = EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 10,
  );

  static const EdgeInsets extraPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 16,
  );
  static const int minVehicleImages = 6;
  static const double borderRadiusLarge = 15.0;
  static const double borderRadius = 10.0;
  static const double borderRadiusSmall = 5.0;
  static const double borderRadiusMedium = 8.0;

  static const String newToWeb3 = "https://hbr.org/2022/05/what-is-web3";
  static const String privacyPolice =
      "https://ecomoto-mu.vercel.app/policies/privacy-policy";
  static const String termsOfUse =
      "https://ecomoto-mu.vercel.app/policies/terms-of-service";

  static const int vehicleListingDefaultMinimumPrice = 10;
  static const int vehicleListingDefaultMaximumPrice = 30;

  static const List<String> tripCancellationReasons = [
    "I don't need the vehicle anymore",
    "My Appointment got cancelled",
    "My schedule changed",
    "Others"
  ];

  static const String contactUs =
      "Call us at +1(555) 666-7788(M-F, 10:00am-6:00pm ET)";
  static const String disconnectGeneratedWalletWarning =
      "By disconnecting this generated wallet, you will no longer be able to use it on Ecomoto. To use this wallet again, you'll need to import it with a wallet provider like Metamask or Trust Wallet. Please ensure that you have the wallet information file downloaded on your device, as you will need it to import your wallet with other wallet providers. If you haven't done that yet, cancel this action and click the 'Wallet Info' button below. If you understand this and wish to continue disconnecting your wallet, you can click 'Continue'.";
}
