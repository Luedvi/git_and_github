# [Pull request template](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/creating-a-pull-request-template-for-your-repository)
When you add a pull request template to your repository, project contributors will automatically see the template's contents in the pull request body.
You can create a PULL_REQUEST_TEMPLATE/ subdirectory in any of the supported folders to contain multiple pull request templates, and use the template
query parameter to specify the template that will fill the pull request body.

- To make your pull request template visible in the repository's root directory, name the pull request template pull_request_template.md.
- To make your pull request template visible in the repository's docs directory, name the pull request template docs/pull_request_template.md.
- To store your file in a hidden directory, name the pull request template .github/pull_request_template.md.
- To create multiple pull request templates and use the template query parameter to specify a template to fill the pull request body, type .github/PULL_REQUEST_TEMPLATE/, then the name of your pull request template. For example, .github/PULL_REQUEST_TEMPLATE/pull_request_template.md. You can also store multiple pull request templates in a PULL_REQUEST_TEMPLATE subdirectory within the root or docs/ directorie
