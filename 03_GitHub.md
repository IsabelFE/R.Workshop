R GitHub Integration
================
Escapa I.F.
2023-05-24

<br></br> <br></br>

# GitHub Integration

See <https://happygitwithr.com> for more info

## SSH keys

See instructions here: <https://happygitwithr.com/ssh-keys.html>

## Make a repo on GitHub

You can create a repo on your own profile page, click on “Repositories”,
then click the green “New” button.

Consider creating the new repo on a Team page if this is a Team Project.

Copy the SSH clone URL to your clipboard via the green “Clone or
Download” button.

## Clone the new GitHub repository to your computer via RStudio

In RStudio, start a new Project: **File \> New Project \> Version
Control \> Git.** In “Repository URL”, paste the URL of your new GitHub
repository. Accept the default project directory name, e.g. myrepo,
which coincides with the GitHub repo name and pay attention to where you
save it!

## Make local changes, save, commit and push

From RStudio, modify the README.md file, e.g., by adding the line “This
is a line from RStudio”. Save your changes.

Commit these changes to your local repo from RStudio:

- Click the “Git” tab in upper right pane.
- Check “Staged” box for README.md.
- If you’re not already in the Git pop-up, click “Commit”.
- Type a message in “Commit message”, such as “Commit from RStudio”.
- Click “Commit”.

Now Push your local changes online to GitHub: click the green “Push”
button to send your local changes to GitHub. Go back to the browser and
confirm the local change propagated to GitHub.

## Ignore files in GitHub

The .gitignore file’s purpose is to prevent everyone who collaborates on
the same project from accidentally committing some common files in a
project, such as generated cache files. This is really IMPORTANT if you
make edits to the .Rprofile file like editing the path to a Python
environment (See reticulate package below)

You can open the .gitignore file with this code

``` r
file.edit(".gitignore")
```

You can paste the following file names and save the file:

    # History files
    .Rhistory
    .Rapp.history

    # Session Data files
    .RData

    # User-specific files
    .Ruserdata

    # Example code in package build process
    *-Ex.R

    # Output files from R CMD build
    /*.tar.gz

    # Output files from R CMD check
    /*.Rcheck/

    # RStudio files
    .Rproj.user/

    # produced vignettes
    vignettes/*.html
    vignettes/*.pdf

    # OAuth2 token, see https://github.com/hadley/httr/releases/tag/v0.3
    .httr-oauth

    # knitr and R markdown default cache directories
    *_cache/
    /cache/

    # Temporary files created by R markdown
    *.utf8.md
    *.knit.md

    # R Environment Variables
    .Renviron
    .Rprofile

    # Other

    **/.DS_Store
    /ignore

I recommend having an “ignore” folder in you project where you can keep
files you don’t want to get sync to the GitHub repo. For example big
files that can not be uploaded to GitHub. Then having a GitHubIgnored
folder in other clous service as backup for all your repos “ignore”
folders.
