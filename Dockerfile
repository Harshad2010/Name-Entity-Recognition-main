FROM google/cloud-sdk:latest

WORKDIR /app

COPY . /app

RUN apt update -y &&  \
    apt-get update &&  \
    apt-get install ffmpeg libsm6 libxext6  -y

RUN apt-get install apt-transport-https ca-certificates gnupg -y && apt install python3 -y

RUN pip install torch --extra-index-url https://download.pytorch.org/whl/cpu && pip install -r requirements.txt

CMD ["python3", "app.py"]

