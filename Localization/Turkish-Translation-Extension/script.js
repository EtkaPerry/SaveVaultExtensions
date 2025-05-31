// Turkish Translation Extension Script
document.addEventListener('DOMContentLoaded', async function() {
    // References to UI elements
    const applyButton = document.getElementById('applyButton');
    const themeButton = document.getElementById('themeButton');
    const output = document.getElementById('output');
    const translationSamples = document.getElementById('translationSamples');
    
    // Theme state (saved in localStorage)
    const currentTheme = localStorage.getItem('turkishExtensionTheme') || 'dark';
    if (currentTheme === 'light') {
        document.body.classList.add('light-theme');
        themeButton.textContent = 'Karanlık Temaya Geç';
    } else {
        themeButton.textContent = 'Açık Temaya Geç';
    }
    
    // Load and display translation samples
    try {
        const response = await fetch('translations.json');
        const translations = await response.json();
        
        // Display some sample translations
        Object.entries(translations).slice(0, 10).forEach(([key, value]) => {
            const row = document.createElement('tr');
            const engCell = document.createElement('td');
            const trCell = document.createElement('td');
            
            engCell.textContent = key;
            trCell.textContent = value;
            
            row.appendChild(engCell);
            row.appendChild(trCell);
            translationSamples.appendChild(row);
        });
    } catch (error) {
        console.error('Error loading translations:', error);
        output.textContent = 'Çeviri dosyası yüklenemedi: ' + error.message;
        output.style.color = '#ff5252';
    }
    
    // Apply translation button handler
    applyButton.addEventListener('click', function() {
        // Simulate applying translations
        const timestamp = new Date().toLocaleTimeString('tr-TR');
        output.innerHTML = `✅ Çeviri başarıyla uygulandı! <br>Son uygulama: ${timestamp}`;
        output.style.color = '#4CAF50';
        
        // Simulate saving to local storage
        localStorage.setItem('turkishTranslationApplied', 'true');
        localStorage.setItem('turkishTranslationTimestamp', timestamp);
        
        // Animation feedback
        applyButton.style.transform = 'scale(0.95)';
        setTimeout(() => {
            applyButton.style.transform = 'scale(1)';
        }, 200);
    });
    
    // Theme toggle button handler
    themeButton.addEventListener('click', function() {
        if (document.body.classList.contains('light-theme')) {
            document.body.classList.remove('light-theme');
            themeButton.textContent = 'Açık Temaya Geç';
            localStorage.setItem('turkishExtensionTheme', 'dark');
        } else {
            document.body.classList.add('light-theme');
            themeButton.textContent = 'Karanlık Temaya Geç';
            localStorage.setItem('turkishExtensionTheme', 'light');
        }
    });
    
    // Check if translations were previously applied
    const wasApplied = localStorage.getItem('turkishTranslationApplied');
    const timestamp = localStorage.getItem('turkishTranslationTimestamp');
    
    if (wasApplied === 'true' && timestamp) {
        output.innerHTML = `✅ Çeviri daha önce uygulandı! <br>Son uygulama: ${timestamp}`;
        output.style.color = '#4CAF50';
    }
    
    // Simulated API connection
    console.log('Turkish Translation Extension loaded - API connection simulated');
    
    // Extension information
    console.info({
        name: 'Turkish Language Pack',
        version: '1.0.0',
        author: 'GitHub Copilot',
        category: 'Localization'
    });
});
