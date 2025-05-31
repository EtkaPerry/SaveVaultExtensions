// Space Theme Extension JavaScript
document.addEventListener('DOMContentLoaded', function() {
    // Theme settings
    let themeSettings = {
        primaryColor: '#1a1a2e',
        secondaryColor: '#4b0082',
        accentColor: '#9370db',
        backgroundColor: '#0a0a1a',
        textColor: '#e6e6fa',
        animation: true
    };
    
    // Default theme settings (for reset functionality)
    const defaultThemeSettings = {
        primaryColor: '#1a1a2e',
        secondaryColor: '#4b0082',
        accentColor: '#9370db',
        backgroundColor: '#0a0a1a',
        textColor: '#e6e6fa',
        animation: true
    };
    
    // Initialize UI
    document.getElementById('primaryColor').value = themeSettings.primaryColor;
    document.getElementById('secondaryColor').value = themeSettings.secondaryColor;
    document.getElementById('accentColor').value = themeSettings.accentColor;
    document.getElementById('backgroundColor').value = themeSettings.backgroundColor;
    document.getElementById('textColor').value = themeSettings.textColor;
    document.getElementById('animation').checked = themeSettings.animation;
    
    // Update preview based on current settings
    updatePreview();
    
    // Apply theme button
    document.getElementById('applyTheme').addEventListener('click', function() {
        getSettingsFromUI();
        
        // Update preview
        updatePreview();
        
        // Generate theme data
        const themeData = generateThemeData(themeSettings);
        
        // Send to host application
        sendMessageToHost('applyTheme', themeData);
    });
    
    // Save theme button
    document.getElementById('saveTheme').addEventListener('click', function() {
        getSettingsFromUI();
        
        // Update preview
        updatePreview();
        
        // Generate theme data
        const themeData = generateThemeData(themeSettings);
        
        // Send to host application
        sendMessageToHost('saveTheme', themeData);
    });
    
    // Reset theme button
    document.getElementById('resetTheme').addEventListener('click', function() {
        // Reset to default settings
        themeSettings = {...defaultThemeSettings};
        
        // Update UI
        document.getElementById('primaryColor').value = themeSettings.primaryColor;
        document.getElementById('secondaryColor').value = themeSettings.secondaryColor;
        document.getElementById('accentColor').value = themeSettings.accentColor;
        document.getElementById('backgroundColor').value = themeSettings.backgroundColor;
        document.getElementById('textColor').value = themeSettings.textColor;
        document.getElementById('animation').checked = themeSettings.animation;
        
        // Update preview
        updatePreview();
    });
    
    // Update color samples when changing colors
    document.getElementById('primaryColor').addEventListener('input', function() {
        document.querySelector('.color-sample.primary').style.backgroundColor = this.value;
    });
    
    document.getElementById('secondaryColor').addEventListener('input', function() {
        document.querySelector('.color-sample.secondary').style.backgroundColor = this.value;
    });
    
    document.getElementById('accentColor').addEventListener('input', function() {
        document.querySelector('.color-sample.accent').style.backgroundColor = this.value;
    });
    
    document.getElementById('backgroundColor').addEventListener('input', function() {
        document.querySelector('.color-sample.background').style.backgroundColor = this.value;
    });
    
    // Get settings from UI controls
    function getSettingsFromUI() {
        themeSettings.primaryColor = document.getElementById('primaryColor').value;
        themeSettings.secondaryColor = document.getElementById('secondaryColor').value;
        themeSettings.accentColor = document.getElementById('accentColor').value;
        themeSettings.backgroundColor = document.getElementById('backgroundColor').value;
        themeSettings.textColor = document.getElementById('textColor').value;
        themeSettings.animation = document.getElementById('animation').checked;
    }
    
    // Update the preview based on current settings
    function updatePreview() {
        // Update color samples
        document.querySelector('.color-sample.primary').style.backgroundColor = themeSettings.primaryColor;
        document.querySelector('.color-sample.secondary').style.backgroundColor = themeSettings.secondaryColor;
        document.querySelector('.color-sample.accent').style.backgroundColor = themeSettings.accentColor;
        document.querySelector('.color-sample.background').style.backgroundColor = themeSettings.backgroundColor;
        
        // Update preview card styles
        const previewCards = document.querySelectorAll('.preview-card');
        previewCards.forEach(card => {
            card.style.backgroundColor = themeSettings.primaryColor;
            card.style.borderColor = themeSettings.secondaryColor;
            card.style.color = themeSettings.textColor;
        });
        
        // Update preview button
        const previewButton = document.querySelector('.preview-button');
        previewButton.style.backgroundColor = themeSettings.secondaryColor;
        previewButton.style.color = themeSettings.textColor;
        
        // Update preview window
        document.querySelector('.preview-window').style.backgroundColor = themeSettings.backgroundColor;
        document.querySelector('.preview-window').style.borderColor = themeSettings.secondaryColor;
        
        // Update preview header
        document.querySelector('.preview-header').style.backgroundColor = themeSettings.primaryColor;
        document.querySelector('.preview-header').style.borderColor = themeSettings.secondaryColor;
        document.querySelector('.preview-header').style.color = themeSettings.textColor;
    }
    
    // Generate theme data based on settings
    function generateThemeData(settings) {
        return {
            name: "SpaceTheme",
            description: "A cosmic journey through the stars",
            author: "SaveVault",
            version: "1.0.0",
            colors: {
                "PrimaryColor": settings.primaryColor,
                "SecondaryColor": settings.secondaryColor,
                "BackgroundColor": settings.backgroundColor,
                "TextColor": settings.textColor,
                "AccentColor": settings.accentColor,
                "ButtonBackground": settings.secondaryColor,
                "ButtonForeground": settings.textColor,
                "CardBackground": settings.primaryColor,
                "CardBorder": settings.secondaryColor,
                "HeaderBackground": settings.backgroundColor,
                "FooterBackground": settings.backgroundColor,
                "BorderColor": settings.accentColor,
                "MenuBackground": settings.primaryColor,
                "MenuForeground": settings.textColor,
                "NotificationBackground": settings.primaryColor,
                "NotificationForeground": settings.textColor,
                "ErrorColor": "#ff6b6b",
                "WarningColor": "#ffd56b",
                "SuccessColor": "#67e480",
                "InfoColor": "#41a7ff"
            },
            fonts: {
                "DefaultFont": "Segoe UI",
                "HeadingFont": "Segoe UI Semibold",
                "MonospaceFont": "Consolas"
            },
            properties: {
                "shadowDepth": "high",
                "borderRadius": "medium",
                "animation": settings.animation ? "enabled" : "disabled",
                "transparency": "medium"
            }
        };
    }
    
    // Send message to the host application
    function sendMessageToHost(messageType, messageData) {
        // Check if we're in a WebView environment
        if (window.external && window.external.sendMessage) {
            window.external.sendMessage(messageType, JSON.stringify(messageData));
        } else {
            console.log('SendMessage:', messageType, messageData);
            
            // For testing in browser
            if (messageType === 'applyTheme') {
                showNotification('Theme Applied', 'The space theme has been applied successfully!');
            } else if (messageType === 'saveTheme') {
                showNotification('Theme Saved', 'The space theme has been saved as default!');
            }
        }
    }
    
    // Listen for messages from the host application
    window.receiveMessage = function(message) {
        try {
            const data = JSON.parse(message);
            
            if (data.type === 'init') {
                // Initialize with existing theme data
                if (data.themeData) {
                    updateUIFromThemeData(data.themeData);
                }
            } else if (data.type === 'themeApplied') {
                showNotification('Theme Applied', 'The space theme has been applied successfully!');
            } else if (data.type === 'themeSaved') {
                showNotification('Theme Saved', 'The space theme has been saved as default!');
            }
        } catch (e) {
            console.error('Error processing message:', e);
        }
    };
    
    // For browser testing and demonstration
    if (!window.external || !window.external.sendMessage) {
        // Create a notification element
        const notificationContainer = document.createElement('div');
        notificationContainer.id = 'notificationContainer';
        notificationContainer.style.cssText = 'position: fixed; top: 20px; right: 20px; z-index: 1000;';
        document.body.appendChild(notificationContainer);
    }
    
    function showNotification(title, message) {
        // For testing in browser
        if (!window.external || !window.external.sendMessage) {
            const notification = document.createElement('div');
            notification.style.cssText = `
                background-color: ${themeSettings.primaryColor};
                border: 1px solid ${themeSettings.accentColor};
                border-radius: 5px;
                color: ${themeSettings.textColor};
                padding: 15px;
                margin-bottom: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.5);
                opacity: 0;
                transition: opacity 0.3s ease;
                max-width: 300px;
            `;
            
            const titleElement = document.createElement('h3');
            titleElement.textContent = title;
            titleElement.style.margin = '0 0 5px 0';
            
            const messageElement = document.createElement('p');
            messageElement.textContent = message;
            messageElement.style.margin = '0';
            
            notification.appendChild(titleElement);
            notification.appendChild(messageElement);
            
            document.getElementById('notificationContainer').appendChild(notification);
            
            // Fade in
            setTimeout(() => {
                notification.style.opacity = '1';
            }, 10);
            
            // Remove after 3 seconds
            setTimeout(() => {
                notification.style.opacity = '0';
                setTimeout(() => {
                    notification.remove();
                }, 300);
            }, 3000);
        }
    }
    
    function updateUIFromThemeData(themeData) {
        // Update UI controls based on theme data
        if (themeData.colors) {
            document.getElementById('primaryColor').value = themeData.colors.PrimaryColor || defaultThemeSettings.primaryColor;
            document.getElementById('secondaryColor').value = themeData.colors.SecondaryColor || defaultThemeSettings.secondaryColor;
            document.getElementById('accentColor').value = themeData.colors.AccentColor || defaultThemeSettings.accentColor;
            document.getElementById('backgroundColor').value = themeData.colors.BackgroundColor || defaultThemeSettings.backgroundColor;
            document.getElementById('textColor').value = themeData.colors.TextColor || defaultThemeSettings.textColor;
        }
        
        if (themeData.properties) {
            document.getElementById('animation').checked = themeData.properties.animation === 'enabled';
        }
        
        // Update our settings object
        getSettingsFromUI();
        
        // Update preview
        updatePreview();
    }
});
