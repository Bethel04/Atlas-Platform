FROM python:3.14.4
WORKDIR /atlas-app
COPY app.py .
COPY requirements.txt .
RUN pip install -r requirements.txt  
EXPOSE 8080
CMD ["python","app.py"]