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

echo -n "Please enter your Github username: "
read -r owner

echo -n "Enter your package's name here (eg. awesomeR): "
read -r pkg

echo -n "Do you want to retain the template's git history? Enter either 'yes' or 'no' (defaults to 'no'): "
read -r retain_git_history
retain_git_history=${retain_git_history:-"no"}

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
grep -rl --exclude-dir=.git "r.pkg.template" . | \
    xargs perl -p -i -e "s/r.pkg.template/${pkg}/g"
perl -p -i -e "s/insightsengineering/${owner}/g" DESCRIPTION
perl -p -i -e "s/insightsengineering\/idr/${owner}/g" .github/CODEOWNERS
perl -p -i -e "s/insightsengineering/${owner}/g" _pkgdown.yml
perl -p -i -e "s/insightsengineering/${owner}/g" staged_dependencies.yaml
grep -rl --exclude-dir=.git "REPO_GITHUB_TOKEN" . | \
    xargs perl -p -i -e 's/REPO_GITHUB_TOKEN/GITHUB_TOKEN/g'
grep -rl --exclude-dir=.git "68416928+insights-engineering-bot@users.noreply.github.com" .github/workflows/ | \
    xargs perl -p -i -e 's/68416928\+insights-engineering-bot/41898282\+github-actions\[bot\]/g'
grep -rl --exclude-dir=.git "insights-engineering-bot" .github/workflows/ | \
    xargs perl -p -i -e 's/insights-engineering-bot/github-actions/g'

oecho "Renaming files"
mv r.pkg.template.Rproj "${pkg}.Rproj"

oecho "Overwriting the README.md file"
echo -e "# ${pkg}\n\nShort description of the package" > README.md

gecho "Package successfully initialized!"
oecho "Please update the remainder of the package as you would do typically while developing an R package."

oecho "This utility will self-descruct in 3 seconds..."
sleep 3
rm -f "$0"

gecho "Enjoy!"
