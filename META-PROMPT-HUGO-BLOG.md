
# 🚀 META-PROMPT: Template de Blog Hugo com PaperMod

## 📋 Descrição Geral
Este meta-prompt foi desenvolvido para criar um template de blog completo e customizável utilizando o framework Hugo com o tema PaperMod. O template é inspirado no design do Twitter/X e inclui suporte completo para LaTeX, estrutura de navegação profissional e otimizações para GitHub Pages.

---

## 🎯 Objetivos do Template

### Principais Funcionalidades
- ✅ **Design Responsivo**: Layout adaptável inspirado no Twitter/X
- ✅ **Suporte LaTeX**: Renderização de equações matemáticas
- ✅ **SEO Otimizado**: Configurações avançadas para mecanismos de busca
- ✅ **GitHub Pages Ready**: Configuração para deploy automático
- ✅ **Multilíngue**: Suporte ao português brasileiro
- ✅ **Performance**: Otimizado para carregamento rápido

### Estrutura de Navegação
1. **Início** - Página principal com perfil do autor
2. **Sobre** - Apresentação pessoal e profissional
3. **Projetos** - Portfolio de trabalhos desenvolvidos
4. **Blog** - Artigos e posts técnicos
5. **Contato** - Informações de contato e redes sociais

---

## ⚙️ Configuração Inicial

### 1. Instalação do Tema
```bash
# Clone do tema PaperMod (comando já executado)
git clone https://github.com/adityatelange/hugo-PaperMod themes/PaperMod --depth=1
```

### 2. Configuração Base (config.toml)
```toml
# URL base do site - CUSTOMIZÁVEL
baseURL = 'https://sherlockramos.blog'

# Idioma principal - CUSTOMIZÁVEL
languageCode = 'pt-br'

# Título do site - CUSTOMIZÁVEL
title = 'Sherlock Ramos Blog'

# Tema utilizado
theme = "PaperMod"
```

### 3. Informações do Autor - SEÇÃO CUSTOMIZÁVEL
```toml
[params.profileMode]
  enabled = true
  title = "Sherlock Ramos"                    # ALTERAR: Nome do autor
  subtitle = "Desenvolvedor, Escritor e Pensador"  # ALTERAR: Subtítulo/profissão
  imageUrl = "https://pbs.twimg.com/profile_images/1848910652808613888/r81-u5pP_400x400.jpg"  # ALTERAR: URL da foto
  imageWidth = 120
  imageHeight = 120
```

### 4. Redes Sociais - SEÇÃO CUSTOMIZÁVEL
```toml
[[params.socialIcons]]
  name = "twitter"
  url = "https://twitter.com/GatoMaconhado_"  # ALTERAR: Handle do Twitter

[[params.socialIcons]]
  name = "github"
  url = "https://github.com/sherlockramos"   # ALTERAR: Username do GitHub
```

---

## 🎨 Personalização Visual

### Cores Inspiradas no Twitter/X
O template inclui CSS customizado que replica as cores do Twitter:

```css
:root {
  --primary-color: #1da1f2;     /* Azul principal do Twitter */
  --secondary-color: #14171a;   /* Texto escuro */
  --accent-color: #657786;      /* Cor secundária */
  --background-color: #ffffff;  /* Fundo claro */
}
```

### Modo Escuro - CUSTOMIZÁVEL
```css
[data-theme="dark"] {
  --primary-color: #1da1f2;
  --background-color: #15202b;  /* Fundo escuro do Twitter */
  --text-color: #ffffff;
}
```

### Como Customizar as Cores:
1. Acesse o arquivo `layouts/partials/extend_head.html`
2. Modifique as variáveis CSS na seção `:root`
3. Adicione novas variáveis conforme necessário

---

## 📝 Estrutura de Conteúdo

### Páginas Principais
Cada página principal foi criada com frontmatter específico:

#### 1. Página Sobre (`content/about.md`)
**Elementos Customizáveis:**
- Biografia pessoal
- Experiência profissional  
- Filosofia de trabalho
- Links para redes sociais

#### 2. Página Projetos (`content/projects.md`)
**Estrutura Sugerida:**
- Projetos em destaque
- Projetos open source
- Aplicações mobile
- Projetos acadêmicos
- Estatísticas dos projetos

#### 3. Página Contato (`content/contact.md`)
**Informações Incluídas:**
- Formas de contato
- Disponibilidade
- Tipos de colaboração
- Informações para primeiro contato

### Posts do Blog
**Template de Frontmatter para Posts:**
```yaml
---
title: "Título do Post"                    # CUSTOMIZÁVEL
date: 2024-01-01T10:00:00-03:00          # CUSTOMIZÁVEL
draft: false
tags: ["tag1", "tag2"]                    # CUSTOMIZÁVEL
categories: ["Categoria"]                 # CUSTOMIZÁVEL
author: "Nome do Autor"                   # CUSTOMIZÁVEL
description: "Descrição do post"          # CUSTOMIZÁVEL
---
```

