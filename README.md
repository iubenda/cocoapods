# Developer's Guide


## Add the Iubenda SDK to your project

- Use Cocoapods, with the following configuration
```
platform :ios, '10.0'
source "https://github.com/iubenda/cocoapods.git"
target 'MyApp' do
  use_frameworks!
  pod 'IubendaMobileSDK', '2.7.1'
end
```

To automatically update the library version with pod update, you can set the dependency as:
- `'IubendaMobileSDK', '~> 2.7.1'` for trivial updates
- `'IubendaMobileSDK', '~> 2.7'` for minor updates
- `'IubendaMobileSDK'` for all updates

To use the library in your code:
- Add `import iubenda` in your source files for Swift
- Add `#import <iubenda/iubenda-Swift.h>` in your source files for Objective-C

## Initialize the SDK

In your AppDelegate class, inside the `didFinishLaunchingWithOptions` method, create a configuration object with your settings and call `IubendaCMP.initialize()`

```swift
let config = IubendaCMPConfiguration()
config.gdprEnabled = true
config.siteId = "12345"
config.cookiePolicyId = "252372"
config.applyStyles = true
config.cssFile = Bundle.main.path(forResource: "custom_style", ofType: "css")
config.jsonFile = Bundle.main.path(forResource: "config", ofType: "json")
config.bannerPosition = BannerPosition.TOP
IubendaCMP.initialize(with: config)
```

### Settings

|setting|default|description|
|-------|-------|----------|
|csVersion|current|Allow to define which version of the ConsentSolution to use; accepted values are "current", "beta", "stable" or a specific version number|
|gdprEnabled|false|proxy for IAB’s IABConsent_SubjectToGDPR setting. If false, Mediation SDK can run mediation across all ad network SDKs. Otherwise, Mediation SDK will run mediation only among the ad network SDKs that are GDPR ready|
|siteId| | Id of the customer's site on iubenda|
|cookiePolicyId| | Id of the customer's Cookie Policy on iubenda|
|jsonFile| |JSON file path to pass custom configuration to the consent UI|
|jsonContent| |Same as above, but set as a String|
|forceConsent|true|If true, the consent screen will be presented to the user until consent is granted, helping you to maximize consents. If false, askConsent() won’t have any effect if the user dismisses the consent request after the first launch|
|cssFile| |CSS file path for adding custom style to the consent UI. Custom CSS can be applied on top of the standard one (applyStyles=true) or by itslef (applyStyles=false)|
|cssContent| |Same as above, but set as a String|
|applyStyles|true|If true (default) the standard css style is applied to the consent UI|
|acceptIfDismissed|false|(default false) If true, when dismissing the popup, and the JS is ready, the notice is accepted|
|preventDismissWhenLoaded|false|If true, once the popup is fully loaded, it's not possible to dismiss it without expressing a preference|
|skipNoticeWhenOffline|true|If enabled, askConsent() will not show the popup if no internet connection is detected|
|dismissColor| |Allows to set a custom color for the close button (&times;). If not set, the textColor value in the JSON will be applied. If also textColor is not set, the default color will be used|
|bannerPosition|BannerPosition.TOP - BannerPosition.CENTER - BannerPosition.BOTTOM|Position of Consent Banner Pop-Up(default:CENTER)|
|invalidateConsentBefore|Date(dd/MM/yyyy - yyyy/MM/dd - dd-MM-yyyy - yyyy-MM-dd - dd.MM.yyyy - yyyy.MM.dd)|Accepts a Date, and if valued, it should check if there is a preference already expressed, and if there is and the timestamp is lesser than the day of the configured date then it should not consider the preference anymore|
|expireAfter|Integer|If valued, number of days of the consent timestamp and the integer value of expireAfter parameter will be compared, if consent date is passed, the data on device will be cleared (Default: 360 days)|
|proxyUrl||Rewrite the URL that it uses to embed CS|
|landscapeHeight|Integer|Set custom height for the first layer in landscape mode|
|landscapeWidth|Integer|Set custom width for the first layer in landscape mode|
|portraitHeight|Integer|Set custom height for the first layer in portrait mode|
|portraitWidth|Integer|Set custom width for the first layer in portrait mode|
|automaticHandlingOfAtt|false|If true, SDK will handle the ATT on iOS automatically|



## Show the consent UI

| Method            |Description|
|-------------------|-----------|
| askConsent()      |Presents the consent UI at app launch|
| openPreferences() |Allow users to change their consent preferences when consent has already been given. Otherwise, it opens the consent request|
| clearData()       |Removes all CMP data from local storage|

To present the consent UI at app launch, call `IubendaCMP.askConsent(from: self)` from your main ViewController’s `viewDidLoad` method:

- if there’s no internet connection, the call won’t have any effect (provided that `skipNoticeWhenOffline` is not set to false);
- if consent has already been given, the call won’t have any effect;
- if consent has not already been given and a connection is available, `IubendaCMP.askConsent(from: self)` will make the consent request appear.

Please note that if you’ve set `forceConsent` to false, `IubendaCMP.askConsent(from: self)` won’t have any effect if the user dismisses the consent request after the first launch: to show the consent UI again you’ll have to call `IubendaCMP.openPreferences(from: self)`.

So, if your goal is to maximize consents:
- set `forceConsent` to true, and
- call `IubendaCMP.askConsent(from: self)`

Otherwise, if you prefer to give the user the chance to dismiss the consent request without being prompted again whenever `IubendaCMP.askConsent(from: self)` is called again:
- set `forceConsent` to false
- call `IubendaCMP.askConsent(from: self)`, but note that it won’t have any effect after the first launch
- to ask for consent again, call `IubendaCMP.openPreferences(from: self)`

