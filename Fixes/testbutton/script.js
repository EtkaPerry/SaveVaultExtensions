function onTestClick() {
    // Get the extension host from the window
    const host = window.extensionHost;
    if (host) {
        // Show a notification using the extension host
        host.showNotification('Test Button', 'Test button clicked!', 'Info');
        // Log the click
        host.logMessage('official.testbutton', 'Test button was clicked');
    }
}
