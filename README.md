# AppwiseCore Example

This is an example project with some basic setup for using the AppwiseCore library. It is ideal as a start for a new iOS project.

## Getting started

To get started with your new project, run the `bootstrap.sh` script. It will prompt you for a new project name as follows:

```bash
$ ./bootstrap.sh
Please provide a new project name: My Example
Renaming to:
- Target: My Example
- Module: My_Example
- Bundle part: My-Example
Moving files...
Replacing 'Example Project' with 'My Example'...
Replacing 'Example_Project' with 'My_Example'...
Replacing 'Example-Project' with 'My-Example'...
Done!
```

After it's moved some files and replaced some identifiers, you can install the pods and open your new project!

**NOTE:** Only install the pods AFTER you've run the rename script. If you do it before, there's a high chance you might get a broken project, especially for projects with more special names (start with a number, contain spaces, etc...).

## Updating

This example project will regularly be updated with new practices, structures, etc... Check the [changelog](https://github.com/appwise-labs/AppwiseCore-Example/blob/master/CHANGELOG.md) to see what's changed since you based off this project.

## Author

[David Jennes](https://github.com/djbe)

## License

AppwiseCore Example is available under the MIT license. See the LICENSE file for more info.
