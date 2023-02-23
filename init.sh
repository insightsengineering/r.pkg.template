#!/usr/bin/env bash

########################################
# Repository initializer
#
# This is a self-destructing, one-time script
# that initializes your repository template
# to match your requirements.
########################################

set -euo pipefail

# Green echo
function gecho () {
    local green='\033[0;32m'
    local no_color='\033[0m'
    # shellcheck disable=SC2145
    echo -e "${green}$@${no_color}"
}

# Orange echo
function oecho () {
    local orange='\033[0;33m'
    local no_color='\033[0m'
    # shellcheck disable=SC2145
    echo -e "${orange}$@${no_color}"
}

gecho "Hello! Thank you for using r.pkg.template! Let us initialize your package."

echo -n "Please enter your GitHub username or organization name: "
read -r owner

echo -n "Enter your package's name here (eg. awesomeR): "
read -r pkg

echo -n "Retain the template's git history? Enter either 'yes' or 'no' (defaults to 'no'): "
read -r retain_git_history
retain_git_history=${retain_git_history:-"no"}

echo -n "Use shared workflows or use the original workflows? Enter 'yes' to use shared workflows (recommended) and 'no' to use the original workflows (defaults to 'yes'): "
read -r use_shared_workflows
use_shared_workflows=${use_shared_workflows:-"yes"}

gecho "Initializing your package. Standby..."

oecho "You've chosen '$retain_git_history' for retaining the template's git history"
if [ "$retain_git_history" == "no" ]
then {
    oecho "Removing template git history"
    rm -rf .git
} else {
    oecho "Template's git history retained"
}
fi

oecho "Replacing template references within files"
grep -rl --exclude=init.sh --exclude=*.shared \
    --exclude-dir=.git "r.pkg.template" . | \
    xargs perl -p -i -e "s/r.pkg.template/${pkg}/g"
perl -p -i -e "s/insightsengineering/${owner}/g" DESCRIPTION
perl -p -i -e "s/insightsengineering/${owner}/g" .github/ISSUE_TEMPLATE/*.yml
perl -p -i -e "s/insightsengineering/${owner}/g" _pkgdown.yml
perl -p -i -e "s/insightsengineering/${owner}/g" staged_dependencies.yaml
grep -rl --exclude=init.sh --exclude=*.shared \
    --exclude-dir=.git "REPO_GITHUB_TOKEN" . | \
    xargs perl -p -i -e 's/REPO_GITHUB_TOKEN/GITHUB_TOKEN/g'
perl -p -i -e 's@secrets.REPO_GITHUB_TOKEN@secrets.GITHUB_TOKEN@g' .github/workflows/*.shared
grep -rl --exclude=init.sh --exclude=*.shared \
    --exclude-dir=.git \
    "68416928+insights-engineering-bot@users.noreply.github.com" .github/workflows/ | \
    xargs perl -p -i -e 's/68416928\+insights-engineering-bot/41898282\+github-actions\[bot\]/g'
grep -rl --exclude=init.sh --exclude=*.shared \
    --exclude-dir=.git "insights-engineering-bot" .github/workflows/ | \
    xargs perl -p -i -e 's/insights-engineering-bot/github-actions/g'

oecho "Updating file names and removing unnecessary files"
mv r.pkg.template.Rproj "${pkg}.Rproj"
rm -rf \
    .github/CODEOWNERS \
    .github/ISSUE_TEMPLATE \
    .github/CONTRIBUTING.md \
    .github/PULL_REQUEST_TEMPLATE.md \
    .github/CODE_OF_CONDUCT.md \
    SECURITY.md \
    images \
    workflows.md
oecho "You've chosen '$use_shared_workflows' for using the shared workflows"
if [ "$use_shared_workflows" == "yes" ];
then {
    oecho "Removing the original workflows and using the shared workflows"
    rm -rf .github/workflows/*.yaml
    for shared in check docs release
    do {
        mv .github/workflows/$shared.yaml.shared .github/workflows/$shared.yaml
    }
    done
} else {
    oecho "Retaining the original workflows and removing the shared workflows"
    rm -rf .github/workflows/*.yaml.shared
}
fi

oecho "Resetting the package version"
reset_version="0.1.0"
perl -p -i -e "s@^Version: .*@Version: ${reset_version}@" DESCRIPTION
perl -p -i -e "s@^\# ${pkg} .*@\# ${pkg} ${reset_version}@" NEWS.md

oecho "Overwriting the README.md file"
echo -e "# ${pkg}\n\nShort description of the package" > README.md

gecho "Package successfully initialized!"
oecho "Please update the remainder of the package as you would do typically while developing an R package."

oecho "This utility will self-destruct in 3 seconds..."
sleep 3
rm -f "$0"

gecho "Enjoy!"
