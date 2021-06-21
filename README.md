# data-analysis-environment
A Python docker image with my most needed libraries for spatio temporal mobility data analysis.

## Jupyter Notebook
Juypter Notebooks, are great for Data Analysis Scripts. With this docker images, you can easily start a Jupyter Server for spatio-temporal data analysis on your local machine or a remote host. 

### Start jupyter server manually

```bash
docker run -p 8888:8888 -v MOUNT_PATH:/home/ubuntu/ --name jupyter-server micwittmann/data-analysis-environment:python3.8-with-dependencies jupyter notebook --allow-root --ip=0.0.0.0 --no-browser --NotebookApp.token='' --NotebookApp.password=''
```
Jupyter is now reachable under `localhost:8888`. 
Replace `MOUNT_PATH` with your project folder.
If you run jupyter locally, it's usually not nescecarry to set a password or token. However, be aware that others in oyur local network may be able to reach your jupyter sever if your firewall allows others to connect to your machine on port 8888. 
If you want to set a password and/or token, just add your super secret password in the command below.

### Start jupyter server autmatically via system service (Linux)

Create a new file `/etc/systemd/system/data-analysis-jupyter-notebook.service`:
Replace `MOUNT_PATH` and `YOURSUPERSECRETTOKEN` with your own values. 

 ```bash
[Unit]
Description=Jupyter Server for spatio temporal data analysis
After=docker.service
Requires=docker.service


[Service]
TimeoutStartSec=0
Restart=always
ExecStartPre=/usr/bin/docker exec %n stop
ExecStartPre=/usr/bin/docker rm %n
ExecStartPre=/usr/bin/docker pull micwittmann/data-analysis-environment:python3.8-with-dependencies
ExecStart=/usr/bin/docker run --rm --name %n \
    -v MOUNT_PATH:/home/ubuntu/ \
    -p 8888:8888 \
    micwittmann/data-analysis-environment:python3.8-with-dependencies \
    jupyter notebook --allow-root --ip=0.0.0.0 --no-browser \
        --NotebookApp.token='YOURSUPERSECRETTOKEN'\


[Install]
WantedBy=multi-user.target
```
Enable your system Service:

``` bash
sudo systemctl enable data-analysis-jupyter-notebook
```
Usually the service should start automatically, also after reboot. In case you need to start/stop the service manually use:

``` bash
sudo service data-analysis-jupyter-notebook start     # Start the service
sudo service data-analysis-jupyter-notebook stop      # Stop the service
sudo service data-analysis-jupyter-notebook status    # Check status
```

