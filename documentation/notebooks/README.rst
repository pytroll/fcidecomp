EUMETSAT FCIDECOMP example notebooks
====================================

The available Jupyter notebooks provide examples on the different ways in which the FCIDECOMP software can be used.

Prerequisites
-------------

- a ``conda`` environment with the FCIDECOMP software installed (see INSTALL.rst).

- ``notebook``, installed in the ``conda`` environment as described `here <https://anaconda.org/anaconda/notebook>`_

Setting up the environment
--------------------------

In order to make the ``conda`` environment available from within the Jupyter notebooks, the following lines of code need
to be executed. First, activate the ``conda`` environment. Let's call it ``fcidecomp``, but any valid name would do
(change the following instructions accordingly)::

    conda activate fcidecomp


Install ``ipykernell``::

    conda install -c anaconda ipykernel


Enable the ``conda`` environment in Jupyter ``notebook``::

    python -m ipykernel install --user --name=fcidecomp


Start the notebooks
-------------------



