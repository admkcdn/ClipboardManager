# 📋 ClipboardManager - macOS Clipboard Uygulaması

ClipboardManager, macOS için geliştirilmiş hafif ve kullanışlı bir pano (clipboard) yönetim uygulamasıdır.  
Menü çubuğunda çalışarak, kopyaladığınız metinleri saklar ve dilediğiniz zaman tekrar kullanmanıza olanak tanır.  

🚀 **Özellikler:**
- 📌 **Otomatik Panoyu Takip Etme**: Kopyalanan metinleri otomatik olarak kaydeder.
- 💾 **Kalıcı Kayıt**: Veriler macOS kapansa bile kaybolmaz (UserDefaults kullanılarak saklanır).
- 🎨 **Modern Arayüz**: Şık ve minimal tasarım.
- 🖱 **Sağ Tıklama Menüsü**:  
  - **Panoya Kopyala** (Kayıtlı metni tekrar panoya kopyalar)  
  - **Sil** (Seçilen metni listeden kaldırır)  
- 🍏 **Menü Çubuğu Entegrasyonu**:  
  - **Geçmişi Temizle**  
  - **Çıkış Yap**  
- 🔄 **macOS Açılışında Otomatik Çalıştırma** (İsteğe Bağlı)

---

## 🚀 Kurulum ve Kullanım

### **1️⃣ Xcode ile Çalıştırma**
1. **Projeyi klonla:**
   ```bash
   git clone https://github.com/admkcdn/ClipboardManager.git
   cd ClipboardManager
   ```
2. **Xcode ile aç:**  
   `ClipboardManager.xcodeproj` dosyasını aç.
3. **Çalıştır (Run - ⌘R)**

---

### **2️⃣ Xcode Olmadan Kullanma (macOS .app Çıktısı)**
1. **Uygulamayı Derle ve Export Et:**
   - Xcode'da **Product → Archive** yap.
   - "Distribute App" seçeneğini seç.
   - `.app` olarak kaydet ve **Uygulamalar Klasörüne** taşı.

2. **Kod İmzası ve Güvenlik Ayarları (Eğer macOS Engellerse)**
   ```bash
   sudo xattr -rd com.apple.quarantine /Applications/ClipboardManager.app
   sudo spctl --add /Applications/ClipboardManager.app
   ```

3. **Otomatik Başlatmayı Açmak İçin (İsteğe Bağlı)**
   ```bash
   mkdir -p ~/Library/LaunchAgents
   nano ~/Library/LaunchAgents/com.ademkocdogan.clipboardmanager.plist
   ```
   İçine şu kodu ekleyip **CTRL+X → Y → ENTER** ile kaydet:
   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
   <plist version="1.0">
     <dict>
       <key>Label</key>
       <string>com.ademkocdogan.clipboardmanager</string>
       <key>ProgramArguments</key>
       <array>
         <string>/Applications/ClipboardManager.app/Contents/MacOS/ClipboardManager</string>
       </array>
       <key>RunAtLoad</key>
       <true/>
     </dict>
   </plist>
   ```

   Ardından Terminal’de:
   ```bash
   launchctl load ~/Library/LaunchAgents/com.ademkocdogan.clipboardmanager.plist
   ```

✅ **Bitti!** Artık uygulaman **menü çubuğunda çalışıyor** ve **sistem başlangıcında otomatik açılıyor!** 🚀🔥

---

## 🤝 Katkıda Bulunma
Eğer uygulamaya yeni özellikler eklemek istersen:
1. **Fork et ve yeni branch aç:**
   ```bash
   git checkout -b yeni-ozellik
   ```
2. **Geliştirme yap, commit et ve pushla:**
   ```bash
   git commit -m "Yeni özellik eklendi"
   git push origin yeni-ozellik
   ```
3. **Pull Request (PR) aç ve katkıda bulun!** 🚀

---

## 📜 Lisans
Bu proje **MIT Lisansı** ile dağıtılmaktadır. Detaylar için [LICENSE](LICENSE) dosyasına bakabilirsiniz.

---

🎉 **ClipboardManager'ı kullandığınız için teşekkürler!**  
✨ **Geliştirmeye devam edelim!** 🚀  
📌 **GitHub Repo:** [https://github.com/admkcdn/ClipboardManager](https://github.com/admkcdn/ClipboardManager)
