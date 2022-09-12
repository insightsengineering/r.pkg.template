# What these workflows do?

### [`audit.yaml`](./.github/workflows/audit.yaml)

This workflow scans dependencies of your package for vulnerabilities using oysteR.
Dependencies can be retrieved either from `DESCRIPTION` file or from `renv.lock` file.

<img src="images/audit.png"  width="60%">

### [`bioccheck.yaml`](./.github/workflows/bioccheck.yaml)

This workflow implements Bioconductor-specific R package checks with [BiocCheck](https://bioconductor.org/packages/release/bioc/html/BiocCheck.html).

### [`build-check-install.yaml`](./.github/workflows/build-check-install.yaml)

This workflow:
* builds R package,
* runs `R CMD check`,
* publishes unit test summary,
* catches any notes, warnings etc. in the `R CMD check` output,
* installs the package.

<img src="images/r-cmd-check.png"  width="60%">

### [`gitleaks.yaml`](./.github/workflows/gitleaks.yaml)

This workflow runs `gitleaks` on the repo to discover any secrets that might have
been committed.

<img src="images/gitleaks.png"  width="60%">

Additionally, it runs `presidio-cli` to find any personally identifiable information
within the `git` repo.

<img src="images/presidio.png"  width="60%">

### [`grammar.yaml`](./.github/workflows/grammar.yaml)

This workflow checks changed files with names matching a pattern for English
sentences that could be corrected. Then, it adds annotations to the pull request
so that problematic grammar can be reviewed.

<img src="images/grammar1.png"  width="60%">
<img src="images/grammar2.png"  width="60%">

### [`licenses.yaml`](./.github/workflows/licenses.yaml)


This workflow generates a license report of R package's dependencies for
continuous compliance.

<img src="images/license-report.png"  width="60%">
