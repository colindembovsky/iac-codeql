# CodeQL IaC Scan

This repository contains a GitHub Actions workflow that uses CodeQL to analyze Infrastructure as Code (IaC) files using a custom extractor. The workflow is triggered on push and pull request events on the `main` branch, as well as manually via the GitHub Actions UI.

The repo for the extractor is here: https://github.com/advanced-security/codeql-extractor-iac

## Workflow

The workflow consists of the following steps:

1. Checkout the repository
2. Initialize and analyze IaC files using the community CodeQL extractor for IaC
3. Upload the results in SARIF format using the `github/codeql-action/upload-sarif` action

## Usage

To use this workflow, you need to have a CodeQL database set up for your IaC files. You can use the `advanced-security/codeql-extractor-iac` action to generate the database.

For more information on how to use CodeQL with IaC files, see the [CodeQL documentation](https://codeql.github.com/docs/codeql-for-infrastructure/).

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.