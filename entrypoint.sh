FROM python:3.10-slim


WORKDIR /app


RUN apt-get update && apt-get install -y cron curl xmlsec1 && rm -rf /var/lib/apt/lists/*


ADD https://github.com/aptible/supercronic/releases/latest/download/supercronic-linux-amd64 /usr/local/bin/supercronic
RUN chmod +x /usr/local/bin/supercronic
   
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt


COPY . /app/


# Copiar el archivo entrypoint.sh y asegurarse de que sea ejecutable
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh


EXPOSE 8000


# Configurar el entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
