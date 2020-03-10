# Bump build number
perl -i -pe 's/^(version:\s+\d+\.\d+\.\d+\+)(\d+)$/$1.($2+1)/e' pubspec.yaml

# Run build_runner
flutter packages run build_runner clean
flutter packages run build_runner build --delete-conflicting-outputs

# Upload
flutter packages pub publish --force