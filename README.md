# HUGO

Hugo is a static site generator that makes it easy to setup your own blog or personal website.

## Adding content

You can manually create content files (for example as `content/<CATEGORY>/<FILE>.<FORMAT>`) and provide metadata in them, however you can use the `new` command to do a few things for you (like add title and date):

```sh
$ hugo new posts/my-post.md
```

by default, this template creates a `posts/hello.md` for you, feel free to remove / rename it if you want.

## Changing themes

- Explore themes [here](https://themes.gohugo.io/)
- Download theme to `themes/<NAME>`

```sh
git clone https://github.com/siegerts/hugo-theme-basic themes/basic
```

- Change `theme` entry in `config.toml` to the theme name

For more, checkout [official documentations](https://gohugo.io/documentation/).

## Build e Deploy

Para gerar o site estático, execute:

```sh
hugo
```

Os arquivos gerados ficarão na pasta `public/`, que **não deve ser versionada** (veja `.gitignore`).

Para deploy, envie o conteúdo da pasta `public/` para seu serviço de hospedagem (ex: GitHub Pages, Vercel, Netlify, etc).

## Estrutura de Estilos Customizados

Os estilos customizados do site estão em `assets/css/custom.css` e são importados via partial `extend_head.html`. Edite esse arquivo para personalizar o visual do blog.
