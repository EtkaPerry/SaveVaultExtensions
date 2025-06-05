-- Spanish Language Pack for SaveVault
-- Paquete de idioma español

function onLoad()
    logInfo("=== SPANISH EXTENSION: onLoad() called ===")
    
    -- Set the extension language context
    setExtensionLanguage("es-ES")
    
    -- Register Spanish language
    logInfo("Attempting to register Spanish language...")
    local success = registerLanguage("es-ES", "Español")
    if success then
        logInfo("Soporte de idioma español registrado exitosamente")
    else
        logError("No se pudo registrar el soporte de idioma español")
        return
    end
    
    logInfo("Starting to add translations...")
    
    -- Add translations for extension use (Spanish)
    addTranslation("es-ES", "spanish_language_loaded", "Paquete de idioma español cargado exitosamente")
    addTranslation("es-ES", "language_changed_to_spanish", "Idioma cambiado a español")
    
    -- Add extension display names and descriptions for different languages
    addTranslation("en-US", "theme_name", "Spanish")
    addTranslation("en-US", "theme_description", "Spanish language pack for SaveVault")
    addTranslation("en-US", "language_pack_name", "Spanish Language Pack")
    
    addTranslation("es-ES", "theme_name", "Español")
    addTranslation("es-ES", "theme_description", "Paquete de idioma español para SaveVault")
    addTranslation("es-ES", "language_pack_name", "Paquete de Idioma Español")
    
    addTranslation("tr-TR", "theme_name", "İspanyolca")
    addTranslation("tr-TR", "theme_description", "SaveVault için İspanyolca dil paketi")
    addTranslation("tr-TR", "language_pack_name", "İspanyolca Dil Paketi")
    
    addTranslation("de-DE", "theme_name", "Spanisch")
    addTranslation("de-DE", "theme_description", "Spanisches Sprachpaket für SaveVault")
    addTranslation("de-DE", "language_pack_name", "Spanisches Sprachpaket")
    
    addTranslation("fr-FR", "theme_name", "Espagnol")
    addTranslation("fr-FR", "theme_description", "Pack de langue espagnole pour SaveVault")
    addTranslation("fr-FR", "language_pack_name", "Pack de Langue Espagnole")
    
    -- Example: Add translations using extension's default language (es-ES)
    addTranslationDefault("welcome_message", "¡Bienvenido!")
    addTranslationDefault("extension_loaded", "Extensión cargada exitosamente")
    addTranslationDefault("restart_required", "Reinicio requerido")
    addTranslationDefault("settings_saved", "Configuración guardada")
    
    -- Register UI text replacements for main application
    logInfo("Registering UI text replacements for Spanish...")
    
    -- Menu items from MainWindow
    replaceUIText("File", "Archivo")
    replaceUIText("Exit", "Salir")
    replaceUIText("Tools", "Herramientas")
    replaceUIText("Log Viewer", "Visor de Registro")
    replaceUIText("Manage extensions and plugins", "Gestionar extensiones y plugins")
    
    -- Menu items
    replaceUIText("A-Z", "A-Z")
    replaceUIText("Z-A", "Z-A")
    replaceUIText("Launch Game", "Iniciar Juego")
    replaceUIText("Launch from Steam", "Iniciar desde Steam")
    replaceUIText("Open in Store", "Abrir en Tienda")
    replaceUIText("Uninstall", "Desinstalar")    
    -- Tooltips
    replaceUIText("Backup and transfer game saves between devices", "Respaldar y transferir guardados de juegos entre dispositivos")
    replaceUIText("Manage extensions and plugins", "Gestionar extensiones y plugins")
    
    -- Main menu items
    replaceUIText("File", "Archivo")
    replaceUIText("Tools", "Herramientas")
    replaceUIText("Help", "Ayuda")
    replaceUIText("Extensions", "Extensiones")
    replaceUIText("Options", "Opciones")
    replaceUIText("Exit", "Salir")
    
    -- Window titles
    replaceUIText("Extension Manager", "Gestor de Extensiones")
    
    -- Options window - sidebar items
    replaceUIText("General", "General")
    replaceUIText("Appearance", "Apariencia")
    replaceUIText("Storage", "Almacenamiento")
    replaceUIText("Updates", "Actualizaciones")
    replaceUIText("Legal", "Legal")
    replaceUIText("Credit", "Créditos")
    
    -- Options window - panel headers
    replaceUIText("General Settings", "Configuración General")
    replaceUIText("Storage Settings", "Configuración de Almacenamiento")
    replaceUIText("Update Settings", "Configuración de Actualizaciones")
    replaceUIText("Legal Documents", "Documentos Legales")
    replaceUIText("Credits", "Créditos")
    
    -- Options window - general settings
    replaceUIText("Auto-save every:", "Guardado automático cada:")
    replaceUIText("minutes", "minutos")
    replaceUIText("Max auto-saves:", "Máximo guardados automáticos:")
    replaceUIText("Max start-saves:", "Máximo guardados de inicio:")
    replaceUIText("backups", "respaldos")
    replaceUIText("Auto-save enabled:", "Guardado automático habilitado:")
    replaceUIText("Save on start:", "Guardar al iniciar:")
    replaceUIText("Change Detection:", "Detección de Cambios:")
    replaceUIText("Only backup when files change", "Solo respaldar cuando los archivos cambien")
    replaceUIText("Changes are saved automatically", "Los cambios se guardan automáticamente")
    
    -- Options window - appearance
    replaceUIText("Language", "Idioma")
    replaceUIText("Theme", "Tema")
    replaceUIText("Language:", "Idioma:")
    replaceUIText("Theme:", "Tema:")
    replaceUIText("Extensions can provide additional language translations", "Las extensiones pueden proporcionar traducciones de idiomas adicionales")
    
    -- Options window - storage
    replaceUIText("Backup storage location:", "Ubicación de almacenamiento de respaldo:")
    replaceUIText("Choose where game saves will be backed up to", "Elegir dónde se respaldarán los guardados de juegos")
    replaceUIText("Browse...", "Examinar...")
    replaceUIText("Storage Usage:", "Uso de Almacenamiento:")
    replaceUIText("View how much storage space each program is using", "Ver cuánto espacio de almacenamiento está usando cada programa")
    replaceUIText("Calculate Storage Usage", "Calcular Uso de Almacenamiento")
    replaceUIText("Calculating storage usage...", "Calculando uso de almacenamiento...")
    replaceUIText("Program", "Programa")
    replaceUIText("Used Storage", "Almacenamiento Usado")
    replaceUIText("Application Management:", "Gestión de Aplicaciones:")
    replaceUIText("Reset the application cache to force a new scan for all applications.", "Restablecer la caché de la aplicación para forzar un nuevo escaneo de todas las aplicaciones.")
    replaceUIText("Reset Program Cache", "Restablecer Caché del Programa")
    replaceUIText("Reset all settings and restart the application. This will clear all preferences.", "Restablecer todas las configuraciones y reiniciar la aplicación. Esto borrará todas las preferencias.")
    replaceUIText("Reset All Settings", "Restablecer Todas las Configuraciones")
    
    -- Options window - updates
    replaceUIText("Automatically check for updates", "Buscar actualizaciones automáticamente")
    replaceUIText("Check for updates every:", "Buscar actualizaciones cada:")
    replaceUIText("hours", "horas")
    replaceUIText("Current Version", "Versión Actual")
    replaceUIText("Latest Version", "Última Versión")
    replaceUIText("Last Checked", "Última Verificación")
    replaceUIText("Check for Updates", "Buscar Actualizaciones")
    replaceUIText("Install Update", "Instalar Actualización")
    replaceUIText("What's New", "Qué hay de Nuevo")
    replaceUIText("Release Notes", "Notas de la Versión")
    replaceUIText("Release Date:", "Fecha de Lanzamiento:")
    
    -- Options window - legal
    replaceUIText("Terms of Service", "Términos de Servicio")
    replaceUIText("Security Policy", "Política de Seguridad")
    replaceUIText("Privacy Policy", "Política de Privacidad")
    replaceUIText("You accepted these at", "Aceptaste estos el")
    
    -- Extension window
    replaceUIText("Extension Manager", "Gestor de Extensiones")
    replaceUIText("Discover and manage extensions for SaveVault", "Descubrir y gestionar extensiones para SaveVault")
    replaceUIText("Import", "Importar")
    replaceUIText("Refresh", "Actualizar")
    replaceUIText("Search", "Buscar")
    replaceUIText("Search extensions...", "Buscar extensiones...")
    replaceUIText("Categories", "Categorías")
    replaceUIText("Filters", "Filtros")
    replaceUIText("Show Installed Only", "Mostrar Solo Instaladas")
    replaceUIText("INSTALLED", "INSTALADA")
    replaceUIText("ENABLED", "HABILITADA")
    
    -- Extension actions
    replaceUIText("Install", "Instalar")
    replaceUIText("Uninstall", "Desinstalar")
    replaceUIText("Enable", "Habilitar")
    replaceUIText("Disable", "Deshabilitar")
    replaceUIText("Author", "Autor")
    replaceUIText("Version", "Versión")
    replaceUIText("Description", "Descripción")
    replaceUIText("Category", "Categoría")
    
    -- Dialog titles and messages
    replaceUIText("Import Extension", "Importar Extensión")
    replaceUIText("Confirm Reset Program Cache", "Confirmar Restablecer Caché del Programa")
    replaceUIText("Confirm Reset All Settings", "Confirmar Restablecer Todas las Configuraciones")
    replaceUIText("Error Opening URL", "Error Abriendo URL")
    replaceUIText("Save Log File", "Guardar Archivo de Registro")
    replaceUIText("Export Game Saves", "Exportar Guardados de Juegos")
    replaceUIText("Import Game Saves", "Importar Guardados de Juegos")
    replaceUIText("Select Backup Storage Location", "Seleccionar Ubicación de Almacenamiento de Respaldo")
    replaceUIText("Select Save Location", "Seleccionar Ubicación de Guardado")
    replaceUIText("Select Application Location Folder", "Seleccionar Carpeta de Ubicación de Aplicación")
    replaceUIText("Select Application Executable", "Seleccionar Ejecutable de Aplicación")
    replaceUIText("Select Save Location Folder", "Seleccionar Carpeta de Ubicación de Guardado")
    replaceUIText("Save Vault Already Running", "Save Vault Ya Está Ejecutándose")
    replaceUIText("Extensions Modified - Restart Required", "Extensiones Modificadas - Reinicio Requerido")
    
    -- Common buttons
    replaceUIText("OK", "Aceptar")
    replaceUIText("Cancel", "Cancelar")
    replaceUIText("Close", "Cerrar")
    replaceUIText("Save", "Guardar")
    replaceUIText("Yes", "Sí")
    replaceUIText("No", "No")
    replaceUIText("Browse...", "Examinar...")
    replaceUIText("Restart", "Reiniciar")
    replaceUIText("Not Now", "Ahora No")
    replaceUIText("Terminate existing and start new", "Terminar existente e iniciar nuevo")
    replaceUIText("Close this instance", "Cerrar esta instancia")
    replaceUIText("Restart application", "Reiniciar aplicación")
    
    -- Main window elements
    replaceUIText("Save Vault", "Save Vault")
    replaceUIText("Offline", "Sin conexión")
    replaceUIText("Online", "En línea")
    replaceUIText("Running:", "Ejecutándose:")
    replaceUIText("Check for update", "Buscar actualización")
    replaceUIText("Download the Update", "Descargar la Actualización")
    replaceUIText("Notifications", "Notificaciones")
    replaceUIText(" (new)", " (nuevo)")
    replaceUIText("Settings", "Configuración")
    replaceUIText("Home", "Inicio")
    replaceUIText("Installed Applications", "Aplicaciones Instaladas")
    replaceUIText("HIDDEN GAMES", "JUEGOS OCULTOS")
    replaceUIText("Launch", "Iniciar")
    replaceUIText("Hide", "Ocultar")
    replaceUIText("Show", "Mostrar")
    replaceUIText("Login", "Iniciar Sesión")
    replaceUIText("Select an application from the list", "Seleccionar una aplicación de la lista")
    replaceUIText("Save Carrier", "Portador de Guardado")
    replaceUIText("Backup and transfer game saves between devices", "Respaldar y transferir guardados de juegos entre dispositivos")
    replaceUIText("Select games to include", "Seleccionar juegos a incluir")
    
    -- Main window elements visible in screenshot
    replaceUIText("Save Now", "Guardar Ahora")
    replaceUIText("Save Backups", "Respaldos de Guardado")
    replaceUIText("Save Type", "Tipo de Guardado")
    replaceUIText("Time Passed", "Tiempo Transcurrido")
    replaceUIText("Actions", "Acciones")
    replaceUIText("Application Details", "Detalles de Aplicación")
    replaceUIText("Executable Path:", "Ruta del Ejecutable:")
    replaceUIText("Installation Path:", "Ruta de Instalación:")
    replaceUIText("Save Path:", "Ruta de Guardado:")
    replaceUIText("Use Custom Settings", "Usar Configuración Personalizada")
    replaceUIText("Using global application settings", "Usando configuración global de aplicación")
    replaceUIText("Off", "Desactivado")
    replaceUIText("On", "Activado")
    
    -- Application list sorting
    replaceUIText("Last Used", "Usado Recientemente")
    replaceUIText("Alphabetical", "Alfabético")
    replaceUIText("Most Saves", "Más Guardados")
    
    -- Save Carrier window
    replaceUIText("Compression Options", "Opciones de Compresión")
    replaceUIText("Compression Level", "Nivel de Compresión")
    replaceUIText("None - No compression, fastest packing/unpacking but largest file size.", "Ninguna - Sin compresión, empaquetado/desempaquetado más rápido pero mayor tamaño de archivo.")
    replaceUIText("Standard - Balanced compression with good file size reduction and reasonable speed.", "Estándar - Compresión equilibrada con buena reducción de tamaño de archivo y velocidad razonable.")
    replaceUIText("Maximum - Best compression with smallest file size, but slower packing/unpacking.", "Máxima - Mejor compresión con menor tamaño de archivo, pero empaquetado/desempaquetado más lento.")
    replaceUIText("Ready to export or import game save data", "Listo para exportar o importar datos de guardado de juegos")
    
    -- Terms window
    replaceUIText("Terms and Conditions", "Términos y Condiciones")
    replaceUIText("Welcome to Save Vault! Before you continue, please read and accept our terms and conditions.", "¡Bienvenido a Save Vault! Antes de continuar, por favor lee y acepta nuestros términos y condiciones.")
    replaceUIText("I have read and accept the Privacy Policy", "He leído y acepto la Política de Privacidad")
    replaceUIText("I have read and accept the Terms of Service", "He leído y acepto los Términos de Servicio")
    replaceUIText("I have read and accept the Security Policy", "He leído y acepto la Política de Seguridad")
    
    -- Status messages
    replaceUIText("Ready", "Listo")
    replaceUIText("Settings reset. Closing application...", "Configuración restablecida. Cerrando aplicación...")
    replaceUIText("Error resetting settings:", "Error restableciendo configuración:")
    replaceUIText("Selected all games", "Todos los juegos seleccionados")
    replaceUIText("Deselected all games", "Todos los juegos deseleccionados")
    replaceUIText("Inverted game selection", "Selección de juegos invertida")
    replaceUIText("Selected only games from KnownGames database", "Solo juegos seleccionados de la base de datos KnownGames")
    replaceUIText("Preparing to export saves...", "Preparando para exportar guardados...")
    replaceUIText("No games selected for export", "No hay juegos seleccionados para exportar")
    replaceUIText("Cannot export games without save locations:", "No se pueden exportar juegos sin ubicaciones de guardado:")
    replaceUIText("Error: Cannot access application window", "Error: No se puede acceder a la ventana de aplicación")
    replaceUIText("Export cancelled", "Exportación cancelada")
    replaceUIText("Error: Could not get local file path", "Error: No se pudo obtener la ruta del archivo local")
    replaceUIText("Exporting", "Exportando")
    replaceUIText("games with", "juegos con")
    replaceUIText("compression...", "compresión...")
    replaceUIText("Export completed successfully! File size:", "¡Exportación completada exitosamente! Tamaño del archivo:")
    replaceUIText("Error exporting saves", "Error exportando guardados")
    replaceUIText("Error:", "Error:")
    replaceUIText("Preparing to import saves...", "Preparando para importar guardados...")
    replaceUIText("Import cancelled", "Importación cancelada")
    replaceUIText("Importing saves...", "Importando guardados...")
    replaceUIText("Import completed successfully!", "¡Importación completada exitosamente!")
    replaceUIText("games restored.", "juegos restaurados.")
    replaceUIText("No games were imported", "No se importaron juegos")
    
    -- Policy viewer
    replaceUIText("A-", "A-")
    replaceUIText("A+", "A+")
    replaceUIText("A", "A")
    
    logInfo("UI text replacements registered")
    
    -- Subscribe to language change events
    subscribeToEvent("app.language.changed", "onLanguageChanged")
    
    logInfo("=== SPANISH EXTENSION: onLoad() completed successfully ===")
    
    -- Example of using translations
    local themeName = getTranslation("theme_name", "Spanish")
    local themeDesc = getTranslation("theme_description", "Spanish language pack for SaveVault")
    
    logInfo("Paquete de idioma español cargado exitosamente. Idioma actual: " .. getCurrentLanguage())
    logInfo("Theme name in current language: " .. themeName)
    logInfo("Theme description: " .. themeDesc)
end

function onUnload()
    -- Clean up registered language and UI text replacements for Spanish
    clearUITextReplacements("es-ES")
    unregisterLanguage("es-ES")
    
    logInfo("Paquete de idioma español descargado y textos de UI limpiados")
end

function onLanguageChanged(eventName, newLanguage)
    logInfo("=== SPANISH EXTENSION: onLanguageChanged() called ===")
    logInfo("Event: " .. eventName .. ", New Language: " .. newLanguage)
    
    if newLanguage == "es-ES" then
        logInfo("Idioma cambiado a español: " .. newLanguage)
        logInfo("Spanish language activated - all UI text replacements should now be applied")
    else
        logInfo("Idioma cambiado: " .. newLanguage)
        logInfo("Language changed away from Spanish")
    end
end
