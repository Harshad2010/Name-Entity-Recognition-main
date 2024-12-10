FROM google/cloud-sdk:latest

WORKDIR /app

COPY . /app

RUN apt update -y &&  \
    apt-get update &&  \
    apt-get install ffmpeg libsm6 libxext6  -y \
    python3 python3-pip

RUN apt-get install apt-transport-https ca-certificates gnupg -y && apt install python3 -y

# Install pipx
RUN python3 -m pip install --user pipx && \
    python3 -m pipx ensurepath

# Install torch using pipx
RUN pipx install torch --pip-args="--extra-index-url https://download.pytorch.org/whl/cpu"

# Use pipx to install dependencies from requirements.txt
RUN pipx install pipx-run && \
    pipx run pip install -r requirements.txt

CMD ["python3", "app.py"]

