using System;
using System.Collections.Generic;
using System.IO;
using System.Text.Json;
using System.Threading.Tasks;
using SaveVaultApp.Extensions;
using SaveVaultApp.Models;

namespace SpaceThemeExtension
{
    /// <summary>
    /// Space Theme Extension for SaveVault
    /// </summary>
    public class SpaceThemeExtension : IExtension, IThemeExtension
    {
        public string Id => "com.savevault.spacetheme";
        public string Name => "Space Theme";
        public string Version => "1.0.0";
        public string Author => "SaveVault";
        public string Description => "A beautiful space-themed skin for SaveVault";
        public string ExtensionId => Id;
        
        public IExtensionHost Host { get; set; }
        
        private ThemeData _spaceTheme;
        private readonly string _themeName = "SpaceTheme";
        
        /// <summary>
        /// Initialize the extension
        /// </summary>
        public async Task InitializeAsync()
        {
            // Load theme from json file
            var themePath = Path.Combine(GetExtensionPath(), "themes", "space-theme.json");
            
            try
            {
                if (File.Exists(themePath))
                {
                    var json = await File.ReadAllTextAsync(themePath);
                    _spaceTheme = JsonSerializer.Deserialize<ThemeData>(json);
                    
                    Host.LogMessage(Id, $"Space theme loaded from {themePath}", LogLevel.Info);
                }
                else
                {
                    // Create default theme if file doesn't exist
                    _spaceTheme = CreateDefaultTheme();
                    Host.LogMessage(Id, "Created default space theme", LogLevel.Info);
                    
                    // Save it for future use
                    await SaveThemeToFileAsync(_spaceTheme);
                }
            }
            catch (Exception ex)
            {
                Host.LogMessage(Id, $"Error loading space theme: {ex.Message}", LogLevel.Error);
                _spaceTheme = CreateDefaultTheme();
            }
            
            Host.LogMessage(Id, "Space Theme extension initialized successfully", LogLevel.Info);
        }
        
        /// <summary>
        /// Called when the extension is being shut down
        /// </summary>
        public async Task ShutdownAsync()
        {
            // Save the current theme state
            await SaveThemeToFileAsync(_spaceTheme);
            Host.LogMessage(Id, "Space Theme extension shut down", LogLevel.Info);
        }
        
        /// <summary>
        /// Called when the extension is enabled
        /// </summary>
        public async Task OnEnabledAsync()
        {
            // Register our space theme
            Host.ThemeManager.RegisterTheme(_themeName, _spaceTheme);
            Host.LogMessage(Id, $"Registered space theme: {_themeName}", LogLevel.Info);
            Host.ShowNotification("Space Theme", "Space Theme extension has been enabled", NotificationType.Success);
        }
        
        /// <summary>
        /// Called when the extension is disabled
        /// </summary>
        public async Task OnDisabledAsync()
        {
            // If our theme is active, switch to a default theme
            if (Host.ThemeManager.CurrentTheme == _themeName)
            {
                Host.ThemeManager.SetTheme("Light"); // Switch to a default theme
                Host.LogMessage(Id, "Switched to Light theme as Space Theme was disabled", LogLevel.Info);
            }
            
            Host.ShowNotification("Space Theme", "Space Theme extension has been disabled", NotificationType.Info);
        }
        
        /// <summary>
        /// Get configuration UI for this extension
        /// </summary>
        public async Task<string?> GetConfigurationUIAsync()
        {
            // Return path to our HTML UI
            return "index.html";
        }
        
        /// <summary>
        /// Get permissions required by this extension
        /// </summary>
        public IEnumerable<ExtensionPermission> GetRequiredPermissions()
        {
            yield return new ExtensionPermission
            {
                Name = "theme.modify",
                Description = "Allows modification of application themes",
                Level = PermissionLevel.Medium,
                IsRequired = true
            };
        }
        
        /// <summary>
        /// Get custom themes provided by this extension
        /// </summary>
        public async Task<Dictionary<string, ThemeData>> GetCustomThemesAsync()
        {
            // Return our space theme
            return new Dictionary<string, ThemeData>
            {
                { _themeName, _spaceTheme }
            };
        }
        
        /// <summary>
        /// Modify an existing theme
        /// </summary>
        public async Task<ThemeData> ModifyThemeAsync(string themeName, ThemeData originalTheme)
        {
            // We're not modifying existing themes in this example
            return originalTheme;
        }
        
        /// <summary>
        /// Called when the theme changes
        /// </summary>
        public async Task OnThemeChangedAsync(string newTheme)
        {
            // Called when the active theme changes
            Host.LogMessage(Id, $"Theme changed to: {newTheme}", LogLevel.Info);
            
            // If it's our theme, we could do special handling here
            if (newTheme == _themeName)
            {
                Host.LogMessage(Id, "Space Theme is now active!", LogLevel.Info);
            }
        }
        
