#!/bin/bash

unset newName
while [ -z "$newName" ]; do
     read -p "Please provide a new project name: " newName
done

unset newBundle
while [ -z "$newBundle" ]; do
     read -p "Please provide a new bundle identifier: " newBundle
done

# constants
podsDir="./Pods"
oldName="Example Project"
oldModuleName="Example_Project"
oldBundle="be.appwise.Example-Project"

newModuleName=${newName// /_}
if [[ $newModuleName =~ ^[0-9] ]]; then
	newModuleName="_${newModuleName:1}"
fi

echo "Renaming to:"
echo "- Target: $newName"
echo "- Module: $newModuleName"
echo "- Bundle: $newBundle"

# move files to new locations, we handle up to 2 levels deep of renaming
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

# replace name in files
echo "Replacing '$oldName' with '$newName'..."
grep -rl --null "$oldName" --exclude-dir="$podsDir" --exclude="rename.sh" . | xargs -0 sed -i '' "s/$oldName/$newName/g"

echo "Replacing '$oldModuleName' with '$newModuleName'..."
grep -rl --null "$oldModuleName" --exclude-dir="$podsDir" --exclude="rename.sh" . | xargs -0 sed -i '' "s/$oldModuleName/$newModuleName/g"

echo "Replacing '$oldBundle' with '$newBundle'..."
grep -rl --null "$oldBundle" --exclude-dir="$podsDir" --exclude="rename.sh" "." | xargs -0 sed -i '' "s/$oldBundle/$newBundle/g"

echo "Done!"
