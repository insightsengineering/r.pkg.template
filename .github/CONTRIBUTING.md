# Contribution Guidelines

First of all, thank you for taking the time to contribute! ✌️ 🎉

We love your input regardless of its size, content or scope - whether it is an issue, feature request, bug-fix or documentation enhancement.

Thanks 🙏 You rock 🤘

## Table of contents

[👶 Getting started](#getting-started)

[📔 Code of Conduct](#code-of-conduct)

[🗃 License](#license)

[🐛 How to report a bug?](#how-to-report-a-bug)

[💡 How to request the change?](#how-to-request-the-change)

[🚩 How to submit a change?](#how-to-submit-a-change)

[👗 Style guide](#style-guide)

[🧐 Recognition model](#recognition-model)

[❓ Any questions](#any-questions)

## Getting started

For an introduction, please read the [documentation][url_pkgdown] which usually includes ["Getting started" article][url_getting_started]. Please also see other [articles][url_articles].

## Code of Conduct

This project is governed by [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to follow the rules outlined there.

## License

All of your code changes would be under the same [license][url_license] that covers this project.

## How to report a bug?

We use GitHub to track issues, feature requests as well as bugs. Before opening a new issue please double-check if it's already reported (but don't worry if to be a duplicate - we will manage). If already there - up-vote ⬆️. We will have a look at it faster!

We kindly ask you to write a good issue with a minimal and reproducible example that demonstrates the problem. It would also be great to know your local environment (R session info) as well. You will find our template for issues when opening a bug ticket. This will speed up the fixing process a lot! 📈.

## How to request the change?

If you notice a missing feature or you have an idea how to enhance existing functionalities - please let us know by creating a new issue. Before opening a new issue please double-check if it's already reported (but don't worry if occurs to be a duplicate - we will manage). If already there - up-vote ⬆️. We will have a look at it faster!

Please elaborate on "why?" - what's the context, what's the benefit and for whom. You will find our template when opening a feature request ticket. This will help us prioritize and submit meaningful changes.

## How to submit a change?

### GitHub Flow

We are following [GitHub Flow](https://docs.github.com/en/get-started/quickstart/github-flow) to collaborate in this repository. In order to submit the changes please do the following:

1. Open a branch

   Please see branch naming convention below. If you don't have write access please fork it first.

1. Make changes.

   Make sure your code passes all the checks and is well documented and tested so as not to decrease existing test coverage 💪.

1. Create a PR(s)

   Please link an issue and make a good change description. Include development assumptions when necessary. Give all the details for a reviewer to efficiently check your changes.

1. Address review comments

   Please apply changes where necessary. If you disagree with a reviewer - please explain why.

1. Once approved - merge your PR(s) and delete a branch

### Branching convention

In case you are working on a task inside one specific repository, please name your branch `<issue_id>_<short_description>` all lowercase. Multiple words of the description should be divided by an underscore (`_`). E.g. `15_fix_spelling_error` in case you try to solve a spelling mistake mentioned in the issue number `15`.

In case you are working on a task from one repository that affects multiple repositories, please always name your branches: `<issue_id>_<issue_repo>_<short description>` all lowercase. Multiple words of the description should be divided by an underscore (`_`). E.g. `15_abc_fix_spelling_error` in case you try to solve a spelling mistake inside `xyz` which closes issue `15` inside `abc`.

### `monorepo` and `staged.dependencies`

Sometimes you might need to change upstream dependent package(s) to be able to submit a meaningful change. We are using [`staged.dependencies`](https://github.com/openpharma/staged.dependencies) functionality to simulate a `monorepo` behavior. The configuration is already in the `staged_dependencies.yaml` file. You just need to name the feature branches identically. This is the only exception from branch naming convention described above. Please read the package manual for more details.

### Recommended development environment & tools

#### R & package versions

We continuously test our packages against the newest R version as well as a given package dependencies. We recommend to set-up your working environment in the same way. You can find all the details in a given GitHub Action execution log - there is a step that prints out session info.

If you find out any bugs on the older version of dependencies - please create appropriate bug ticket.

#### `pre-commit`

We highly recommend the [`pre-commit`](https://pre-commit.com/) tool combined with [`R hooks for pre-commit`](https://github.com/lorenzwalthert/precommit) to execute some of the checks prior committing and pushing. The configuration is already there in the `.pre-commit-config.yaml` file. Please, follow the installation guide on the official [`pre-commit` page](https://github.com/lorenzwalthert/precommit) and the [`GitHub` `readme` page](https://github.com/lorenzwalthert/precommit#installation) for the R hooks.

## Style guide

This repository follows standard [`tidyverse` style guide](https://style.tidyverse.org/) and it's being checked against it by [`lintr`](https://github.com/r-lib/lintr). There are some slight modifications to its default settings available in the `.lintr` file.

Although it allows for some flexibility - we recommend sticking to the style of the existing code.

Please note that there is a style and also `lintr` check in place that will validate your code.

## Recognition model

Any contribution is highly welcomed and appreciated. While all the contribution data is already there in GitHub repository insights feature, we introduced some objective rules to recognize a _significant_ contribution so as to became a package author:

- Minimum 5% of lines of code authored (determined by `git blame` query) OR
- Being at the top 5 contributors in terms of number of commits OR lines added OR lines removed.

The package maintainer also reserves the rights to manually adjust the criteria to recognize contributions.

## Any questions

If you have any further questions regarding contribution - please reach out to the repository maintainer!

<!-- urls -->
[url_pkgdown]: https://insightsengineering.github.io/r.pkg.template/index.html
[url_getting_started]: https://insightsengineering.github.io/r.pkg.template/articles/r-pkg-template.html
[url_articles]: https://insightsengineering.github.io/r.pkg.template/articles/index.html
[url_license]: https://insightsengineering.github.io/r.pkg.template/LICENSE-text.html
