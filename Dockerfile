# Use an official Python runtime as a parent image
FROM nvidia/cuda:12.6.0-cudnn-devel-ubuntu22.04

# Set the working directory in the container
WORKDIR /app

# Install git so we can clone the GitHub repository
RUN apt-get update && apt-get install -y git

# Clone the repository containing the requirements files
RUN git clone https://github.com/leandromugnaini/ml-env-setup.git

# Choose which requirements file to use, e.g., basic, gpu, or advanced
# You can switch this filename depending on your needs
RUN cp ml-env-setup/requirements_test.txt ./requirements.txt

# Install Python pip
RUN set -xe \
    && apt-get update -y \
    && apt-get install -y python3-pip

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt
