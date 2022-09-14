# What these workflows do?

## [`audit.yaml`](./.github/workflows/audit.yaml)

This workflow scans dependencies of your package for vulnerabilities using
[oysteR](https://cran.r-project.org/web/packages/oysteR/index.html).
Dependencies can be retrieved either from `DESCRIPTION` file or from `renv.lock` file.

<img src="images/audit.png"  width="60%">

## [`bioccheck.yaml`](./.github/workflows/bioccheck.yaml)

This workflow implements Bioconductor-specific R package checks with
[BiocCheck](https://bioconductor.org/packages/release/bioc/html/BiocCheck.html).

<img src="images/bioccheck.png"  width="40%">

## [`build-check-install.yaml`](./.github/workflows/build-check-install.yaml)

This workflow includes the following activities:

1. Build an R package.
2. Run `R CMD check`.
3. Publish unit test summary.
4. Catch any notes, warnings etc. in the `R CMD check` output.
5. Install the package.

<img src="images/r-cmd-check.png"  width="50%">

## [`gitleaks.yaml`](./.github/workflows/gitleaks.yaml)

This workflow runs [`gitleaks`](https://github.com/zricethezav/gitleaks) on the repo to discover
any secrets that might have been hardcoded.

<img src="images/gitleaks.png"  width="50%">

Additionally, it runs [`presidio-cli`](https://github.com/insightsengineering/presidio-cli) to find
any personally identifiable information (PII) within the `git` repo.

<img src="images/presidio.png"  width="50%">

## [`grammar.yaml`](./.github/workflows/grammar.yaml)

This workflow uses [`write-good`](https://github.com/btford/write-good) to check changed files
with names matching a pattern for English sentences that could be corrected.
Then, it adds annotations to the pull request so that problematic grammar can be reviewed.

<img src="images/grammar1.png"  width="50%">
<img src="images/grammar2.png"  width="50%">

## [`licenses.yaml`](./.github/workflows/licenses.yaml)

This workflow generates a license report of R package's dependencies for
continuous compliance.

<img src="images/license-report.png"  width="50%">

## [`links.yaml`](./.github/workflows/links.yaml)

This workflow checks whether URLs embedded in code and documentation are valid. This workflow uses
[`lychee`](https://github.com/lycheeverse/lychee) to detect broken links. Occasionally, this check
will detect false positives of strings that look like URLs. To remedy, please add this false
positive to the `.lycheeignore` file.

<img src="images/links.png"  width="50%">

## [`linter.yaml`](./.github/workflows/linter.yaml)

This workflow lints the codebase using [`super-linter`](https://github.com/github/super-linter).

<img src="images/superlinter.png"  width="80%">

## [`pkgdown.yaml`](./.github/workflows/pkgdown.yaml)

Documentation for the R package is generated via this workflow. This workflow uses the
[`pkgdown`](https://pkgdown.r-lib.org/) framework to generate documentation in HTML,
and the HTML pages are then deployed to the `gh-pages` branch.

Moreover, an additional `Versions` dropdown is generated via the GitHub Action, so that
the end user can view multiple versions of the documentation for the package.

<img src="images/pkgdown.png"  width="30%">

## [`release.yaml`](./.github/workflows/release.yaml)

This workflow creates a GitHub release from a `git` tag and generates changelog based
on `NEWS.md` file.

<img src="images/release.png"  width="60%">

## [`roxygen.yaml`](./.github/workflows/roxygen.yaml)

This workflow uses [`roxygen`](https://roxygen2.r-lib.org/) to generate `.Rd` files in
`man/` directory. It also checks if manuals are up-to-date with roxygen comments in the code.

<img src="images/roxygen.png"  width="80%">

## [`spelling.yaml`](./.github/workflows/spelling.yaml)

Spellchecks are performed by this workflow, and the
[`spelling`](https://docs.ropensci.org/spelling/) R package is used to detect spelling mistakes.
In the `inst/WORDLIST` file, you can add words and/or acronyms that you want the
spell check to ignore.

<img src="images/spellcheck.png"  width="80%">

## [`style.yaml`](./.github/workflows/style.yaml)

Code style is enforced via the [`styler`](https://styler.r-lib.org/) R package. The workflow
can be configured to commit files that had styling problems automatically, after
remediating the problems.

<img src="images/styler.png"  width="90%">

## [`test-coverage.yaml`](./.github/workflows/test-coverage.yaml)

This workflow examines the test coverage of given R package with [`covr`](https://covr.r-lib.org/).
Following that, coverage report is added to the PR. Additional feature is the ability
to compare code coverage between branches, so the PR can be declined if the coverage
would decrease following the merge.

The second part of the workflow runs utilizes `covtracer` to:

* prepare traceability matrix
* identify untested behavior
* verify directly tested functions

## [`validation.yaml`](./.github/workflows/validation.yaml)

This workflow generates and publishes validation report.

<img src="images/validation1.png"  width="40%">
<img src="images/validation2.png"  width="60%">

## [`version-bump.yaml`](./.github/workflows/version-bump.yaml)

This workflow increases R package version in `NEWS.md` and `DESCRIPTION` files and
commits this change to the repository.

<img src="images/version-bump.png"  width="60%">

## [`version.yaml`](./.github/workflows/version.yaml)

This workflow checks if `NEWS.md` and `DESCRPTION` files have the same R package version.

<img src="images/version.png"  width="60%">
