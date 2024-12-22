FROM alpine:3.5
FROM python:3.10-slim

RUN apk add --update py2-pip

# Install dependencies
RUN apt-get update && apt-get install -y ca-certificates

# Upgrade pip
RUN python -m pip install --upgrade pip

COPY Requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/Requirements.txt

COPY index.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

EXPOSE 3000

CMD ["python", "/usr/src/app/index.py"]