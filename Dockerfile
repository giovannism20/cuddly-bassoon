# Use uma imagem base oficial do Python
FROM python:3.12.0

# Defina o diretório de trabalho no contêiner
WORKDIR /app

# Copie os arquivos de requisitos primeiro para aproveitar o cache do Docker
COPY requirements.txt .

# Instale as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Copie o restante dos arquivos do projeto
COPY . .

# Comando para executar a aplicação
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
