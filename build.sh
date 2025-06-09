#!/bin/zsh

# Configuração
export NODE_ENV=production
export HUGO_ENV=production

# Verifica dependências
echo "🔍 Verificando dependências..."
command -v npm >/dev/null 2>&1 || { echo "❌ npm não está instalado. Por favor, instale o Node.js"; exit 1; }
command -v hugo >/dev/null 2>&1 || { echo "❌ hugo não está instalado. Por favor, instale o Hugo"; exit 1; }
command -v convert >/dev/null 2>&1 || { echo "⚠️ ImageMagick não está instalado. Otimização de imagens será ignorada"; }

echo "🚀 Iniciando build otimizado..."

# Instala/atualiza dependências
echo "📦 Atualizando dependências..."
npm install

# Limpar caches e arquivos antigos
echo "🧹 Limpando caches..."
rm -rf public/
rm -rf resources/_gen/
rm -f .hugo_build.lock

# Otimizar imagens
echo "🖼️ Otimizando imagens..."
find static/images -type f \( -name "*.jpg" -o -name "*.png" \) -exec convert {} -strip -quality 85 {} \;

# Build do Hugo com otimizações
echo "🛠️ Executando build do Hugo..."
HUGO_ENV="production" hugo --gc --minify

# Otimização pós-build
echo "✨ Executando otimizações pós-build..."

# Adicionar headers de cache
echo "📦 Configurando headers de cache..."
cat > public/_headers << EOL
/*
  Cache-Control: public, max-age=3600
  X-Frame-Options: DENY
  X-Content-Type-Options: nosniff

/*.css
  Cache-Control: public, max-age=31536000, immutable

/*.js
  Cache-Control: public, max-age=31536000, immutable

/images/*
  Cache-Control: public, max-age=31536000, immutable

/fonts/*
  Cache-Control: public, max-age=31536000, immutable
EOL

echo "✅ Build completado com sucesso!"
