# Python'un resmi hafif sürümü olan python:3.8-slim imajını temel alır.
FROM python:3.8-slim

# Konteyner içinde '/app' dizinini oluşturur ve sonraki komutlar için çalışma dizini olarak belirler.
WORKDIR /app

# requirements.txt dosyasını konteyner içindeki çalışma dizinine kopyalar.
COPY requirements.txt .

# requirements.txt dosyasında listelenmiş Python paketlerini kurar.
RUN pip install --no-cache-dir -r requirements.txt

# Uygulamanın ana dosyası olan app.py'yi çalışma dizinine kopyalar.
COPY app.py .

# PyArmor aracını kullanarak app.py dosyasını obfuskasyon yapar, sonucu 'dist' dizinine yazar.
RUN pyarmor-7 obfuscate --output dist app.py

# Obfuskasyon sonrası orijinal app.py dosyasını siler.
RUN rm -rf app.py

# Konteyner başlatıldığında obfuskasyon yapılmış Python dosyasını çalıştırır.
CMD ["python", "dist/app.py"]

# Konteynerin 5000 numaralı portunu açar, bu port dış dünyadan gelen bağlantılara izin verir.
EXPOSE 5000
