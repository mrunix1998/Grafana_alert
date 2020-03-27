# This docker file is automatically created by 'no-headache-django' project.
# Please star me on github: http://github.com/mrsaemir/no-headache-django

FROM python:3.6

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt update && apt install -y libpq-dev

RUN useradd -ms /bin/bash user

WORKDIR /home/user/project_core
COPY . /home/user/project_core

RUN mkdir -p /home/user/media
RUN mkdir -p /home/user/static

EXPOSE 8000

RUN pip install --default-timeout=100 -r requirements.txt

RUN chmod -R 777 /home/user
RUN chmod +x entrypoint.sh

USER user
CMD ["bash", "/home/user/project_core/entrypoint.sh"]
