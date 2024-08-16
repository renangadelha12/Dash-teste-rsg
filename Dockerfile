# Use uma imagem base do Python
FROM python:3.9-slim

# Configurar o diretório de trabalho
WORKDIR /app

# Copiar o arquivo requirements.txt para o diretório de trabalho
COPY requirements.txt .

# Instalar as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o restante do código da aplicação
COPY . .

# Expor a porta onde a aplicação irá rodar
EXPOSE 8080

# Comando para iniciar o servidor
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
