# Keep ML Kit classes
-keep class com.google.mlkit.** { *; }
-dontwarn com.google.mlkit.**

# Keep Google Play Services
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**

# Keep Vision Text Recognition
-keep class com.google.mlkit.vision.text.** { *; }

# Keep Firebase annotations
-keepattributes *Annotation*