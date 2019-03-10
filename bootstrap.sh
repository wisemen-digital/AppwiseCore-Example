#!/bin/bash

unset newName
while [ -z "$newName" ]; do
     read -p "Please provide a new project name (My Project): " newName
done

unset newBundle
while [ -z "$newBundle" ]; do
     read -p "Please provide a new bundle identifier (be.appwise.My-Project): " newBundle
done

unset appleID
while [ -z "$appleID" ]; do
     read -p "Please provide your Apple ID (your.email@address.com): " appleID
done

#### Steps ####

function deintegratePods {
	command -v pod >/dev/null 2>&1 || { echo >&2 "I require CocoaPods but it's not installed.  Aborting."; exit 1; }
	echo "Deintegrating pods..."
	pod deintegrate >/dev/null
}

function fixPodfile {
	echo "Fixing Podfile..."

	sed -i.bak -e "s/, :path => '\.\.\/'//g" Podfile && rm Podfile.bak
	sed -i.bak -e "s/\\\"\.\.\//\\\"\\\${PODS_ROOT}\/AppwiseCore\//g" Podfile && rm Podfile.bak
}

function fixSourcery {
	echo "Fixing Sourcery..."

	sed -i.bak -e "s/\.\.\//Pods\/AppwiseCore\//g" .sourcery.yml && rm .sourcery.yml.bak
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

	grep -rl --null "$1" --exclude-dir="$podsDir" --exclude="rename.sh" . | xargs -0 sed -i '' "s/$1/$2/g"
}

function configureFastlane {
	echo "Creating Fastlane environment file..."

	cat >.env <<EOL
# Your Apple email address
USER_APPLE_ID=$appleID
EOL
}

function podInstall {
	command -v pod >/dev/null 2>&1 || { echo >&2 "I require CocoaPods but it's not installed.  Aborting."; exit 1; }
	echo "Installing pods..."
	pod install >/dev/null
}

function cleanup {
	echo "Cleaning up..."
	rm -f "CHANGELOG.md"
	rm -f "LICENSE"
	rm -f "README.md"
	rm -f "bootstrap.sh"
}

#### Start of flow ####

# constants
podsDir="./Pods"
oldName="Example Project"
oldModuleName="Example_Project"
oldBundle="be.appwise.Example-Project"

newModuleName=${newName// /_}
if [[ $newModuleName =~ ^[0-9] ]]; then
	newModuleName="_${newModuleName:1}"
fi

echo "Bootstrapping project:"
echo "- Target: $newName"
echo "- Module: $newModuleName"
echo "- Bundle: $newBundle"
echo "- Apple ID: $appleID"
read -rsn1 -p "Press any key to continue";echo

deintegratePods
fixPodfile
relocateFiles

# replace name in files
replaceText "$oldName" "$newName"
replaceText "$oldModuleName" "$newModuleName"
replaceText "$oldBundle" "$newBundle"

configureFastlane
podInstall
cleanup

echo "Done!"
