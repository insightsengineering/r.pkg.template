# Contributor guide

First of all, thank you for taking the time to contribute!✌️ 🎉

We love your input regardless of its size, content or scope - whether it is an issue, feature request, bug-fix or documentation enhancement.

Thanks 🙏 You rock 🤘

## Table Of Contents

[Getting started](#getting-started-👶)

[Code of Conduct](#code-of-conduct)

[License](#license)

[How to report a bug?](#how-to-report-a-bug-🐛)

[How to request the change?](#how-to-request-the-change-💡)

[How to submit a change?](#how-to-submit-a-change-🚩)

[Style guide](#style-guide-👗)

[Recognision model](#recognition-model-🧐)

[Any questions?](#any-questions-❓)

## Code of Conduct

This project is governed by [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to follow the rules outlined there.

## License

All of your code changes would be under the same [license](LICENSE) that covers this project.

## Getting started 👶

For an introduction, please read [`README`](README.md) file. You can also find vignettes [here](vignettes/). Most likely you would find a "Getting started" article. Please also see a package manual in form of `pkgdown` website.

## How to report a bug 🐛 ?

We use GitHub to track issues, feature requests as well as bugs. Before opening a new issue please double-check if it's already reported (but don't worry if  to be a duplicate - we will manage). If already there - up-vote ⬆️. We will have a look at it faster!

We kindly ask you to write a good issue with a minimal and reproducible example that showoff the problem. It's would be also great to know your local environment (R session info) as well. You will find our guides in the template while opening a bug ticket. This would speed up the fixing process a lot! 📈.

## How to request the change 💡 ?

In case you find a missing feature or you have an idea how to enhance existing functionalities - please let us know by creating a new issue. Before opening a new issue please double-check if it's already reported (but don't worry if occurs to be a duplicate - we will manage). If already there - up-vote ⬆️. We will have a look at it faster!

Please elaborate on "why?" - what's the context, what's the benefit and for whom it is. You will find our guides in the template while opening a feature request ticket. This would help us prioritize and submit meaningful changes.

## How to submit a change 🚩 ?

### GitHub Flow

We are following [GitHub Flow](https://docs.github.com/en/get-started/quickstart/github-flow) to collaborate in this repository. In order to submit the changes please do the following:

1. Open a branch

    Please see branching convention below. You can open a branch on remote as well as a fork.

1. Make changes.

     Make sure your code is passing all the checks, it is well documented and tested so as not to decrease existing test coverage 💪.

1. Create a PR(s)

    Please link an issue and make a good change description. Include development assumptions when necessary. Give all the details for a reviewer to efficiently check your changes.

1. Address review comments

    Please apply changes where necessary. If you disagree with a reviewer - please explain why.

1. Merge your PRs and delete a branch

### Branching convention

In case you are working on a task inside one specific repository, please name your branch

`<issue_id>_<short_description>` all lowercase. Multiple words of the description should be divided by an underscore (`_`).

E.g.

`15_fix_spelling_error` in case you try to solve a spelling mistake mentioned in the issue number `15`.

In case you are working on a task from one repository that affects multiple repositories, please always
name your branches:

`<issue_id>_<issue_repo>_<short description>` all lowercase. Multiple words of the description should be divided by an underscore (`_`).

E.g.

`15_teal_fix_spelling_error` in case you try to solve a spelling mistake inside `teal.data`
which closes issue `15` inside `teal`.

### Monorepo and staged.dependencies

Sometimes in order to introduce a change you also need a change from an upstream dependent package. We are using [staged.dependencies](https://github.com/openpharma/staged.dependencies) functionality to simulate a monorepo behavior. You just need to name the feature branches identically to take advantage of that. Please read the package manual for more details.

### Recommended development environment & tools

#### R & package versions

We continuously test our packages against the newest R version as well as a given package dependencies. We recommend to set-up your working environment in the same way. You can find all the details in any of the actions.

If you find out any bugs on the older version of dependencies - please create a bug ticket.

#### pre-commit

We highly recommend the [`pre-commit`](https://pre-commit.com/) tool combined with [`R hooks for pre-commit`](https://github.com/lorenzwalthert/precommit) to execute some of the checks prior committing and pushing. The configuration is already there in a repo. Please, follow the installation guide on the official [`pre-commit` page](https://github.com/lorenzwalthert/precommit)
and the [`GitHub` `readme` page](https://github.com/lorenzwalthert/precommit#installation) for the R hooks.

## Style guide 👗

This repository follows standard [`tidyverse` style guide](https://style.tidyverse.org/) and it's being checked against it by [`lintr`](https://github.com/r-lib/lintr). There are some slight modifications to its default settings available in [`.lintr`](.lintr) file.

Although it allows for some flexibility - we recommend to stick to the style already present in the existing code. At the end of the day we want to have consistent codebase.

Please note that there is a style and also `lintr` check in place that would validate your code.

## Recognition model 🧐

Any contribution is highly welcomed and appreciated. While all the contribution data is already there in GitHub repository insights feature, we introduced some objective rules to recognize a _significant_ contribution so as to became a package author:

- Minimum 5% of lines of code authored (determined by `git blame` query) OR
- Being at the top 5 contributors in terms of number of commits OR lines added OR lines removed.

The package maintainer also reserve the rights to manually adjust the criteria to recognize contributions.

## Any questions ❓

If you have any further questions regarding contribution - please reach out to the repo maintainer!
