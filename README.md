# BankCol - Billetera Virtual Android

## Descripción
Aplicación de billetera virtual para Android desarrollada nativamente con Kotlin que permite crear una única cuenta por usuario, verificada mediante SMS y Google, para realizar transferencias simuladas en tiempo real.

## Tabla de Contenidos
1. [Características Principales](#características-principales)
2. [Tecnologías](#tecnologías)
3. [Requisitos](#requisitos)
4. [Instalación](#instalación)
5. [Estructura del Proyecto](#estructura-del-proyecto)
6. [Seguridad](#seguridad)
7. [Testing](#testing)
8. [Documentación](#documentación)

## Características Principales
- Autenticación única por usuario (SMS + Google)
- Perfil verificado con datos personales
- Transferencias simuladas en tiempo real
- Historial de transacciones
- Balance virtual
- Notificaciones push

## Tecnologías
### Frontend
- Kotlin
- Jetpack Compose
- ViewModel + LiveData
- Coroutines
- Navigation Component

### Backend (Firebase)
- Authentication
- Cloud Firestore
- Cloud Functions
- Cloud Messaging

### Herramientas de Desarrollo
- Android Studio / VS Code
- Git
- Android Debug Bridge (ADB)

## Requisitos
- Windows 10/11
- Android Studio Arctic Fox o superior
- JDK 11+
- Dispositivo Android 6.0+ o emulador
- Cuenta de Firebase (plan gratuito)

## Instalación
1. **Preparar Entorno**
```bash
git clone https://github.com/Bromeropk12/BankCol.git
cd BankCol
./gradlew build
```

2. **Configurar Firebase**
- Crear proyecto en Firebase Console
- Añadir app Android
- Descargar google-services.json
- Colocar en app/

## Estructura del Proyecto
```
app/
├── src/
│   ├── main/
│   │   ├── java/com/bankcol/
│   │   │   ├── data/
│   │   │   ├── di/
│   │   │   ├── domain/
│   │   │   ├── presentation/
│   │   │   └── utils/
│   │   ├── res/
│   │   └── AndroidManifest.xml
│   └── test/
└── build.gradle
```

## Seguridad
### Implementación
- Validación en cliente y servidor
- Cifrado de datos sensibles
- Tokens JWT
- Reglas Firestore
- Verificación de identidad

### Reglas Firestore
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read: if request.auth.uid == userId;
      allow write: if request.auth.uid == userId;
    }
  }
}
```

## Testing
### Pruebas Unitarias
```kotlin
@Test
fun loginTest() {
    runBlocking {
        // Implementación
    }
}
```

### Pruebas de Integración
- Pruebas de UI con Espresso
- Pruebas de navegación
- Pruebas de repositorio
- Pruebas de ViewModel

## Documentación
### Para Desarrolladores
- Guía de instalación
- API Reference
- Guía de arquitectura

### Para Usuarios
- Manual de uso
- FAQ
- Políticas de uso
- Soporte

## Contribución
1. Fork del repositorio
2. Crear branch: `feature/nueva-funcionalidad`
3. Commit cambios: `git commit -m 'Añadir nueva funcionalidad'`
4. Push: `git push origin feature/nueva-funcionalidad`
5. Crear Pull Request

## Licencia
MIT

## Contacto
- Desarrollador: Briann Sneyder Romero 
- Email: Bromero12@uan.edu.co
- GitHub: Bromeropk12

## Estado del Proyecto
- Versión: 1.0.0
- Estado: En Desarrollo