---

## 🧮 Suporte ao LaTeX

### Configuração MathJax
O template inclui suporte completo ao LaTeX através do MathJax:

```html
<!-- Já incluído em layouts/partials/extend_head.html -->
<script>
  MathJax = {
    tex: {
      inlineMath: [['\\(', '\\)']],      # Para equações inline
      displayMath: [['\\[', '\\]']],     # Para equações em bloco
      processEscapes: true,
      processEnvironments: true
    }
  };
</script>
```

### Como Usar LaTeX nos Posts:
- **Equações inline:** `\(E = mc^2\)`
- **Equações em bloco:** `\[F = ma\]`
- **Frações:** `\(\frac{a}{b}\)`
- **Somatórios:** `\(\sum_{i=1}^{n} x_i\)`

---

## 🚀 Deploy no GitHub Pages

### Configuração Automática
O template está configurado para deploy automático no GitHub Pages:

1. **Criar repositório no GitHub**
2. **Fazer push do código**
3. **Configurar GitHub Actions** (se necessário)
4. **Acessar via GitHub Pages**

### Arquivo .github/workflows/hugo.yml (Opcional)
```yaml
name: Deploy Hugo site to Pages

on:
  push:
    branches: ["main"]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          submodules: recursive
      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'
      - name: Build
        run: hugo --minify
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v2
        with:
          path: ./public
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v2
```

---

## 🔧 Customizações Avançadas

### Adicionar Nova Seção ao Menu
```toml
[[menu.main]]
  identifier = "nova-secao"           # ID único
  name = "Nova Seção"                # Nome exibido
  url = "/nova-secao/"               # URL da página
  weight = 60                        # Ordem no menu
```

### Personalizar Cores do Tema
1. Edite `layouts/partials/extend_head.html`
2. Modifique as variáveis CSS
3. Adicione novos estilos conforme necessário

### Adicionar Google Analytics
```toml
[params]
  googleAnalytics = "GA_MEASUREMENT_ID"  # ALTERAR: Seu ID do GA
```

### Configurar Comentários
```toml
[params]
  comments = true
  [params.comments]
    provider = "disqus"              # ou "utterances"
    disqus_shortname = "seu-site"    # ALTERAR: Seu shortname
```

---

## 📋 Checklist de Customização

### ✅ Configurações Obrigatórias
- [ ] Alterar `baseURL` no config.toml
- [ ] Atualizar informações do autor
- [ ] Configurar redes sociais
- [ ] Personalizar página "Sobre"
- [ ] Adicionar projetos na página "Projetos"
- [ ] Configurar informações de contato

### ✅ Configurações Opcionais
- [ ] Personalizar cores do tema
- [ ] Adicionar Google Analytics
- [ ] Configurar sistema de comentários
- [ ] Adicionar novas seções ao menu
- [ ] Personalizar favicons
- [ ] Configurar SEO avançado

### ✅ Conteúdo
- [ ] Criar primeiro post de apresentação
- [ ] Adicionar projetos relevantes
- [ ] Escrever biografia completa
- [ ] Preparar imagens e assets
- [ ] Revisar todos os textos

---

## 🛠️ Comandos Úteis

### Desenvolvimento Local
```bash
# Iniciar servidor de desenvolvimento
hugo server -D

# Gerar site estático
hugo

# Criar novo post
hugo new posts/nome-do-post.md

# Criar nova página
hugo new nome-da-pagina.md
```

### Manutenção
```bash
# Atualizar tema
cd themes/PaperMod
git pull origin master

# Limpar cache
hugo --gc

# Verificar configuração
hugo config
```

---

## 📚 Recursos Adicionais

### Documentação Oficial
- [Hugo Documentation](https://gohugo.io/documentation/)
- [PaperMod Theme](https://github.com/adityatelange/hugo-PaperMod)
- [GitHub Pages](https://pages.github.com/)

### Tutoriais Recomendados
- Como escrever em Markdown
- Otimização de SEO para Hugo
- Configuração avançada do PaperMod

---

## 🤝 Suporte e Contribuições

### Problemas Comuns
1. **Site não carrega:** Verificar baseURL
2. **LaTeX não renderiza:** Verificar MathJax
3. **Tema não aplica:** Verificar nome do tema

### Como Contribuir
1. Fork do repositório
2. Criar branch para feature
3. Commit das alterações
4. Pull request com descrição detalhada

---

## 📄 Licença

Este template é fornecido sob licença MIT. Sinta-se livre para usar, modificar e distribuir conforme necessário.

---

*Template criado por Sherlock Ramos - [@GatoMaconhado_](https://twitter.com/GatoMaconhado_)*
*Última atualização: Janeiro 2024*
