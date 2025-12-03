<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sanremo Digital Systems - Login</title>
    <style>
        :root {
            --primary: #2c3e50;
            --secondary: #3498db;
            --accent: #e74c3c;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .login-container {
            width: 100%;
            max-width: 450px;
        }
        
        .login-box {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
        }
        
        .login-header {
            background: var(--primary);
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .logo {
            font-size: 2.5rem;
            margin-bottom: 10px;
        }
        
        .login-header h1 {
            font-size: 1.8rem;
            margin-bottom: 5px;
        }
        
        .login-header p {
            opacity: 0.9;
            font-size: 0.9rem;
        }
        
        .login-body {
            padding: 30px;
        }
        
        .step {
            display: none;
        }
        
        .step.active {
            display: block;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 600;
            font-size: 0.9rem;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--secondary);
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        }
        
        .btn {
            width: 100%;
            padding: 14px;
            background: var(--secondary);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
        }
        
        .btn:hover {
            background: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
        }
        
        .btn-secondary {
            background: white;
            color: var(--secondary);
            border: 2px solid var(--secondary);
        }
        
        .btn-secondary:hover {
            background: var(--secondary);
            color: white;
        }
        
        .error-message {
            background: #ffeaea;
            color: #c0392b;
            padding: 12px;
            border-radius: 8px;
            margin-top: 15px;
            text-align: center;
            display: none;
            border-left: 4px solid #c0392b;
        }
        
        .success-message {
            background: #e8f6ef;
            color: #27ae60;
            padding: 12px;
            border-radius: 8px;
            margin-top: 15px;
            text-align: center;
            display: none;
            border-left: 4px solid #27ae60;
        }
        
        .license-display {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 15px;
            margin: 20px 0;
            text-align: center;
            font-family: monospace;
            font-size: 1.2rem;
            font-weight: bold;
            color: var(--primary);
            border: 2px dashed #ddd;
        }
        
        .step-indicator {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 30px;
        }
        
        .step-dot {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: #ddd;
            transition: all 0.3s;
        }
        
        .step-dot.active {
            background: var(--secondary);
            transform: scale(1.2);
        }
        
        .legal-notice {
            background: #fff3cd;
            border: 1px solid #ffc107;
            border-radius: 8px;
            padding: 15px;
            margin-top: 20px;
            font-size: 0.85rem;
            color: #856404;
        }
        
        .support-link {
            text-align: center;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }
        
        .support-link a {
            color: var(--secondary);
            text-decoration: none;
        }
        
        @media (max-width: 480px) {
            .login-body {
                padding: 20px;
            }
            
            .login-header {
                padding: 20px;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <div class="login-header">
                <div class="logo">
                    <i class="fas fa-store-alt"></i>
                </div>
                <h1>Sanremo Digital Systems</h1>
                <p>Professionelles QR-Bestellsystem</p>
            </div>
            
            <div class="login-body">
                <!-- Step Indicator -->
                <div class="step-indicator">
                    <div class="step-dot active" id="step1Dot"></div>
                    <div class="step-dot" id="step2Dot"></div>
                    <div class="step-dot" id="step3Dot"></div>
                </div>
                
                <!-- Step 1: License Verification -->
                <div id="step1" class="step active">
                    <h2 style="margin-bottom: 20px; color: var(--primary);">Lizenzverifizierung</h2>
                    <p style="color: #666; margin-bottom: 20px;">Geben Sie Ihren Lizenzschlüssel ein, den Sie per Email erhalten haben.</p>
                    
                    <div class="form-group">
                        <label for="licenseKey"><i class="fas fa-key"></i> Lizenzschlüssel</label>
                        <input type="text" id="licenseKey" class="form-control" 
                               placeholder="SANREMO-XXXXXX-XXXX" 
                               style="text-transform: uppercase;">
                    </div>
                    
                    <button class="btn" onclick="verifyLicense()">
                        <i class="fas fa-check"></i> Lizenz überprüfen
                    </button>
                    
                    <div id="step1Error" class="error-message">
                        <i class="fas fa-exclamation-triangle"></i>
                        <span id="step1ErrorText"></span>
                    </div>
                    
                    <div class="support-link">
                        <p>Probleme mit Ihrer Lizenz? <a href="mailto:support@sanremodigital.com">Support kontaktieren</a></p>
                    </div>
                </div>
                
                <!-- Step 2: Account Creation -->
                <div id="step2" class="step">
                    <h2 style="margin-bottom: 20px; color: var(--primary);">Konto erstellen</h2>
                    <p style="color: #666; margin-bottom: 20px;">Ihre Lizenz wurde verifiziert. Erstellen Sie jetzt Ihr Konto.</p>
                    
                    <div class="license-display" id="verifiedLicense">
                        SANREMO-XXXXXX-XXXX
                    </div>
                    
                    <div class="form-group">
                        <label for="username"><i class="fas fa-user"></i> Benutzername</label>
                        <input type="text" id="username" class="form-control" 
                               placeholder="Wählen Sie einen Benutzernamen">
                    </div>
                    
                    <div class="form-group">
                        <label for="password"><i class="fas fa-lock"></i> Passwort</label>
                        <input type="password" id="password" class="form-control" 
                               placeholder="Mindestens 8 Zeichen">
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword"><i class="fas fa-lock"></i> Passwort bestätigen</label>
                        <input type="password" id="confirmPassword" class="form-control" 
                               placeholder="Passwort wiederholen">
                    </div>
                    
                    <button class="btn" onclick="createAccount()">
                        <i class="fas fa-user-plus"></i> Konto erstellen
                    </button>
                    
                    <button class="btn btn-secondary" onclick="goToStep(1)">
                        <i class="fas fa-arrow-left"></i> Zurück
                    </button>
                    
                    <div id="step2Error" class="error-message">
                        <i class="fas fa-exclamation-triangle"></i>
                        <span id="step2ErrorText"></span>
                    </div>
                </div>
                
                <!-- Step 3: Success -->
                <div id="step3" class="step">
                    <div style="text-align: center; padding: 20px 0;">
                        <div style="font-size: 4rem; color: #27ae60; margin-bottom: 20px;">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        
                        <h2 style="margin-bottom: 20px; color: var(--primary);">Erfolgreich!</h2>
                        
                        <p style="color: #666; margin-bottom: 30px;">
                            Ihr Konto wurde erfolgreich erstellt. Sie werden in Kürze zum System weitergeleitet.
                        </p>
                        
                        <div class="success-message" style="display: block;">
                            <i class="fas fa-info-circle"></i>
                            <span>Bitte speichern Sie Ihre Zugangsdaten sicher auf.</span>
                        </div>
                        
                        <div style="background: #f8f9fa; border-radius: 8px; padding: 15px; margin: 20px 0; text-align: left;">
                            <p><strong>Benutzername:</strong> <span id="finalUsername"></span></p>
                            <p><strong>Lizenz:</strong> <span id="finalLicense"></span></p>
                            <p><strong>Ablaufdatum:</strong> Lebenslang</p>
                        </div>
                        
                        <button class="btn" onclick="redirectToSystem()" id="redirectBtn" style="margin-top: 20px;">
                            <i class="fas fa-rocket"></i> Zum System
                        </button>
                        
                        <div class="legal-notice" style="margin-top: 30px;">
                            <p><strong>Wichtiger Hinweis:</strong> Dieses System ist ein internes Bestellverwaltungstool und ersetzt keine Registrierkasse. Sie sind für die steuerlich korrekte Verbuchung verantwortlich.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // ============ DATABASE SIMULATION ============
        // In a real application, this would be on a server
        const LICENSES_DATABASE = JSON.parse(localStorage.getItem('sanremo_database') || '{"licenses":[]}').licenses;
        
        let currentLicense = null;
        let currentStep = 1;
        
        // ============ STEP MANAGEMENT ============
        function goToStep(stepNumber) {
            // Hide all steps
            document.querySelectorAll('.step').forEach(step => {
                step.classList.remove('active');
            });
            
            // Update step dots
            document.querySelectorAll('.step-dot').forEach((dot, index) => {
                dot.classList.toggle('active', index < stepNumber);
            });
            
            // Show current step
            document.getElementById(`step${stepNumber}`).classList.add('active');
            currentStep = stepNumber;
            
            // Clear any error messages
            hideAllErrors();
        }
        
        function hideAllErrors() {
            document.querySelectorAll('.error-message').forEach(error => {
                error.style.display = 'none';
            });
        }
        
        function showError(step, message) {
            const errorDiv = document.getElementById(`step${step}Error`);
            const errorText = document.getElementById(`step${step}ErrorText`);
            
            errorText.textContent = message;
            errorDiv.style.display = 'block';
        }
        
        // ============ LICENSE VERIFICATION ============
        function verifyLicense() {
            const licenseKey = document.getElementById('licenseKey').value.trim().toUpperCase();
            
            if (!licenseKey) {
                showError(1, 'Bitte geben Sie einen Lizenzschlüssel ein.');
                return;
            }
            
            // Check license format
            if (!licenseKey.match(/^SANREMO-[A-Z0-9]{6}-[A-Z0-9]{4}$/)) {
                showError(1, 'Ungültiges Lizenzformat. Bitte verwenden Sie: SANREMO-XXXXXX-XXXX');
                return;
            }
            
            // Find license in database
            const license = LICENSES_DATABASE.find(l => l.key === licenseKey);
            
            if (!license) {
                showError(1, 'Lizenzschlüssel nicht gefunden. Bitte überprüfen Sie Ihre Eingabe.');
                return;
            }
            
            // Check if license is active
            if (license.status !== 'active') {
                showError(1, 'Diese Lizenz ist nicht aktiv.');
                return;
            }
            
            // Check if license is already used
            if (license.isUsed) {
                showError(1, 'Diese Lizenz wurde bereits aktiviert.');
                return;
            }
            
            // Check expiry date
            const today = new Date();
            const expiry = new Date(license.expiryDate);
            
            if (expiry < today) {
                showError(1, 'Diese Lizenz ist abgelaufen.');
                return;
            }
            
            // License is valid
            currentLicense = license;
            
            // Show license in step 2
            document.getElementById('verifiedLicense').textContent = licenseKey;
            
            // Go to step 2
            goToStep(2);
        }
        
        // ============ ACCOUNT CREATION ============
        function createAccount() {
            const username = document.getElementById('username').value.trim();
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            // Validation
            if (!username || !password || !confirmPassword) {
                showError(2, 'Bitte füllen Sie alle Felder aus.');
                return;
            }
            
            if (username.length < 3) {
                showError(2, 'Benutzername muss mindestens 3 Zeichen lang sein.');
                return;
            }
            
            if (password.length < 8) {
                showError(2, 'Passwort muss mindestens 8 Zeichen lang sein.');
                return;
            }
            
            if (password !== confirmPassword) {
                showError(2, 'Passwörter stimmen nicht überein.');
                return;
            }
            
            // Check if username already exists (in localStorage)
            const existingAccounts = JSON.parse(localStorage.getItem('sanremo_accounts') || '[]');
            if (existingAccounts.find(acc => acc.username === username)) {
                showError(2, 'Dieser Benutzername ist bereits vergeben.');
                return;
            }
            
            // Create account
            const account = {
                id: Date.now(),
                username: username,
                licenseKey: currentLicense.key,
                licenseType: currentLicense.plan,
                created: new Date().toISOString(),
                lastLogin: null
            };
            
            // Save account (in real app, this would be on server)
            existingAccounts.push(account);
            localStorage.setItem('sanremo_accounts', JSON.stringify(existingAccounts));
            
            // Mark license as used
            markLicenseAsUsed(currentLicense.key);
            
            // Save login session
            localStorage.setItem('sanremo_current_user', JSON.stringify({
                username: username,
                license: currentLicense.key,
                loginTime: new Date().toISOString()
            }));
            
            // Show success screen
            document.getElementById('finalUsername').textContent = username;
            document.getElementById('finalLicense').textContent = currentLicense.key;
            
            goToStep(3);
            
            // Auto-redirect after 5 seconds
            setTimeout(() => {
                redirectToSystem();
            }, 5000);
        }
        
        function markLicenseAsUsed(licenseKey) {
            // In a real application, this would update the server database
            // For now, we'll update the local copy
            const db = JSON.parse(localStorage.getItem('sanremo_database') || '{"licenses":[]}');
            const licenseIndex = db.licenses.findIndex(l => l.key === licenseKey);
            
            if (licenseIndex !== -1) {
                db.licenses[licenseIndex].isUsed = true;
                db.licenses[licenseIndex].lastUsed = new Date().toISOString();
                localStorage.setItem('sanremo_database', JSON.stringify(db));
            }
        }
        
        // ============ REDIRECT TO SYSTEM ============
        function redirectToSystem() {
            // Redirect to the actual system
            window.location.href = 'sistema-principal.html';
            
            // Or load system inline
            // loadSystem();
        }
        
        // ============ ENTER KEY SUPPORT ============
        document.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                if (currentStep === 1) {
                    verifyLicense();
                } else if (currentStep === 2) {
                    createAccount();
                } else if (currentStep === 3) {
                    redirectToSystem();
                }
            }
        });
        
        // ============ AUTO-FILL FOR TESTING ============
        // Remove this in production
        function autoFillTestLicense() {
            if (window.location.hash === '#test') {
                document.getElementById('licenseKey').value = 'SANREMO-ABC123-XYZ789';
            }
        }
        
        // Check if user is already logged in
        function checkExistingSession() {
            const currentUser = localStorage.getItem('sanremo_current_user');
            if (currentUser) {
                const userData = JSON.parse(currentUser);
                const loginTime = new Date(userData.loginTime);
                const now = new Date();
                const hoursSinceLogin = (now - loginTime) / (1000 * 60 * 60);
                
                // If logged in less than 24 hours ago, redirect
                if (hoursSinceLogin < 24) {
                    window.location.href = 'sistema-principal.html';
                } else {
                    // Session expired, clear it
                    localStorage.removeItem('sanremo_current_user');
                }
            }
        }
        
        // Initialize
        document.addEventListener('DOMContentLoaded', function() {
            checkExistingSession();
            autoFillTestLicense();
        });
    </script>
</body>
</html>
