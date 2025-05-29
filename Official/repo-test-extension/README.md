# Repository Test Extension

This extension is designed to test the repository pulling functionality of Save Vault's extension system.

## How to Install

1. Open Save Vault
2. Go to Tools → Extensions to open the Extension Manager
3. Click the "Install Repo Test" button
4. The extension will be installed and enabled automatically
5. Go back to the main window and check the Tools menu - you should see a "TEST Repo" button

## Upload Instructions for Repo Testing

To upload this extension to the SaveVaultExtensions repository for testing:

1. Copy the entire `repo-test-extension` folder to:
   `https://github.com/EtkaPerry/SaveVaultExtensions/tree/main/Official/repo-test-extension/`

2. Ensure the following files are included:
   - `manifest.json` (required)
   - `RepoTestExtension.dll` (compiled extension)
   - `README.md` (this file)

3. The extension will then be available for download via the extension manager

## What it does

- Adds a "TEST Repo" button to the Tools menu
- When clicked, confirms repository functionality is working
- Logs repository test activity

This extension serves as a test case for verifying that extensions can be properly downloaded and installed from the remote repository.

## Building (for developers)

To build this extension:

```bash
cd Extensions/LocalTestExtensions/repo-test-extension
dotnet build -c Release
cp bin/Release/net9.0/RepoTestExtension.dll .
```

The compiled DLL will be copied to the extension directory for installation.