        /// <summary>
        /// Process messages from the JavaScript UI
        /// </summary>
        public void ProcessMessage(string messageType, string messageData)
        {
            try
            {
                if (messageType == "applyTheme")
                {
                    var themeData = JsonSerializer.Deserialize<ThemeData>(messageData);
                    if (themeData != null)
                    {
                        _spaceTheme = themeData;
                        Host.ThemeManager.RegisterTheme(_themeName, _spaceTheme);
                        Host.ThemeManager.SetTheme(_themeName);
                        
                        Host.LogMessage(Id, "Applied Space Theme from UI", LogLevel.Info);
                        Host.ShowNotification("Space Theme", "Space Theme has been applied", NotificationType.Success);
                        
                        // Send response back to JavaScript
                        SendMessageToUI("themeApplied", "{}");
                    }
                }
                else if (messageType == "saveTheme")
                {
                    var themeData = JsonSerializer.Deserialize<ThemeData>(messageData);
                    if (themeData != null)
                    {
                        _spaceTheme = themeData;
                        Host.ThemeManager.RegisterTheme(_themeName, _spaceTheme);
                        Host.ThemeManager.SetTheme(_themeName);
                        
                        // Save to file
                        SaveThemeToFileAsync(_spaceTheme).ConfigureAwait(false);
                        
                        Host.LogMessage(Id, "Saved Space Theme as default", LogLevel.Info);
                        Host.ShowNotification("Space Theme", "Space Theme has been saved as default", NotificationType.Success);
                        
                        // Send response back to JavaScript
                        SendMessageToUI("themeSaved", "{}");
                    }
                }
            }
            catch (Exception ex)
            {
                Host.LogMessage(Id, $"Error processing message: {ex.Message}", LogLevel.Error);
                Host.ShowNotification("Space Theme", $"Error applying theme: {ex.Message}", NotificationType.Error);
            }
        }
        
        /// <summary>
        /// Save theme data to file
        /// </summary>
        private async Task SaveThemeToFileAsync(ThemeData themeData)
        {
            try
            {
                var themePath = Path.Combine(GetExtensionPath(), "themes", "space-theme.json");
                var json = JsonSerializer.Serialize(themeData, new JsonSerializerOptions { WriteIndented = true });
                await File.WriteAllTextAsync(themePath, json);
                Host.LogMessage(Id, $"Saved theme data to {themePath}", LogLevel.Info);
            }
            catch (Exception ex)
            {
                Host.LogMessage(Id, $"Error saving theme data: {ex.Message}", LogLevel.Error);
            }
        }
        
        /// <summary>
        /// Send message to the UI
        /// </summary>
        private void SendMessageToUI(string messageType, string messageData)
        {
            try
            {
                var message = new { type = messageType, data = messageData };
                var json = JsonSerializer.Serialize(message);
                
                // The actual mechanism to send messages back to the UI depends on how 
                // the WebView is implemented in the host application
                // This would be replaced with the actual implementation
                if (Host.ApplicationManager != null)
                {
                    // For example, if there's a SendMessageToExtensionUI method:
                    // Host.ApplicationManager.SendMessageToExtensionUI(Id, json);
                    Host.LogMessage(Id, $"Sent message to UI: {messageType}", LogLevel.Debug);
                }
            }
            catch (Exception ex)
            {
                Host.LogMessage(Id, $"Error sending message to UI: {ex.Message}", LogLevel.Error);
            }
        }
        
        /// <summary>
        /// Get the extension directory path
        /// </summary>
        private string GetExtensionPath()
        {
            // This would normally use the host's method to get the extension path
            // For example: return Host.ApplicationManager.GetExtensionPath(Id);
            
            // As a fallback, we'll use a method that works during development
            var appDataPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "SaveVault");
            return Path.Combine(appDataPath, "Extensions", Id);
        }
        
        /// <summary>
        /// Create the default space theme
        /// </summary>
        private ThemeData CreateDefaultTheme()
        {
            return new ThemeData
            {
                Name = _themeName,
                Description = "A cosmic journey through the stars",
                Author = "SaveVault",
                Version = "1.0.0",
                Colors = new Dictionary<string, string>
                {
                    { "PrimaryColor", "#1a1a2e" },
                    { "SecondaryColor", "#4b0082" },
                    { "BackgroundColor", "#0a0a1a" },
                    { "TextColor", "#e6e6fa" },
                    { "AccentColor", "#9370db" },
                    { "ButtonBackground", "#4b0082" },
                    { "ButtonForeground", "#ffffff" },
                    { "CardBackground", "#16213e" },
                    { "CardBorder", "#4b0082" },
                    { "HeaderBackground", "#0a0a1a" },
                    { "FooterBackground", "#0a0a1a" },
                    { "BorderColor", "#9370db" },
                    { "MenuBackground", "#16213e" },
                    { "MenuForeground", "#e6e6fa" },
                    { "NotificationBackground", "#16213e" },
                    { "NotificationForeground", "#e6e6fa" },
                    { "ErrorColor", "#ff6b6b" },
                    { "WarningColor", "#ffd56b" },
                    { "SuccessColor", "#67e480" },
                    { "InfoColor", "#41a7ff" }
                },
                Fonts = new Dictionary<string, string>
                {
                    { "DefaultFont", "Segoe UI" },
                    { "HeadingFont", "Segoe UI Semibold" },
                    { "MonospaceFont", "Consolas" }
                },
                Properties = new Dictionary<string, object>
                {
                    { "shadowDepth", "high" },
                    { "borderRadius", "medium" },
                    { "animation", "enabled" },
                    { "transparency", "medium" }
                }
            };
        }
    }
}
