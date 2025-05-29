using System;
using Avalonia.Controls;
using SaveVaultApp.Models;
using SaveVaultApp.Services;

namespace RepoTestExtension
{
    public class RepoTestExtension : ExtensionBase
    {
        public override Extension Metadata { get; }

        public RepoTestExtension()
        {
            Metadata = new Extension
            {
                Id = "repo-test-extension",
                Name = "Repository Test Extension",
                Version = "1.0.0",
                Description = "Test extension for verifying repository pulling functionality works correctly",
                Author = "Save Vault Team",
                Category = "Other",
                IsOfficial = true
            };
        }

        public override void Initialize()
        {
            LoggingService.Instance.Info("Repository Test Extension initialized");
        }

        public override void Shutdown()
        {
            LoggingService.Instance.Info("Repository Test Extension shutdown");
        }

        public override Control? GetUIControl()
        {
            var button = new Button
            {
                Content = "TEST Repo"
            };
            
            // Set tooltip using ToolTip.SetTip
            ToolTip.SetTip(button, "Test button to verify repository functionality");

            button.Click += (s, e) =>
            {
                NotificationService.Instance.AddLocalNotification("Repository pulling is working! This extension was loaded to test repo functionality.", "info");
                LoggingService.Instance.Info("Repository test extension button clicked - repo pulling works!");
            };

            return button;
        }
    }
}