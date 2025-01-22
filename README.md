# CSC 4610 Web Warriors: Microbakery

This is a microbakery app for CSC 4610.

## User Stories

TEMPLATE: As a _____, I want to be able to _______, so that _____________.

As a business owner, I want to be able to keep track of my inventory, so that it is easier to decide what raw materials I need to buy. 

## Environment Setup

### Windows

TODO

### Mac

TODO

### Fedora Linux

Run the following to install dependencies:

```
sudo dnf upgrade -y
sudo dnf install curl git unzip xz zip mesa-libGLU
flatpak install com.google.AndroidStudio -y
```

Answer `2` when prompted by Flatpak.

Make sure you are running the latest version VS Code or Codium, and install the [Flutter extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter).

Press `Ctrl+Shift+P` and select "Flutter: New Project." Install SDK to `~/Bin/` when prompted, then add this line to your `~/.bashrc`, changing the username to your username:

```
export PATH=/home/USERNAME/Bin/flutter/bin/:$PATH
```

Open Android Studio and proceed through the initial setup, agreeing to all prompts and installing the SDK.

Create an empty project, and open settings. Search `sdk` and select "Android SDK." Under SDK Tools, check the Android SDK Command-line Tools box. Apply and exit to begin downloading.

Exit Android Studio and run the following, entering `y` to all license agreements:

```
flutter doctor --android-licenses
```

Run the following to set the Android Studio install location to the Flatpak path, changing the username to your username:

```
flutter config --android-studio-dir=/home/USERNAME/.local/share/flatpak/app/com.google.AndroidStudio/current/active/files/extra/android-studio
```

Now, running `flutter doctor` should pass all tests except for the test that determines what version Android Studio is. This is fine because Android Studio for Fedora is sandboxed in a Flatpak.