Notes about `IubendaCMP.openPreferences(from: self)`:
- if consent has not already been given, `IubendaCMP.openPreferences(from: self)` will open the consent request;
- if consent has already been given, `IubendaCMP.openPreferences(from: self)` will allow users to change their consent preferences.

To have complete control of when to show the consent request, you could rely entirely on `IubendaCMP.openPreferences(from: self)`, but you’ll have to implement a way to check if consent has been given.

## Custom consent UI

You can use a custom UI to ask for user consent, without showing the provided popup; in this case, you can take advantage of the following methods of `IubendaCMP`:

| Method                      |Description|
|-----------------------------|-----------|
| accept()                    |Sets the default consent in background|
| openTcfPreferences()        |Opens a popup for setting consent preferences|
| openTcfVendorsPreferences() |Opens a popup for setting vendors preferences|
| openCookiePolicy()          |Opens a popup showing the cookie policy|
| shouldGetConsent()          |You can call this function to check whether it is necessary to ask for user consent, or preference has already been expressed|
| shouldGetConsentForInvalidateConsentBefore()|You can call this function to check whether it is necessary to ask for user consent if the timestamp is lesser than the day of the configured invalidateConsentBefore date parameter|
| isPreferenceExpressed       |Return true if the SDK detects an already stored valid preference, "valid" means that if the preference is invalidated by invalidateConsentBefore then the method should return false |
| reject()                    |Reject the default consent in background|
| canOpenPreferences()        |returns true if there is a saved preferences|
| requestAttConsent()         |Opens ATT system-permission alert. If user rejects tracking, then clearing the preferences on device|
| getATTStatus()              |returns the users ATT status which will be Accepted or Denied. Note that .denied, .notDetermined, .restricted statuses|

When using a `open*` method, you can use the notification observer (see below) to detect when the user has given consent.

Example:
```swift
import UIKit
import iubenda

class ConsentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(
                        self,
                        selector: #selector(consentDidChange),
                        name: NSNotification.Name.ConsentChanged,
                        object: nil
                )
    }

    @IBAction func acceptClick(_ sender: Any) {
        IubendaCMP.accept()
        dismiss(animated: true)
    }

    @IBAction func optionsClick(_ sender: Any) {
        IubendaCMP.openTcfPreferences(from: self)
    }

    @objc func consentDidChange() {
        if IubendaCMP.isConsentGiven() {
            dismiss(animated: true)
        }
    }
}
```


## Accessing to IAB settings

You can access to the IAB settings, such as the encoded consent string, either directly as IAB specs or through the convenience methods offered by `IubendaCMP.storage`.

#### Available settings
|Method|Description|
|-------|-----------|
|consentString|The consent string|
|subjectToGDPR|The SubjectToGdpr setting|
|cmpPresent|True if the CMP is present|
|parsedVendorConsents|The vendors binary String|
|parsedPurposeConsents|The purposes binary String|
|isPurposeConsentGivenFor(id)|Returns whether the consent was given for the passed purpose id|
|isVendorConsentGivenFor(id)|Returns whether the consent was given for the passed vendor id|
|consentTimestamp|Returns the timestamp of the consent (since v1.3.2)|

## Listening for changes

If necessary, you can listen to changes of user consent through the `NotificationCenter` by adding an observer for `NSNotification.Name.ConsentChanged`:

```swift
private func observeConsentNotification() {
    NotificationCenter.default.addObserver(
            self,
            selector: #selector(consentDidChange),
            name: NSNotification.Name.ConsentChanged,
            object: nil
    )
}

@objc func consentDidChange() {
    // ...
}
```

## Initializing libraries without IAB support

Third party libraries that do not directly adhere to the IAB framework, may need to be initialized separately depending on the consent status and preferences.
To achieve that, you can implement a change listener in your AppDelegate and call `IubendaCMP.isConsentGiven()`, and other methods, to evaluate the consent status.

Example:
```swift

import UIKit
import iubenda

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let config = IubendaCMPConfiguration()
        config.gdprEnabled = true
        config.siteId = "12345"
        config.cookiePolicyId = "252372"
        IubendaCMP.initialize(with: config)

        observeConsentNotification()
        initializeLibraries()

        return true
    }

    private func observeConsentNotification() {
        NotificationCenter.default.addObserver(
                self,
                selector: #selector(consentDidChange),
                name: NSNotification.Name.ConsentChanged,
                object: nil
        )
    }

    @objc func consentDidChange() {
        initializeLibraries()
    }

    private func initializeLibraries() {
        if (IubendaCMP.isConsentGiven()) {
            // setup other libraries
        }
    }
    
    private func initializeLibrariesForTCF() {
        if (IubendaCMP.isPurposeEnabled(id: 2)) {
            // Activate libraries that use "Functionality" purpose
        }
        if (IubendaCMP.isPurposeEnabled(id: 3)) {
            // Activate libraries that use "Measurement" purpose
        }
        ...
    }
    
}

```


# Offline and errors
The library requires an internet connection to display the consent popup, hence to generate or update the consent string, while the latest consent string is always available on local storage through `IubendaCMP.storage`.

By default, the `askConsent` method checks for internet connection before launching the popup activity, so, if there is no connection, the popup is not shown, but will be presented on the next launch.
If an error occurs during the consent flow, instead, an error message is shown with the option to retry or close the popup. In this case, setting `forceConsent=true` ensures that the popup will be presented again if no consent has been given.



