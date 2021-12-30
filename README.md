# r.pkg.template

[pre-commit]: https://pre-commit.com
[pre-commit installation]: https://pre-commit.com/#installation
[git hooks]: https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks

An R package template with built-in Github Actions-based CI/CD workflows.

## Usage

- Assuming your package will be called `awesomeR`, and the Github owner (i.e. username or organization) is `awesome-owner`, set them as shell variables. This will be used for steps to follow:

```bash
package_owner="awesome-owner"
package_name="awesomeR"
```

- Clone this repository:

```bash
git clone https://github.com/insightsengineering/r.pkg.template.git ${package_name}
cd ${package_name}
```

- Remove the previous git history and re-initialize your git repository:

```bash
rm -rf .git
git init
```

- Replace references:

```bash
grep -rl "r.pkg.template" --exclude-dir='.git' | xargs perl -p -i -e "s/r.pkg.template/${package_name}/g"
grep -rl "insightsengineering" --exclude-dir='.git' | xargs perl -p -i -e "s/insightsengineering/${package_owner}/g"
```

- Rename the RStudio project file:

```bash
mv r.pkg.template.Rproj "${package_name}.Rproj"
```

- Overwrite the README file:

```bash
echo "# ${package_name} \n\nShort description of the package" > README.md
```

- Update the remainder of the package as you would do typically while developing an R package.

- Enjoy!

## Pre-commit

This repository contains an example [pre-commit] configuration.

[pre-commit] is a tool that uses [Git hooks] to identify and resolve simple issues prior to submission for code review.
[Git hooks] run on every commit to automatically point out and solve issues such as missing semicolons, trailing whitespaces,
code formatting and spell checks.

### Setting up pre-commit for R project

1. Install the `pre-commit` framework. Use the official [installation guide][pre-commit installation].
2. Install R package `precommit`

```sh
R -e 'install.packages("precommit")'
```

3. Run the `use_precommit()` function to generate an example pre-commit configuration called `.pre-commit-config.yaml`:

```sh
[ ! -f ".pre-commit-config.yaml" ] && R -e 'precommit::use_precommit()'
```

4. Install the git hooks script:

```sh
pre-commit install
```

5. From this moment all scripts from `.pre-commit-config.yaml` will run before every `git commit`
   command. If you want to run them manually without committing you can use command
   `pre-commit run --all-files`. For more information refer official [pre-commit] documentation.

> NOTE:
> Frequently run `pre-commit autoupdate` to update all repositories
> in `.pre-commit-config.yaml`.

### Example output from pre-commit

```sh
$ git add .
$ git commit -m "Add pre-commit configuration"
[INFO] Installing environment for https://github.com/pre-commit/pre-commit-hooks.
[INFO] Once installed this environment will be reused.
[INFO] This may take a few minutes...
style-files..............................................................Passed
roxygenize...........................................(no files to check)Skipped
use-tidy-description.....................................................Passed
spell-check..............................................................Failed
- hook id: spell-check
- exit code: 1
- files were modified by this hook

The following spelling errors were found:
  WORD          FOUND IN
commiting     README.md:77
indentify     README.md:49
informatoin   README.md:77
All spelling errors found were copied to inst/WORDLIST assuming they were not spelling errors and will be ignored in the future. Please  review the above list and for each word that is an actual typo:
 - fix it in the source code.
 - remove it again manually from inst/WORDLIST to make sure it's not
   ignored in the future.
 Then, try committing again.
Error: Spell check failed
Execution halted

lintr....................................................................Passed
readme-rmd-rendered......................................................Passed
parsable-R...............................................................Passed
no-browser-statement.....................................................Passed
deps-in-desc.............................................................Passed
prettier.................................................................Failed
- hook id: prettier
- files were modified by this hook

.pre-commit-config.yaml
README.md

Check for added large files..............................................Passed
Fix End of Files.........................................................Passed
Trim Trailing Whitespace.................................................Failed
- hook id: trailing-whitespace
- exit code: 1
- files were modified by this hook

Fixing .pre-commit-config.yaml
Fixing README.md

Check Yaml...............................................................Passed
Don't commit to branch...................................................Passed
Mixed line ending........................................................Passed
Don't commit common R artifacts......................(no files to check)Skipped

```
