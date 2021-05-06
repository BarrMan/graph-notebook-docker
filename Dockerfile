FROM python:3.6.13-slim

USER root

RUN pip install --upgrade pip

# pin specific versions of Jupyter and Tornado dependency
RUN pip install notebook==5.7.10
RUN pip install tornado==4.5.3

# install the package
RUN pip install graph-notebook

# install and enable the visualization widget
RUN jupyter nbextension install --py --sys-prefix graph_notebook.widgets
RUN jupyter nbextension enable  --py --sys-prefix graph_notebook.widgets

# copy static html resources
RUN python -m graph_notebook.static_resources.install
RUN python -m graph_notebook.nbextensions.install

RUN python -m pip install ipykernel
RUN python -m ipykernel install --user

RUN pip install boto3

# add nbextensions
RUN pip install jupyter_contrib_nbextensions
RUN pip install jupyter_nbextensions_configurator
RUN jupyter contrib nbextension install
RUN jupyter nbextensions_configurator enable

RUN mkdir -p $HOME/notebook

WORKDIR $HOME/notebook

# copy premade starter notebooks
RUN python -m graph_notebook.notebooks.install --destination ~/notebook/examples

ENTRYPOINT ["/bin/bash", "-c", "jupyter notebook --NotebookApp.token='' --allow-root --ip=0.0.0.0 --port=8888 ~/notebook"]
