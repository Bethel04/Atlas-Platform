FROM ubuntu:24.04

COPY hello.txt /hello.txt

RUN cat /hello.txt

CMD ["cat", "hello.txt"]