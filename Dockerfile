#Starts from a base image
FROM python:3.12-slim-bookworm                                   

#Specify the maintainer of Dockerfile
LABEL maintainer="Chinedu Olebu"         

#Display the python execution steps
ENV PYTHONUNBUFFERED 1                     

#Copy the entire project folder to image /app folder
COPY .  /app              

#Make sure that /app is the working directory
WORKDIR  /app                    

#Upgrade python package installer
RUN pip install --upgrade pip                 

#Install the django
RUN pip install -r requirements.txt                        

#Expose the container port to the host machine
EXPOSE 8000                     

#Run app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
      