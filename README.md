<p align=center><img src="https://github.com/user-attachments/assets/44e8d1a0-fafc-4ab4-a2e9-97c38a091511" width="256"></p>
<h3 align=center>Simple Bakery (Mobile)</h3>
<p align=center>A Microbakery Management Platform</p>

## User Stories

TEMPLATE: As a _____, I want to be able to _______, so that _____________.

As a business owner, I want to be able to keep track of my inventory, so that it is easier to decide what raw materials I need to buy. 

## Environment Setup

### Windows

TODO

### Mac


Some Flutter components require the Rosetta 2 translation process on Macs running Apple silicon. To run all Flutter components on Apple silicon, install Rosetta 2.

Run to install Rosetta 2.

```
sudo softwareupdate --install-rosetta --agree-to-license
```

Additionally verify that you have Visual Studio Code version 1.77 or later and have downloaded the flutter extension in VS Code. (Installing flutter with VS Code is simpler and this is highly recommended)

Launch VS Code, open the Command Palette, press `Command + Shift + P`. In the Command Palette, type flutter. Select Flutter: New Project. Then VS Code prompts you to locate the Flutter SDK on your computer. If you have the Flutter SDK installed, click Locate SDK. If you do not have the Flutter SDK installed, click Download SDK. When prompted Which Flutter template?, ignore it. Press `Esc`. You can create a test project after checking your development setup.

When the Select Folder for Flutter SDK dialog displays, choose where you want to install Flutter. VS Code places you in your user profile to start. Choose a different location. Consider ~/development/
Click `Clone Flutter`.
While downloading Flutter, VS Code displays this pop-up notification:

```
Downloading the Flutter SDK. This may take a few minutes.
content_copy
This download takes a few minutes. If you suspect that the download has hung, click Cancel then start the installation again.
```

Once it finishes downloading Flutter, the Output panel displays.

```
Checking Dart SDK version...
Downloading Dart SDK from the Flutter engine ...
Expanding downloaded archive...
```
When successful, VS Code displays this pop-up notification:
```
Initializing the Flutter SDK. This may take a few minutes.
content_copy
```

While initializing, the Output panel displays the following:

```
Building flutter tool...
Running pub upgrade...
Resolving dependencies...
Got dependencies.
Downloading Material fonts...
Downloading Gradle Wrapper...
Downloading package sky_engine...
Downloading flutter_patched_sdk tools...
Downloading flutter_patched_sdk_product tools...
Downloading windows-x64 tools...
Downloading windows-x64/font-subset tools...
content_copy
```
This process also runs `flutter doctor -v`. At this point in the procedure, ignore this output. Flutter Doctor might show errors that don't apply to this quick start.

When the Flutter install succeeds, VS Code displays this pop-up notification:
```
Do you want to add the Flutter SDK to PATH so it's accessible
in external terminals?
content_copy
VS Code may display a Google Analytics notice.
```
If you agree, click `OK`. Then to enable flutter in all Terminal windows:
Close, then reopen all Terminal windows and restart VS Code

Add Flutter to your PATH by editing the shell config file (e.g., ~/.zshrc, ~/.bashrc, or ~/.bash_profile). Add:

```
export PATH="$PATH:<flutter_directory>/bin"
```
Configure IOS Development

TODO

### Fedora Linux

Run the following to install dependencies:

```
sudo dnf upgrade -y
sudo dnf install curl git unzip clang xz zip mesa-libGLU ninja-build gtk3-devel cmake
flatpak install com.google.AndroidStudio -y
```

Answer `2` when prompted by Flatpak.

Make sure you are running the latest version VS Code or Codium, and install the [Flutter extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter).

Press `Ctrl+Shift+P` and select "Flutter: New Project." Install SDK to `~/Bin/` when prompted, then add this line to your `~/.bashrc`, changing the username to your username:

```
export PATH=/home/USERNAME/Bin/flutter/bin/:$PATH
```

Open Android Studio and proceed through the initial setup, agreeing to all prompts and installing the SDK to `~/Bin/Android`.

Create an empty project, and open settings. Search `sdk` and select "Android SDK." Under SDK Tools, check the Android SDK Command-line Tools box. Apply and exit to begin downloading.

Exit Android Studio and run the following to set the Android Studio install location to the Flatpak path, changing the username to your username:

```
flutter config --android-studio-dir=/var/lib/flatpak/app/com.google.AndroidStudio/current/active/files/extra/android-studio
flutter config --android-sdk /home/USERNAME/Bin/Android/
```

Run the following, entering `y` to all license agreements:

```
flutter doctor --android-licenses
```

Now, running `flutter doctor` should pass all tests except for the test that determines what version Android Studio is. This is fine because Android Studio for Fedora is sandboxed in a Flatpak.

Run this to setup the environment to properly execute `flutter run`:

```
flutter clean
flutter build linux
```

## Creating a Project


After flutter is installed, run the following create the basic framework of the app. This will create a file with the name specified, and this will contain everything you need to run an app. 

```
flutter create <name>
```
In order to run the app, you will have to be in the Microbakery directory, and run `flutter run`. It will ask how you want to emulate the app. 
