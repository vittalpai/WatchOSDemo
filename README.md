# Watch OS Demo

In order to use the demo app:

- Get into the WatchOSDemoApp and run `pod install`. Get into the WatchOSDemoApp and run `pod install`. We have a Podfile prepared located within the project.
- Open the workspace created - WatchOSDemoApp.xcworkspace
- See you have under Pods/Pods/IBMMobileFirstPlatformFoundation both IBMMobileFirstPlatformFoundation.framework and IBMMobileFirstPlatformFoundationWatchOS.framework.
- Edit mfpclient.plist to set `host` property. Remember the file should be member of both targets - WatchOSDemoApp and WatchOSDemoApp WatchKit Extension.
- Deploy the adapters UsernamePasswordAdapter.adapter, PinCodeAdapter.adapter and bankAdapter.adapter into the server.
- Register both apps com.worklight.WatchOSDemoApp and com.worklight.WatchOSDemoApp.watchkitapp.watchkitextension in the MFP console, and map the scope element `balanceCheckScope` to security check as follows:
<br>
For com.worklight.WatchOSDemoApp map it to `usernamePassword`
<br>
For com.worklight.WatchOSDemoApp.watchkitapp.watchkitextension map it to `pinCode`
- Run the app using the schema "WatchOSDemoApp WatchKit App".
- Click "My Balance" - Pin Code screen should be opened.
- Valid pin is "1234" (That can be changed in the security check using the MobileFirst Operations Console). Try first wrong pin - Pin Code screen should appear again with "Please try again". Try then the valid pin - you should get the balance.
- Do the same in the iPhone app - Login screen with username/password should be opened. Valid username/password is when username == password.
