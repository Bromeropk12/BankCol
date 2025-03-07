# BankCol - Billetera Virtual Android

## Descripción
Aplicación de billetera virtual para Android desarrollada con Flutter y Firebase que permite crear una única cuenta por usuario, verificada mediante SMS y Google, para realizar transferencias simuladas en tiempo real.

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
- Flutter SDK
- Material Design
- Provider para estado
- GetX para navegación

### Backend (Firebase)
- Authentication
- Cloud Firestore
- Cloud Functions (opcional)
- Cloud Messaging

### Herramientas de Desarrollo
- Android Studio / VS Code
- Git
- Flutter DevTools

## Requisitos
- Windows 10/11
- Flutter SDK 3.0+
- Android Studio
- JDK 11+
- Dispositivo Android 6.0+ o emulador
- Cuenta de Firebase (plan gratuito)

## Instalación
1. **Preparar Entorno**
```bash
flutter doctor
git clone https://github.com/Bromeropk12/BankCol.git
cd BankCol
flutter pub get
```

2. **Configurar Firebase**
- Crear proyecto en Firebase Console
- Añadir app Android
- Descargar google-services.json
- Colocar en android/app/
- Habilitar servicios necesarios

3. **Variables de Entorno**
```dart
// filepath: lib/config/env.dart
const FIREBASE_API_KEY = "tu_api_key";
const FIREBASE_PROJECT_ID = "tu_proyecto_id";
```

## Estructura del Proyecto
```
lib/
├── main.dart
├── config/
├── models/
├── screens/
├── services/
├── widgets/
└── utils/

database/
└── users/
    ├── userId/
    │   ├── profile/
    │   ├── account/
    │   └── transactions/
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
```dart
// filepath: test/auth_test.dart
void main() {
  testWidgets('Login test', (WidgetTester tester) async {
    // Implementación
  });
}
```

### Pruebas de Integración
- Flujos completos de usuario
- Transacciones
- Autenticación
- UI/UX

## Documentación
### Para Desarrolladores
- Guía de instalación
- API Reference


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


## Contacto
- Desarrollador: Briann Sneyder Romero 
- Email: Bromero12@uan.edu.co
- GitHub: Bromeropk12

## Estado del Proyecto
- Versión: 1.0.0
- Estado: En Desarrollo

