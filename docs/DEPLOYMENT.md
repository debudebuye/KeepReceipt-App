# Deployment Guide

## Prerequisites

- Flutter SDK (latest stable)
- Android Studio / Xcode (for mobile builds)
- Git

## Pre-Deployment Checklist

### Code Quality
- [ ] Run `flutter analyze` - should show no issues
- [ ] Run `flutter test` - all tests should pass
- [ ] Review code for hardcoded secrets or API keys
- [ ] Update version in `pubspec.yaml`
- [ ] Update `CHANGELOG.md` with release notes

### Android Release Setup

#### 1. Generate Keystore (First Time Only)
```bash
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

#### 2. Create key.properties
Create `android/key.properties`:
```properties
storePassword=<your-store-password>
keyPassword=<your-key-password>
keyAlias=upload
storeFile=<path-to-keystore>
```

**Important**: Never commit `key.properties` or keystore files to Git!

#### 3. Build Release APK
```bash
# Build APK
flutter build apk --release

# Or build App Bundle (recommended for Play Store)
flutter build appbundle --release
```

#### 4. Test Release Build
```bash
flutter install --release
```

#### 5. Code Obfuscation
The app is configured with R8 code shrinking and ProGuard obfuscation:
- Enabled in `android/app/build.gradle.kts`
- Rules defined in `android/app/proguard-rules.pro`
- Mapping files saved to `build/app/outputs/mapping/release/`

**Important**: Backup ProGuard mapping files for each release to debug crashes!

### iOS Release Setup

#### 1. Configure Signing in Xcode
1. Open `ios/Runner.xcworkspace` in Xcode
2. Select Runner target
3. Go to Signing & Capabilities
4. Select your Team
5. Configure Bundle Identifier

#### 2. Build Release
```bash
# Build iOS release
flutter build ios --release

# Or build IPA for App Store
flutter build ipa --release
```

#### 3. Upload to App Store
Use Xcode or Transporter app to upload the IPA.

### Web Deployment

#### Build Web Release
```bash
flutter build web --release
```

#### Deploy Options

**Firebase Hosting:**
```bash
firebase init hosting
firebase deploy --only hosting
```

**Netlify:**
- Drag and drop `build/web` folder to Netlify
- Or connect GitHub repo for auto-deployment

**Vercel:**
```bash
vercel --prod
```

## Google Play Store Submission

### Required Assets
- App icon (512x512 PNG)
- Feature graphic (1024x500 PNG)
- Screenshots (phone, 7-inch tablet, 10-inch tablet)
- Privacy policy URL
- Store listing description

### Steps
1. Create app in Google Play Console
2. Upload App Bundle (`.aab` file)
3. Complete store listing
4. Set up pricing & distribution
5. Submit for review

## Apple App Store Submission

### Required Assets
- App icon (1024x1024 PNG)
- Screenshots for all device sizes
- Privacy policy URL
- App description

### Steps
1. Create app in App Store Connect
2. Upload build via Xcode or Transporter
3. Complete app information
4. Submit for review

## Post-Deployment

### Monitoring
- Monitor crash reports
- Track user feedback
- Monitor app performance
- Check analytics (if implemented)

### Updates
- Plan regular updates
- Fix critical bugs promptly
- Keep dependencies updated
- Maintain changelog

## Security Checklist

- [ ] No hardcoded secrets in code
- [ ] Keystore and signing keys secured
- [ ] ProGuard mapping files backed up
- [ ] Privacy policy published
- [ ] Terms of service published
- [ ] Security policy documented

## Version Management

Update version in `pubspec.yaml`:
```yaml
version: 1.0.0+1  # version+build_number
```

- First number: Major version (breaking changes)
- Second number: Minor version (new features)
- Third number: Patch version (bug fixes)
- Build number: Increment for each release

## Rollback Plan

If issues are found after release:
1. Identify the issue
2. Fix in code
3. Increment version
4. Build and test thoroughly
5. Deploy hotfix
6. Monitor closely

## Support

For deployment issues:
- Check Flutter documentation
- Review platform-specific guides
- Check GitHub issues
- Contact platform support

---

**Last Updated**: December 2, 2024
