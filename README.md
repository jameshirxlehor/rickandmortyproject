# 🛸 Rick and Morty Flutter App

Um aplicativo simples que consome a [Rick and Morty API](https://rickandmortyapi.com/) e exibe informações sobre personagens da série.  
Desenvolvido como desafio técnico, aplicando princípios de **Clean Architecture** e **Clean Code** para garantir organização, manutenibilidade e escalabilidade.

---
## 🛠️ Tecnologias Utilizadas
- [Flutter](https://flutter.dev/) (última versão estável)
- [Dart](https://dart.dev/)
- Gerenciamento de estado simples (`SetState`)
- [Package Dio](https://pub.dev/packages/dio) para consumo da API

---
## 🚀 Funcionalidades
- Lista de personagens com **imagem, nome e status**.
- Paginação para carregar os personagens aos poucos.
- Tela de detalhes com:
    - Nome
    - Imagem
    - Status (vivo, morto ou desconhecido)
    - Espécie
    - Origem
    - ID
- Navegação entre páginas.
- UI simples, mas organizada, com cards estilizados.

---
## 📂 Estrutura do Projeto (Clean Architecture Simplificada)
```bash
lib/
├── features/                
│   └── characters/
│       ├── domain/      
│       ├── data/        
│       └── presentation/
└── main.dart            
```

---
## 🌌 Gerenciamento de Estado
Optei por utilizar `setState` para o gerenciamento de estado.  
Como o desafio limita o app a no máximo 3 páginas e a complexidade é baixa, o `setState` foi suficiente para:
- Atualizar a lista de personagens com paginação.
- Controlar estados de loading e "carregar mais".
- Atualizar a UI ao navegar para os detalhes.

Essa decisão evita a adição de dependências desnecessárias e mantém o código simples e acessível para qualquer desenvolvedor rodar e entender. Caso o app cresça em funcionalidades, o próximo passo natural seria migrar para uma dependência.

---
## ▶️ Como Executar o App Localmente
![](https://img.icons8.com/?size=100&id=17836&format=png&color=000000)
- #### Pré-requisitos
  - Flutter SDK (última versão estável)
  - Editor de código (ex: VS Code ou Android Studio)
  - Emulador Android ou dispositivo físico conectado

- #### Passos
  - 1º Execute o comando `git clone` no [Repositório do Projeto](https://github.com/jameshirxlehor/rickandmortyproject.git)
  - 2º Entre na pasta do projeto: `cd rickandmortyproject`
  - 3º Instale as dependências: `flutter pub get`
  - 4º Execute no emulador ou dispositivo físico: `flutter run`
#
![](https://img.icons8.com/?size=100&id=85906&format=png&color=000000)
- #### Pré-requisitos
  - Flutter SDK (última versão estável)
  - Editor de código (ex: VS Code ou Android Studio)
  - Xcode instalado (somente em macOS)
  - Emulador iOS ou dispositivo físico conectado

- #### Passos
  - 1º Execute o comando `git clone` no [Repositório do Projeto](https://github.com/jameshirxlehor/rickandmortyproject.git)
  - 2º Entre na pasta do projeto: `cd rickandmortyproject`
  - 3º Instale as dependências: `flutter pub get`
  - 4º Configure os pods do iOS.
  - 5º Execute no emulador ou dispositivo físico: `flutter run`

---
## 📱 Demonstração
- [▶️ Clique aqui para assistir ao vídeo](https://youtube.com/shorts/u1WTMsoAbuc)
- [📦 Baixar APK Release (Android)](https://drive.google.com/file/d/1SVVuPByPW4fDOyle8EXXeQZbjiw7cUS-/view?usp=sharing)

---
## 👨‍💻 Autor
- #### James Hirxlehor
- [LinkedIn](https://www.linkedin.com/in/jameshirxlehor) | [GitHub](https://github.com/jameshirxlehor)
