# Changelog

### v2.9.6
- Bugfix

### v2.9.5
- Bugfix

### v2.9.4
- Added shouldGetConsentForGoogleAdditionalConsentMode() method

### v2.9.3
- Bugfix

### v2.9.1
- Native support for cookiePolicyInOtherWindow

### v2.9.0
- Downgrade deployment target to 12.0

### v2.8.9
- Added setMultiThread() method

### v2.8.8
- Bugfix

### v2.8.6
- Added getPreferenceId method for Cpl

### v2.8.5
- Added onPopupClosed to IubendaCMPCallback
- Bugfix for preventDismissWhenLoaded

### v2.8.4
- Added invalidateConsentInterval

### v2.8.3
- Added IubendaCMPCallback and IubendaCMPConfig.fatalErrorTimeout()

### v2.8.2
- Added setStorePreferences() method with StorePreferences object and callback

### v2.8.1
- Added EnableAdvertiserConsentMode support

### v2.8.0
- Bugfix for PrivacyInfo.xcprivacy manifest file

### v2.7.9
- Added setStorePreferences() method with StorePreferences object
- Added PrivacyInfo.xcprivacy manifest file

### v2.7.7
- Added getSaleOptOut(), getSharingOptOut(), getTargetedAdvertisingOptOut() methods

### v2.7.7
- Bugfix for "isFullScreen" configuration

### v2.7.6
- Added "isFullScreen" configuration to IubendaCMPConfiguration 
- Added "openPreferences(purposes: [Int])" method to IubendaCMP

### v2.7.5
- Added Swift Package Manager Support

### v2.7.4
- Bugfix for getConsentRecordId()

### v2.7.3
- Added support for Google's Additional Consent Mode

### v2.7.2
- Bugfix for timestamp

### v2.7.1
- Added "useNonStandardTexts" to saved data

### v2.6.9
- Added support for TCF 2.2

### v2.6.8
- Added automaticHandlingOfAtt to IubendaCMP
- Added canOpenPreferences() to IubendaCMP
- Added requestAttConsent() to IubendaCMP
- Added getATTStatus() to IubendaCMP

### v2.6.7
- Added reject() to IubendaCMP class

### v2.6.6
- Bugfix for custom size

### v2.6.5
- Added landscapeWidth, landscapeHeight, portraitWidth, portraitHeight to IubendaCMPConfiguration

### v2.6.4
- Added getPreferencesJson to IubendaCMP class

### v2.6.3
- Added dismissColor to IubendaCMPConfiguration class for customizing close button

### v2.6.1
- isGooglePersonalized() is deprecated

### v2.6.0
- Added proxyUrl(baseUrl) method to rewrite the URL that it uses to embed CS

### v2.5.9
- Fixed saveConsent(preferencesJson,timestamp) function

### v2.5.8
- Added isPreferenceExpressed() method to return true if the SDK detects an already stored valid preference, "valid" means that if the preference is invalidated by invalidateConsentBefore then the method should return false
- Fixed isConsentGiven() method

### v2.5.7
- Added expireAfter option to config.json to compare with saved consent date and clear data if needed

### v2.5.6
- Added invalidateConsentBefore Parameter to config.json to compare with saved consent date and show consent again if needed
- Added shouldGetConsentForInvalidateConsentBefore() function to IubendaCMP class for Custom UI call
- Added objective-c support for IubendaCMP.storage parameter

### v2.5.5
- Added BannerPosition Parameter to IubendaCMPConfiguration class to customize Consent Banner Position (default:CENTER)

### v2.5.4
- Added tvOS target and custom UI methods

### v2.5.3
- Fixed expired consent string by clearing after 360 days

### v2.5.2
- Allows to use forceConsent=true with enableTcf=false

### v2.5.1
- Fixed an issue introduced in version 2.5.0 where enableTcf=false and forceConsent=false would not behave correctly

### v2.5.0
- Added method IubendaCMP.clearData() 

### v2.4.0
- Methods acceptDefaultConsent, editConsent, showConsentPreferences, showVendorsPreferences and showCookiePolicy have been renamed to accept, openPreferences, openTcfPreferences, openTcfVendorsPreferences and openCookiePolicy, respectively

### v2.3.6
- Fixed an issue with external links
- Compiled with older swift 5.3.2

### v2.3.5
- Fixed an issue with some xcode/cocoapods build configurations

### v2.3.2 - v2.3.4
- Improved logging

### v2.3.1
- added isVendorConsentGivenFor(id) and isPurposeConsentGivenFor(id)

### v2.3.0
- Added preventDismissWhenLoaded option
- Updated popup size algorithm

### v2.2.1
- Improved popup size on different screen sizes


### v2.2.0
- Added support for TCF v2, Reject button and perPurposeConsent
- hasConsent deprecated and replaced with isConsentGiven
- added shouldGetConsent function for more custom implementations

### v2.1.1

- Updated Objective-C support

### v2.1.0

- Added xcframework support

### v2.0.0

- Added csVersion option

### v1.3.2

- Added timestamp to saveConsent() and CMPStorage

### v1.3.0

- [[1156983726335026]](https://app.asana.com/0/1119013479684024/1156983726335026) added cssContent and jsonContent options

### v1.2.0

- [[1161773571383131]](https://app.asana.com/0/1119007460835119/1161773571383131) Add dismissColor setting and only show closing X in first layer
- [[1161781810354809]](https://app.asana.com/0/1119007460835119/1161781810354809) Allow webview to make popup smaller again
- [[1161621497198476]](https://app.asana.com/0/1119007460835119/1161621497198476) Pass sdk version to mobile.htm

### v1.1.3

- fixed close button X appearance
- fix css escaping of single quote

### v1.1.2

- [[1160772117763121]](https://app.asana.com/0/1119007460835119/1160772117763121/f) Implemented connection check and **skipNoticeWhenOffline** option

### v1.1.1

- Changed default for **forceConsent** to true

### v1.1.0

- [[1158265374760537]](https://app.asana.com/0/1119007460835119/1158265374760537) Implemented **acceptIfDismissed** option

### v1.0.1
- [[1156999731777208]](https://app.asana.com/0/search/1159806015386929/1156999731777208) Added support for iOS 10

### v1.0.0

- Initial release
