# Projecte Docker Web

Aquest repositori conté una configuració bàsica de **Docker Compose** per a desplegar un servei web amb **Apache/PHP** (o qualsevol altre servidor web que especifiques en el teu `Dockerfile`).

---

## Contingut del repositori

- `docker-compose.yml` → Defineix els serveis i la seva configuració.
- `Dockerfile` → Ha de contenir les instruccions per a construir la imatge del servei web.
- Arxius del projecte → El codi de la teva aplicació web es troba a l’arrel del repositori i es muntarà dins del contenidor.

---

## El `docker-compose.yml`

```yaml
version: "3.8"

services:
  web:
    build: .
    ports:
      - "8080:80"
    volumes:
      - ./:/var/www/html:rw
    restart: unless-stopped
```

### Explicació:
- **`build: .`** → Construeix la imatge a partir del `Dockerfile` local.
- **`ports: "8080:80"`** → Obre el port 80 del contenidor al port 8080 de la màquina host.  
  => Podràs accedir en `http://localhost:8080`.
- **`volumes: ./:/var/www/html:rw`** → Muntatge en mode lectura/escriptura del codi del directori actual dins del contenidor a `/var/www/html`.
- **`restart: unless-stopped`** → El contenidor es reiniciarà automàticament si no fas stop manualment.

---

## ▶️ Com executar el projecte

1. **Clona el repositori**:
   ```bash
   git clone https://github.com/usuari/el-teu-repo.git
   cd el-teu-repo
   ```

2. **Construeix i desplega el servei**:
   ```bash
   docker-compose up --build -d
   ```

3. **Accedeix al navegador**:
   ```
   http://localhost:8080
   ```

---

## Parar i netejar

Per a parar el servei:
```bash
docker-compose down
```

---

## 📝 Notes

- Pots personalitzar el teu `Dockerfile` per afegir extensions, mòduls o dependències necessàries.
- Recorda que els canvis al codi font es reflectiran immediatament al contenidor gràcies al muntatge de volums.

---
(cc) xaviblanes 25/26
---
