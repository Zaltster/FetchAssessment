FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

# Create a shell script to run both the training and the app
RUN echo '#!/bin/bash\npython model/train.py && python app/main.py' > /app/run.sh
RUN chmod +x /app/run.sh

# Use the shell script as the entrypoint
ENTRYPOINT ["/app/run.sh"]