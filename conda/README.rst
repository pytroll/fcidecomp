EUMETSAT FCIDECOMP Conda recipe
===============================

Manual build and installation instructions
------------------------------------------

The FCIDECOMP software can be manually built as a Conda package and installed using the provided Conda recipe.

Pre-requisites
~~~~~~~~~~~~~~

Build of the Conda package and its installation require:

- ``conda``, installed as described
  `here <https://conda.io/projects/conda/en/latest/user-guide/install/index.html>`_

- ``conda-build``, installed as described `here <https://docs.conda.io/projects/conda-build/en/latest/>`_

- a connection to internet


Conda package build
~~~~~~~~~~~~~~~~~~~

To build the Conda package, run the following command from within the ``conda`` directory (replace $BUILD_DIRECTORY)
with the path to the directory where conda packages have to be dumped)::

    conda build . --output-folder $BUILD_DIRECTORY

Once Conda packages have been successfully built, create a new ``conda`` environment. Let's call it ``fcidecomp``, but
any valid name would do (change the following instructions accordingly)::

    conda create -n fcidecomp python=3.7


Activate the environment::

    conda activate fcidecomp


- On Linux, execute::

    conda install -y --override-channels -c anaconda -c conda-forge -c $BUILD_DIRECTORY fcidecomp



