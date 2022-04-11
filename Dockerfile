# set base image (host OS)
FROM python:3.8

WORKDIR /code

COPY requirements.txt .
RUN pip install -r requirements.txt
COPY bert-large-uncased/ ./bert-large-uncased
COPY flask-summary/ ./flask-summary
COPY nltk_data/ ./nltk_data
COPY sfbu19609.sh .
RUN chmod +x sfbu19609.sh
CMD ["/bin/bash", "/code/sfbu19609.sh"]

# CMD [ "python", "./flask-summary/app.py" ]
