Before you can start using your device, here are the usual steps needed before you can start using it for development.

# 1. Install Xcode

Use the tool [Xcodes.app](https://github.com/RobotsAndPencils/XcodesApp/), it allows you to easily manage multiple Xcode versions, and downloads & installs them **much**faster.
Make sure you've opened Xcode at least once, and installed the command line tools.

:warning: Never install from the App Store.

# 2. Install Homebrew

Open a terminal window and enter the following:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the instructions to add the right path definitions to your terminal configuration. Note that macOS by default uses ZSH.
Once ready, close your terminal window & reopen it. 

# 3. Setup Ruby

In that same terminal window:
```bash
# Install rbenv
brew install rbenv ruby-build

# Usually needed to actually install ruby versions (and to do so faster)
brew install openssl@3 readline libyaml gmp
```

Wait until done, then execute:
```bash
rbenv init
```

Follow the instructions to add the right path definitions to your terminal configuration. Note that macOS by default uses ZSH.
Once ready, :warning: close your terminal window & reopen it. :warning:
Install a ruby version using:
```bash
rbenv install -l

# Select a version from this list, for example 3.2.2
export RUBY_CONFIGURE_OPTS="--with-readline-dir=$(brew --prefix readline) --with-openssl-dir=$(brew --prefix openssl@3)"
rbenv install 3.2.2

# Set this ruby version as the global ruby version
rbenv global 3.2.2
```

Finally install bundler:
```bash
gem install bundler
```

# 4. Tools

This is a list of tools (generally) used for iOS development:
- Dash (Set App): documentation viewer
- DevUtils (Set App): Multiple little tools, such as JWT decoder
- Paste (Set App): clipboard (copy/paste) manager
- Proxyman (Set App): Debug network activity
- Paw (Set App): REST client
- Sip (Set App): Color picker

Further you’ll probably need:
- A git client, such as Fork
- A general text/code editor, such as Sublime or VS Code

# 5. Extra’s

- BartyCrouch: translation files mgmt.
- SwiftFormat: Swift code formatter
- SwiftGen: parses your assets to generate type-safe code
- SwiftLint: Swift code linter
- XcodeGen: Xcode project generation
- AppwiseCore: core iOS library
- AppwiseCore Example: iOS project template
