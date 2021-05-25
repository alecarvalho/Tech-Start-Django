FROM python:latest
COPY . /var/www
WORKDIR /var/www
RUN pip install poetry && poetry config virtualenvs.create false && poetry install
ENV PORT=8000
EXPOSE $PORT
ENTRYPOINT python manage.py migrate && python manage.py runserver 0.0.0.0:8000 --noreload