Deployment
----------

The following paragraphs outline the strategy to deploy the FCIDECOMP package.

CI/CD pipelines
~~~~~~~~~~~~~~~

We will implement simple GitLab CI/CD pipelines to compile, build, test and possibly upload the conda packages to
EUMETSAT Anaconda repository.

At least two GitLab runners will be implemented, one with a Docker executor on Linux and the other with a Shell
executor on Windows.