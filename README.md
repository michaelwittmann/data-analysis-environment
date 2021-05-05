# data-analysis-environment
A Python docker image with my most needed data analaytics libraries.

## Jupyter Notebook
Start jupyter server
```bash
docker run -p 8888:8888 -v MOUNT_PATH:/home/ubuntu/ --name jupyter-server micwittmann/data-analysis-environment:python3.8-with-dependencies jupyter notebook --allow-root --ip=0.0.0.0 --no-browser --NotebookApp.token='' --NotebookApp.password=''
```