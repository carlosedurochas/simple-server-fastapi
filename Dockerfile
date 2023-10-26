# use the official python image as a parent image
FROM python:3.9-slim

# set the working directory inside the container
WORKDIR /app

# copy the current directory contents into the container at /app
COPY . /app

# install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# expose the port that your FastAPI application will run on
EXPOSE 8000

# define environment variable for the FastAPI app to run in production mode
ENV FASTAPI_ENV=production

# run FastAPI application using uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
