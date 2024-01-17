#!/bin/bash

unset newName
while [ -z "$newName" ]; do
  read -p "Please provide a new project name (My Project): " newName
done

unset newBundle
while [ -z "$newBundle" ]; do
  read -p "Please provide a new bundle identifier (digital.wisemen.My-Project): " newBundle
done

unset newTeamID
while [ -z "$newTeamID" ]; do
  read -p "Please provide a new Apple Team ID (XXXXXXXXXX): " newTeamID
done

unset appleID
while [ -z "$appleID" ]; do
  read -p "Please provide your Apple ID (your.email@address.com): " appleID
done

unset newSentryProject
while [ -z "$newSentryProject" ]; do
  read -p "Please provide your Sentry Project slug (my-project-ios): " newSentryProject
done

unset newSentryDSN
while [ -z "$newSentryDSN" ]; do
  read -p "Please provide your Sentry DSN (https://<key>@sentry.appwi.se/<project>): " newSentryDSN
done

unset sentryToken
while [ -z "$sentryToken" ]; do
  read -p "Please provide your Sentry OAuth Token: " sentryToken
done

#### Steps ####

function fixPodfile {
  echo "Fixing Podfile..."

  # remove local pod path
  sed -i '' -e "s#, :path => '\.\./'#, '~> 2.0'#g" Podfile
}

function fixProjectfile {
  echo "Fixing project file..."

  # project template files
  sed -i '' \
   -e "s#\.\./XcodeGen#Pods/AppwiseCore/XcodeGen#g" \
   -e "s#3JQPC5UP5E#$newTeamID#g" \
   project.yml
}

function fixFastfile {
  echo "Fixing Fastfile..."

  # point scripts to right path
  sed -i '' -e "s#\.\./Fastlane Actions#Pods/AppwiseCore/Fastlane Actions#g" fastlane/Fastfile
}

function fixSourcery {
  echo "Fixing Sourcery..."

  # template files
  sed -i '' -e "s#\.\./Sourcery#Pods/AppwiseCore/Sourcery#g" .sourcery.yml
}

function fixSwiftGen {
  echo "Fixing SwiftGen..."

  # template files
  sed -i '' -e "s#\.\./SwiftGen#Pods/AppwiseCore/SwiftGen#g" swiftgen.yml
}

# move files to new locations, we handle up to 2 levels deep of renaming
function relocateFiles {
  echo "Moving files..."

  find . -path "$podsDir" -prune -o -name "*${oldName}*" -print0 | while IFS= read -r -d '' file; do
    target="${file/$oldName/$newName}"

    if [[ $target = *"$oldName"* ]]; then
      # already moved the parent
      deeperTarget="${target/$oldName/$newName}"
      mv "$target" "$deeperTarget"
    else
      mv "$file" "$target"
    fi
  done
}

function replaceText {
  echo "Replacing '$1' with '$2'..."

  grep -rl --null "$1" --exclude-dir=".git" --exclude-dir="$podsDir" --exclude="bootstrap.sh" . | LC_CTYPE=C LANG=C xargs -0 sed -i '' "s#$1#$2#g"
}

function configureFastlane {
  echo "Creating Fastlane environment file..."

  cat >.env <<EOL
# Your Apple email address
USER_APPLE_ID=$appleID

# Sentry configuration
SENTRY_AUTH_TOKEN=$sentryToken
EOL
}

function podUpdate {
  command -v bundle >/dev/null 2>&1 || { echo >&2 "I require Bundler but it's not installed.  Aborting."; exit 1; }

  echo "Installing gems..."
  bundle update >/dev/null

  echo "Installing pods..."
  bundle exec pod update >/dev/null
}

function cleanup {
  echo "Cleaning up..."
  rm -f "CHANGELOG.md"
  rm -f "LICENSE"
  rm -f "README.md"
  rm -rf Docs
  rm -f "bootstrap.sh"
}

function initializeGit {
  echo "Initializing Git..."
  rm -rf ".git"
  git init >/dev/null
  git checkout -b "main" >/dev/null
  git add "*" >/dev/null

  echo "Creating initial commit."
  git commit -m "Initial commit" >/dev/null

  echo "Adding commit hooks..."
  swift run komondor install >/dev/null

  echo "Creating branches."
  git branch "staging"
  git branch "development"
  git checkout "development"
}

#### Start of flow ####

# constants
podsDir="./Pods"
oldName="Example Project"
oldModuleName="Example_Project"
oldTeamID="XXXXXXXXXX"
oldBundle="be.appwise.Example-Project"
oldSentryProject="example-project-ios"
oldSentryDSN="https://<key>@sentry.io/<project>"

newModuleName=${newName// /_}
if [[ $newModuleName =~ ^[0-9] ]]; then
  newModuleName="_${newModuleName:1}"
fi

echo "Bootstrapping project:
- Target: $newName
- Module: $newModuleName
- Bundle: $newBundle
- Apple Team: $newTeamID
- Apple ID: $appleID
- Sentry Project slug: $newSentryProject
- Sentry DSN: $newSentryDSN
- Sentry OAuth Token: $sentryToken"
read -rsn1 -p "Press any key to continue";echo

fixPodfile
fixFastfile
fixProjectfile
fixSourcery
fixSwiftGen
relocateFiles

# replace name in files
replaceText "$oldName" "$newName"
replaceText "$oldModuleName" "$newModuleName"
replaceText "$oldTeamID" "$newTeamID"
replaceText "$oldBundle" "$newBundle"
replaceText "$oldSentryProject" "$newSentryProject"
replaceText "$oldSentryDSN" "$newSentryDSN"

configureFastlane
podUpdate
cleanup
initializeGit

echo "
Done!
"
