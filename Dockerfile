FROM alpine:3.5

RUN apk add --update py2-pip

COPY Requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/Requirements.txt

COPY index.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

EXPOSE 3000

CMD ["python", "/usr/src/app/index.py"]