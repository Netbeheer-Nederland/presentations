# NBNL Models &emdash; Presentations

Here you find presentations about the information models created and maintained by Netbeheer Nederland.

## For developers

Development is done by working on files in the source directory: `src/`.

Here you'll find the following:

* **Presentations**, each stored in their own subdirectory in `src/` and represented as an `index.adoc` file.
* **Common assets** which are reused across presentations, e.g. introductory slides and often-used images, and stored in the reserved `src/common/` directory.
* **Themes** which stores files to do with theming/styling the presentations, e.g. logos, images and styling rules, stored in the reserved `src/themes/` directory.

### Local development

First, make sure you have a working Node.js installation in your active environment.

Then, you can install the project dependencies and run the build script.  **Make sure your working directory is the root of this Git repository**.

The dependencies are declared in `package.json` and locked in `package-lock.json`, and installing them can be achieved simply by running:

```shell
$ npm i
```

To build the presentation websites, run `build.sh`:

```shell
$ ./build.sh
```
If the build finishes succesfully, you can find the output in the directory `docs/`. Its directory structure is equal to that of `src/`, and each `index.adoc` will be accompanied there by an `index.html` which is the built result. Furthermore an index of all presentations is generated: `docs/index.html`.

> [!note]
> The title of the presentation is assumed to be the first level 2 heading found.

To view the built websites, you can either open the `index.html` file of a presentation in your browser, but easier is probably to run a local web server from the `docs/` directory which then lets you leverage the generated index.

For example, if you have Python installed in your environment, you could simply run something like:

```python
$ python -m http.server -d docs/
```

### Publishing

To build and publish the presentations, simply push the changes to the `main` branch. This will trigger a build on GitHub Actions which deploys the generated websites on GitHub Pages.

> [!note]
> In this GitHub Actions workflow the dependencies declared in `package-lock.json` are used.

The published website can be found at: https://modellen.netbeheernederland.nl/presentations/.
