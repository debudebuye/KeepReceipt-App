# Keep Flutter wrapper classes
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Keep Hive classes for local storage
-keep class * extends com.hivedb.** { *; }
-keepclassmembers class * extends com.hivedb.** { *; }
-keep @interface com.hivedb.** { *; }

# Keep camera plugin classes
-keep class io.flutter.plugins.camera.** { *; }

# Keep image picker plugin classes
-keep class io.flutter.plugins.imagepicker.** { *; }

# Keep path provider plugin classes
-keep class io.flutter.plugins.pathprovider.** { *; }

# Keep model classes (adjust package name as needed)
-keep class com.keepreceipt.keep_receipt.** { *; }

# Preserve line numbers for debugging stack traces
-keepattributes SourceFile,LineNumberTable

# Hide original source file name
-renamesourcefileattribute SourceFile
