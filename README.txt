# Jester King GM Simulator Publishing Package

This package builds:

1. A debug APK for private sharing
2. A signed release AAB for Google Play publishing

## Files

```text
main.py
buildozer.spec
README.txt
PRIVACY_POLICY.md
PLAY_STORE_LISTING.txt
generate-upload-keystore-windows.bat
.github/workflows/build-debug-apk.yml
.github/workflows/build-release-aab.yml
```

## Debug APK

Use this for testing and private sharing.

```text
Actions > Build Debug APK > Run workflow
```

Download:

```text
jester-king-gm-simulator-debug-apk
```

## Release AAB for Google Play

Before running the release workflow, create GitHub Secrets:

```text
ANDROID_KEYSTORE_BASE64
KEYSTORE_PASSWORD
KEY_ALIAS
KEY_PASSWORD
```

The included Windows batch file can create a keystore and base64 text file.

Run:

```text
generate-upload-keystore-windows.bat
```

Then add the secrets in GitHub:

```text
Settings > Secrets and variables > Actions > New repository secret
```

After secrets are added, run:

```text
Actions > Build Release AAB > Run workflow
```

Download:

```text
jester-king-gm-simulator-release
```

Upload the `.aab` to Google Play Console.

## Important

Do not commit your `.jks` keystore file to GitHub.

Keep the keystore and passwords safe. You need the same upload key for future updates.
