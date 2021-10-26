# r.pkg.template

An R package template with built-in Github Actions-based CI/CD workflows.

## Usage

* Assuming your package will be called `awesomeR`, and the Github owner (i.e. username or organization) is `awesome-owner`, set them as shell variables. This will be used for steps to follow:

```bash
package_owner="awesome-owner"
package_name="awesomeR"
```

* Clone this repo:

```bash
git clone https://github.com/insightsengineering/r.pkg.template.git ${package_name}
cd ${package_name}
```

* Remove the previous git history and re-initialize your git repo:

```bash
rm -rf .git
git init
```

* Replace references:

```bash
grep -rl "r.pkg.template" --exclude-dir='.git' | xargs perl -p -i -e "s/r.pkg.template/${package_name}/g"
grep -rl "insightsengineering" --exclude-dir='.git' | xargs perl -p -i -e "s/insightsengineering/${package_owner}/g"
```

* Rename the RStudio project file:

```bash
mv r.pkg.template.Rproj "${package_name}.Rproj"
```

* Update the remainder of the package as you would do typically while developing an R package.

* Enjoy!
