import Flutter
import UIKit
import GoogleSignIn

@main
@objc class AppDelegate: FlutterAppDelegate {
    var googleSignInConfig: GIDConfiguration? // Declare the GIDConfiguration object
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Initialize Google Sign-In using the client ID
    if let clientID = Bundle.main.object(forInfoDictionaryKey: "847940954396-ullfbt8f6e7pd73eu74aepssegcep689") as? String {
        googleSignInConfig = GIDConfiguration(clientID: clientID)
    }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
  // Handle URL for Google Sign-In callback
  override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    return GIDSignIn.sharedInstance.handle(url)
  }
}
